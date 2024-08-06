package mx.edu.utez.tricks.controller;

import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.DivisionesAcademicasDAO;
import mx.edu.utez.tricks.dao.HistorialDao;
import mx.edu.utez.tricks.model.DivisionesAcademicas;
import mx.edu.utez.tricks.model.Historial;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ActualizarEstadoDivisionServlet", value = "/ActualizarEstadoDivisionServlet")
public class ActualizarEstadoDivisionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtén el parámetro del ID de la división y del estado
            int idDivision = Integer.parseInt(request.getParameter("idDivision2"));
            int estadoIdDivision = Integer.parseInt(request.getParameter("estadoIdDivision"));

            DivisionesAcademicas division = new DivisionesAcademicas();
            division.setIdDivision(idDivision);
            division.setEstado(estadoIdDivision);
            DivisionesAcademicasDAO dao = new DivisionesAcademicasDAO();
            HttpSession session = request.getSession();

            boolean isUpdated = dao.actualizarEstado(division);

            if (isUpdated) {
                java.util.Date fechaCreacion = new java.util.Date(); // Fecha y hora actuales
                HistorialDao historialDao = new HistorialDao();
                Historial historial = new Historial();

                String estadoDescripcion = (estadoIdDivision == 1) ? "activo" : "inactivo";
                historial.setDescripcion("Se actualizó el estado de la división académica con ID: " + idDivision + " a estado " + estadoDescripcion);
                historial.setFecha_creacion(fechaCreacion);
                historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

                boolean isHistorialInserted = historialDao.insert(historial);

                if (isHistorialInserted) {
                    response.sendRedirect("html/verDivision.jsp?success=true");
                } else {
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo registrar la actualización en el historial.");
                }
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo actualizar el estado de la división.");
            }
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Ocurrió un error al procesar la solicitud.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
