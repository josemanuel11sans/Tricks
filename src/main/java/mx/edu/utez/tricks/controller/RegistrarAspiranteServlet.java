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

@WebServlet(name = "RegistrarAspiranteServlet", value = "/RegistrarAspiranteServlet")
public class RegistrarAspiranteServlet extends HttpServlet {
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

            Aspirante aspirante = new Aspirante(folio, nombre, apellidos, curp, fechaNacimiento, 1, 1); // Valores de grupo y estado temporales

            AspiranteDAO dao = new AspiranteDAO();

            if (dao.curpExistente(curp)) {
                session2.setAttribute("alerta", "curpExistente");
                response.sendRedirect("html/verAspirantes.jsp");
                return;
            }

            if (dao.folioExistente(folio)) {
                session2.setAttribute("alerta", "folioExistente");
                response.sendRedirect("html/verAspirantes.jsp");
                return;
            }

            boolean resultado = dao.agregarAspirante(aspirante);

            if (resultado) {
                try {
                    // Insertar el mensaje en el historial
                    Historial historial = new Historial();
                    historial.setDescripcion("Se registró el aspirante " + nombre + " con ID " + folio);
                    historial.setFecha_creacion(new Date());

                    HttpSession session = request.getSession();
                    historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

                    HistorialDao historialDao = new HistorialDao();
                    boolean isInserted = historialDao.insert(historial);

                    if (isInserted) {
                        response.sendRedirect("html/verAspirantes.jsp?success=true");
                    } else {
                        response.sendRedirect("error.jsp?error=historial_insertion_failed");
                    }
                } catch (NumberFormatException | SQLException e) {
                    e.printStackTrace();
                    response.sendRedirect("error.jsp?error=" + e.getMessage());
                }
            } else {
                response.sendRedirect("../error.jsp");
            }
        }catch (NumberFormatException a) {
            a.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("alerta", "error");
            response.sendRedirect("html/verAspirantes.jsp");
        }
    }
}
