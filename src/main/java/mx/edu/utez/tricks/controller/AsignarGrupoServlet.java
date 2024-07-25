package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.dao.CargaMasivaDAO;
import mx.edu.utez.tricks.model.Aspirante;
import org.apache.commons.fileupload2.core.DiskFileItemFactory;
import org.apache.commons.fileupload2.core.FileItem;
import org.apache.commons.fileupload2.core.FileUploadException;
import org.apache.commons.fileupload2.jakarta.JakartaServletFileUpload;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

@MultipartConfig
@WebServlet(name = "AsignarGrupoServlet", value = "/asignargrupo")
public class AsignarGrupoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String mensajeError = "";
        String idGrupo = null;

        if (JakartaServletFileUpload.isMultipartContent(request)) {
            try {
                DiskFileItemFactory factory = DiskFileItemFactory.builder().get();
                JakartaServletFileUpload upload = new JakartaServletFileUpload(factory);
                List<FileItem> multiparts = upload.parseRequest(request);

                for (FileItem item : multiparts) {
                    if (item.isFormField() && item.getFieldName().equals("grupoIdMasivo")) {
                        idGrupo = item.getString();
                        System.out.println("Valor de idGrupo: " + idGrupo);
                    }
                }

                if (idGrupo == null || idGrupo.isEmpty()) {
                    mensajeError = "El parámetro grupoIdMasivo es requerido.";
                    System.out.println(mensajeError);
                    request.setAttribute("mensajeError", mensajeError);
                    response.sendRedirect("html/verGrupos.jsp");
                    return;
                }

                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        String fileName = item.getName();
                        System.out.println("Nombre del archivo: " + fileName);
                        InputStream inputStream = item.getInputStream();
                        if (fileName.endsWith(".xls") || fileName.endsWith(".xlsx")) {
                            System.out.println("Procesando archivo Excel con idGrupo: " + idGrupo);
                            procesarExcel(inputStream, idGrupo);
                        } else {
                            mensajeError = "No podemos procesar ese tipo de archivo";
                            System.out.println(mensajeError);
                        }
                    }
                }
            } catch (FileUploadException e) {
                mensajeError = "Error al procesar el archivo de carga: " + e.getMessage();
                System.out.println(mensajeError);
            } catch (Exception e) {
                mensajeError = "Ocurrió un error inesperado: " + e.getMessage();
                System.out.println(mensajeError);
            }
        } else {
            mensajeError = "Este servlet solo atiende envío de archivos";
            System.out.println(mensajeError);
        }
        request.setAttribute("mensajeError", mensajeError);
        response.sendRedirect("html/verGrupos.jsp");
    }

    private void procesarExcel(InputStream inputStream, String idGrupo) throws IOException {
        Workbook workbook = new XSSFWorkbook(inputStream);
        Sheet sheet = workbook.getSheetAt(0); // Obtener la primera hoja
        System.out.println("Procesando archivo Excel para el grupo ID: " + idGrupo);
        // Iterar sobre las filas empezando desde la segunda fila (índice 1)
        for (int i = 1; i <= sheet.getLastRowNum(); i++) {
            Row row = sheet.getRow(i);
            if (row != null) {
                Cell cellFolio = row.getCell(0); // Columna A (Folio)
                String folio = obtenerValorCelda(cellFolio);
                String grupo = idGrupo;
                System.out.println("Fila " + i + ": Folio = " + folio + ", Grupo = " + grupo);
                // Crear objeto Aspirante con solo el folio y el idGrupo
                Aspirante aspirante = new Aspirante(grupo, folio);
                CargaMasivaDAO cargaMasivaDAO = new CargaMasivaDAO();
                boolean resultado = cargaMasivaDAO.asignarGrupo(aspirante);

            }
        }
        workbook.close();
    }

    private String obtenerValorCelda(Cell cell) {
        if (cell == null) {
            return "";
        }

        String cellValue;
        switch (cell.getCellType()) {
            case STRING:
                cellValue = cell.getStringCellValue();
                break;
            case NUMERIC:
                cellValue = String.valueOf((int) cell.getNumericCellValue());
                break;
            case BOOLEAN:
                cellValue = String.valueOf(cell.getBooleanCellValue());
                break;
            case FORMULA:
                cellValue = cell.getCellFormula();
                break;
            case BLANK:
                cellValue = "";
                break;
            default:
                cellValue = "Tipo de Celda Desconocido";
                break;
        }
        System.out.println("Valor de la celda: " + cellValue);
        return cellValue;
    }
}
