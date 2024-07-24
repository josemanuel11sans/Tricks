package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import mx.edu.utez.tricks.dao.CargaMasivaDAO;
import mx.edu.utez.tricks.model.Aspirante;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.commons.fileupload2.core.DiskFileItemFactory;
import org.apache.commons.fileupload2.core.FileItem;
import org.apache.commons.fileupload2.core.FileUploadException;
import org.apache.commons.fileupload2.jakarta.JakartaServletFileUpload;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@MultipartConfig  // indica que el servlet puede manejar envíos de archivos
@WebServlet(name = "AsignarGrupoServlet", value = "/asignargrupo") // mapea este servlet a la URL /subirExcel
public class AsignarGrupoServlet extends HttpServlet {

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
                        if (nombreArchivo.endsWith(".csv")) {
                            procesarCSV(flujoEntrada);
                        } else if (nombreArchivo.endsWith(".xls") || nombreArchivo.endsWith(".xlsx")) {
                            procesarExcel(flujoEntrada);
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
        response.sendRedirect("html/verGrupos.jsp");
    }

    private void procesarCSV(InputStream flujoEntrada) throws IOException {
        try (InputStreamReader lector = new InputStreamReader(flujoEntrada);
             CSVParser parserCSV = new CSVParser(lector, CSVFormat.DEFAULT.withFirstRecordAsHeader())) {
            for (CSVRecord registroCSV : parserCSV) { // Itera cada fila del archivo sin contar la primera
                // Selecciona el valor de la celda con la cabecera que se llama Column1
                String columna1 = registroCSV.get("Column1");
                // Selecciona el valor de la celda con la cabecera que se llama Column2
                String columna2 = registroCSV.get("Column2");
                System.out.println("Columna1: " + columna1);
                System.out.println("Columna2: " + columna2);
            }
        }
    }

    private void procesarExcel(InputStream flujoEntrada) throws IOException {
        Workbook libro = new XSSFWorkbook(flujoEntrada);
        Sheet hoja = libro.getSheetAt(0); // Obtener la primera hoja

        // Iterar sobre las filas empezando desde la segunda fila (índice 1)
        for (int i = 1; i <= hoja.getLastRowNum(); i++) {
            Row fila = hoja.getRow(i);

            if (fila != null) {
                // Leer la celda de la columna C (índice 2)
                Cell celdaFolio = fila.getCell(2); // Columna C (Folio)

                // Obtener el valor de la celda
                String folio = obtenerValorCelda(celdaFolio);

                // Imprimir el folio
                System.out.println("Folio: " + folio);

                // Aquí puedes agregar el código para guardar los folios o cualquier otra lógica necesaria.

               // Aspirante aspirante = new Aspirante(folio);

                //CargaMasivaDAO doa = new CargaMasivaDAO();
                //boolean resultado = doa.CargaMasiva(aspirante);
            }
        }

        libro.close();
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
