package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.DivisionesAcademicasDAO;
import mx.edu.utez.tricks.model.DivisionesAcademicas;
import mx.edu.utez.tricks.model.Historial;
import mx.edu.utez.tricks.dao.HistorialDao;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ActualizarEstadoDivisionServlet", value = "/ActualizarEstadoDivisionServlet")
public class ActualizarEstadoDivisionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idDivisionStr = request.getParameter("idDivision");
        String estadoStr = request.getParameter("estadoDivision");

        if (idDivisionStr == null || idDivisionStr.isEmpty() || estadoStr == null || estadoStr.isEmpty()) {
            response.sendRedirect("error.jsp?error=invalid_parameters");
            return;
        }

        int idDivision = 0;
        int estado = 0;

        try {
            idDivision = Integer.parseInt(idDivisionStr);
            estado = Integer.parseInt(estadoStr);
        } catch (NumberFormatException e) {
            response.sendRedirect("error.jsp?error=invalid_number_format");
            return;
        }

        DivisionesAcademicas division = new DivisionesAcademicas();
        division.setIdDivision(idDivision);
        division.setEstado(estado);

        DivisionesAcademicasDAO dao = new DivisionesAcademicasDAO();
        boolean resultado = dao.actualizarEstado(division);

        if (resultado) {
            Historial historial = new Historial();
            historial.setDescripcion("Se actualizó el estado de la división con ID " + idDivision);
            historial.setFecha_creacion(new java.sql.Timestamp(System.currentTimeMillis()));
            HttpSession session = request.getSession();
            historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

            HistorialDao historialDao = new HistorialDao();
            boolean isInserted = false;
            try {
                isInserted = historialDao.insert(historial);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            if (isInserted) {
                response.sendRedirect("html/verDivisiones.jsp?success=true");
            } else {
                response.sendRedirect("error.jsp?error=insertion_failed");
            }
        } else {
            response.sendRedirect("error.jsp?error=update_failed");
        }
    }
}
