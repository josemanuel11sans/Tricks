package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.CargaMasivaDAO;
import mx.edu.utez.tricks.dao.HistorialDao;
import mx.edu.utez.tricks.model.Aspirante;
import mx.edu.utez.tricks.model.Historial;
import org.apache.commons.fileupload2.core.DiskFileItemFactory;
import org.apache.commons.fileupload2.core.FileItem;
import org.apache.commons.fileupload2.core.FileUploadException;
import org.apache.commons.fileupload2.jakarta.JakartaServletFileUpload;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@MultipartConfig  // indica que el servlet puede manejar envíos de archivos
@WebServlet(name = "CargaMasivaAspirantesServlet", value = "/cargaraspirantes") // mapea este servlet a la URL /cargaraspirantes
public class CargarMasivaAspirantesServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mensajeError = "";

        if (JakartaServletFileUpload.isMultipartContent(request)) { // comprueba si la solicitud contiene datos en el archivo
            try {
                // configura el manejo de archivos subidos
                DiskFileItemFactory fabrica = DiskFileItemFactory.builder().get();
                JakartaServletFileUpload carga = new JakartaServletFileUpload(fabrica);

                // verifica si el archivo no es un campo de formulario
                // se obtiene el nombre del archivo y procesa el archivo según su tipo
                List<FileItem> archivos = carga.parseRequest(request);
                for (FileItem item : archivos) {
                    if (!item.isFormField()) {
                        String nombreArchivo = item.getName();
                        InputStream flujoEntrada = item.getInputStream();
                        if (nombreArchivo.endsWith(".xls") || nombreArchivo.endsWith(".xlsx")) {
                            procesarExcel(flujoEntrada);

                            // Aquí es donde agregas el código del historial
                            Historial historial = new Historial();
                            historial.setDescripcion("Carga masiva de aspirantes realizada");
                            historial.setFecha_creacion(new java.sql.Timestamp(System.currentTimeMillis()));
                            HttpSession session = request.getSession();
                            historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

                            HistorialDao historialDao = new HistorialDao();
                            boolean isInserted = historialDao.insert(historial);

                        } else {
                            mensajeError = "No podemos procesar ese tipo de archivo";
                        }
                    }
                }
            } catch (FileUploadException e) {
                mensajeError = "Error al procesar el archivo de carga: " + e.getMessage();
            } catch (Exception e) {
                mensajeError = "Ocurrió un error inesperado: " + e.getMessage();
            }
        } else {
            mensajeError = "Este servlet solo atiende envío de archivos";
        }

        // Configura el mensaje de error y redirige al JSP
        request.setAttribute("mensajeError", mensajeError);
        response.sendRedirect("html/verAspirantes.jsp");
    }

    private void procesarExcel(InputStream flujoEntrada) throws IOException {
        Workbook libro = new XSSFWorkbook(flujoEntrada);
        Sheet hoja = libro.getSheetAt(0); // Obtener la primera hoja

        // Iterar sobre las filas empezando desde la segunda fila (índice 1)
        for (int i = 1; i <= hoja.getLastRowNum(); i++) {
            Row fila = hoja.getRow(i);

            if (fila != null) {
                // Leer cada celda de la fila
                Cell celdaFolio = fila.getCell(0); // Columna A (Folio)
                Cell celdaNombre = fila.getCell(1); // Columna B (Nombre)
                Cell celdaApellido = fila.getCell(2); // Columna C (Apellido)
                Cell celdaCurp = fila.getCell(3); // Columna D (Curp)
                Cell celdaFechaNacimiento = fila.getCell(4); // Columna E (Fecha de nacimiento)

                // Obtener valores de las celdas
                String folio = obtenerValorCelda(celdaFolio);
                String nombre = obtenerValorCelda(celdaNombre);
                String apellido = obtenerValorCelda(celdaApellido);
                String curp = obtenerValorCelda(celdaCurp);
                Date fechaNacimiento = obtenerFechaCelda(celdaFechaNacimiento);

                // Ajustar los valores de estado y tipo con valores predeterminados
                int estado = 0; // Ajusta según tus necesidades
                int tipo = 1; // Ajusta según tus necesidades

                // Crear objeto Aspirante y cargar datos en la base de datos
                Aspirante aspirante = new Aspirante(folio, nombre, apellido, curp, fechaNacimiento, estado, tipo);

                CargaMasivaDAO dao = new CargaMasivaDAO();
                boolean resultado = dao.CargaMasiva(aspirante);
                // Puedes imprimir los valores o realizar alguna acción adicional aquí

            }
        }

        libro.close();
    }

    private Date obtenerFechaCelda(Cell celda) {
        if (celda == null) {
            return null;
        }

        if (celda.getCellType() == CellType.NUMERIC && DateUtil.isCellDateFormatted(celda)) {
            return celda.getDateCellValue();
        }

        // Si no es una fecha, retornar null o manejar el error de acuerdo a tus necesidades
        return null;
    }

    private String obtenerValorCelda(Cell celda) {
        if (celda == null) {
            return "";
        }

        String valorCelda = "";
        switch (celda.getCellType()) {
            case STRING:
                valorCelda = celda.getStringCellValue();
                break;
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(celda)) {
                    // Convertir la fecha a String en el formato deseado
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Cambia el formato según tus necesidades
                    valorCelda = sdf.format(celda.getDateCellValue());
                } else {
                    valorCelda = String.valueOf(celda.getNumericCellValue());
                }
                break;
            case BOOLEAN:
                valorCelda = String.valueOf(celda.getBooleanCellValue());
                break;
            case FORMULA:
                valorCelda = celda.getCellFormula();
                break;
            case BLANK:
                valorCelda = "";
                break;
            default:
                valorCelda = "Tipo de Celda Desconocido";
                break;
        }
        return valorCelda;
    }
}
