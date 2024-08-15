package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.DivisionesAcademicasDAO;
import mx.edu.utez.tricks.dao.HistorialDao;
import mx.edu.utez.tricks.model.DivisionesAcademicas;
import mx.edu.utez.tricks.model.Historial;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ActualizarDivisionServlet", value = "/ActualizarDivisionServlet")
public class ActualizarDivisionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Recibiendo parámetros del formulario
            int idDivision = Integer.parseInt(req.getParameter("idDivision"));
            String nombre = req.getParameter("nombreDivision");
            String siglas = req.getParameter("siglas");
            String coordinador = req.getParameter("coordinadorDivision");
            HttpSession session = req.getSession();

            // Creando una instancia de DivisionesAcademicas con los datos recibidos
            DivisionesAcademicas division = new DivisionesAcademicas();
            division.setIdDivision(idDivision);
            division.setNombreDivision(nombre);
            division.setSiglas(siglas);
            division.setCoordinadorDivision(coordinador);

            // Actualizando la división
            DivisionesAcademicasDAO dao = new DivisionesAcademicasDAO();
            boolean resultado = dao.actualizarDivision(division);

            // Insertar en el historial si la división fue actualizada exitosamente
            if (resultado) {
                java.util.Date fechaCreacion = new java.util.Date(); // Fecha y hora actuales
                HistorialDao historialDao = new HistorialDao();
                Historial historial = new Historial();
                historial.setDescripcion("Se actualizó la división académica con siglas: " + siglas);
                historial.setFecha_creacion(fechaCreacion);
                historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

                boolean isHistorialInserted = historialDao.insert(historial);

                if (isHistorialInserted) {
                    session.setAttribute("alerta", "actualizacionExitosa");
                    resp.sendRedirect("html/verDivision.jsp"); // Redirige a una página de éxito
                } else {
                    resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo registrar la actualización en el historial.");
                }
            } else {
                session.setAttribute("alerta", "error");
                resp.sendRedirect("../error.jsp"); // Redirige a una página de error
            }
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error al procesar la solicitud.");
        }
    }
}
