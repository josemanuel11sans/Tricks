package mx.edu.utez.tricks.controller;

import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.AspiranteDAO;
import mx.edu.utez.tricks.dao.HistorialDao;
import mx.edu.utez.tricks.model.Aspirante;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.model.Historial;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ActualizarAspiranteServlet", value = "/ActualizarAspiranteServlet")
public class ActualizarAspiranteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String folio = request.getParameter("folioAspirante");
            String nombre = request.getParameter("nombreAspirante");
            String apellidos = request.getParameter("apellidosAspirante");
            String curp = request.getParameter("curpAspirante");
            String fechaNacimientoStr = request.getParameter("fechaNacimientoAspirante");
            HttpSession session2 = request.getSession();

            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaNacimiento = null;
            try {
                fechaNacimiento = formatter.parse(fechaNacimientoStr);
            } catch (ParseException e) {
                e.printStackTrace();
            }

            AspiranteDAO dao = new AspiranteDAO();

            // Verificar si el correo ya existe para otro usuario
            if (dao.curpExistente(curp) && !dao.buscarCurp(folio).getCurp().equals(curp)) {
                HttpSession session = request.getSession();
                session.setAttribute("alerta", "curpExistente");
                response.sendRedirect("html/verAspirantes.jsp");
                return;
            }

            Aspirante aspirante = new Aspirante(folio, nombre, apellidos, curp, fechaNacimiento);
            boolean resultado = dao.actualizarAspirante(aspirante);

            if (resultado) {
                try {
                    // Insertar el mensaje en el historial
                    Historial historial = new Historial();
                    historial.setDescripcion("Se actualizó el aspirante " + nombre + " con ID " + folio);
                    historial.setFecha_creacion(new Date());

                    historial.setUsuarioIdusuario(Integer.parseInt(session2.getAttribute("idUsuarioSession").toString()));

                    HistorialDao historialDao = new HistorialDao();
                    boolean isInserted = historialDao.insert(historial);

                    if (isInserted) {
                        response.sendRedirect("html/verAspirantes.jsp?success=true");
                        session2.setAttribute("alerta", "actualizacionExitosa");
                    } else {
                        response.sendRedirect("error.jsp?error=historial_insertion_failed");
                        session2.setAttribute("alerta", "falloActualizacion");
                    }
                } catch (NumberFormatException | SQLException e) {
                    e.printStackTrace();
                    response.sendRedirect("error.jsp?error=" + e.getMessage());
                }
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("alerta", "error");
            response.sendRedirect("html/verAspirantes.jsp");
        }
    }
}
