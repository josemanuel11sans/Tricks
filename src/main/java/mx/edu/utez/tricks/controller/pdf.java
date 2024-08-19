package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;
import net.sf.jasperreports.engine.JasperRunManager;

import java.io.*;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "pdf", value = "/pdf")
public class pdf extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obtener la ubicación y los bytes del reporte
        String report = "/WEB-INF/Coffee_Landscape_6.jasper";
        File file = new File(getServletContext().getRealPath(report));
        InputStream input = new FileInputStream(file);

        // Colocar los parámetros del reporte
        Map<String, Object> mapa = new HashMap<>();  // Usa un tipo genérico específico

        // Obtener una conexión a la base de datos
        Connection con = null;
        try {
            con = DatabaseConnectionManager.getConnection();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        // Configurar cómo se va a ver la respuesta del Servlet
        resp.setContentType("application/pdf");  // Establecer el tipo de respuesta
        resp.setHeader("Content-Disposition", "Attachment; filename=reporteF.pdf");  // Forzar la descarga del archivo

        // Generar el reporte
        try {
            byte[] bytes = JasperRunManager.runReportToPdf(input, mapa, con);
            OutputStream os = resp.getOutputStream();
            os.write(bytes);
            os.flush();
            os.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }
}
