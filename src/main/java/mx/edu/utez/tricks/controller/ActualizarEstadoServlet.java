package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;
import mx.edu.utez.tricks.dao.AspiranteDAO;
import mx.edu.utez.tricks.dao.HistorialDao;
import mx.edu.utez.tricks.model.Aspirante;
import mx.edu.utez.tricks.model.Historial;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet(name = "ActualizarEstadoServlet", value = "/ActualizarEstadoServlet")
public class ActualizarEstadoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String folio = request.getParameter("folioAspirante2");
        int estado = Integer.parseInt(request.getParameter("estadoAspirante"));

        Aspirante aspirante = new Aspirante(folio, estado);

        AspiranteDAO dao = new AspiranteDAO();
        boolean resultado = dao.actualizarEstado(aspirante);

        if (resultado) {
            try {
                // Insertar el mensaje en el historial
                Historial historial = new Historial();
                historial.setDescripcion("Se actualizó el estado del aspirante con folio " + folio + " a " + (estado == 1 ? "activo" : "inactivo"));
                historial.setFecha_creacion(new Date());

                HttpSession session = request.getSession();
                historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

                HistorialDao historialDao = new HistorialDao();
                boolean isInserted = historialDao.insert(historial);

                if (isInserted) {
                    response.sendRedirect("html/verAspirantes.jsp?success=true");
                    session.setAttribute("alerta", "actualizacionExitosaEsta");
                } else {
                    response.sendRedirect("error.jsp?error=historial_insertion_failed");
                    session.setAttribute("alerta", "error");
                }
            } catch (NumberFormatException | SQLException e) {
                e.printStackTrace();
                response.sendRedirect("error.jsp?error=" + e.getMessage());
            }
        } else {
            response.sendRedirect("../error.jsp");
        }
    }
}

