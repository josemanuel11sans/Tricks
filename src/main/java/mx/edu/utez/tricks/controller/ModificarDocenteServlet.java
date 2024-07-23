package mx.edu.utez.tricks.controller;

import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.HistorialDao;
import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.model.Usuario;
import mx.edu.utez.tricks.model.Historial;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ModificarDocenteServlet", value = "/ModificarDocenteServlet")
public class ModificarDocenteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idUsuarioStr = request.getParameter("idDocente");
            int idUsuario = Integer.parseInt(idUsuarioStr);

            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String mail = request.getParameter("mail");
            String contra = request.getParameter("contra");

            Usuario usuario = new Usuario(idUsuario, nombre, apellido, mail, contra);

            UsuarioDao dao = new UsuarioDao();
            boolean resultado = dao.actualizarUsuario(usuario);

            if (resultado) {
                Historial historial = new Historial();
                historial.setDescripcion("Se actualizó el docente " + nombre);
                historial.setFecha_creacion(new java.sql.Timestamp(System.currentTimeMillis()));
                HttpSession session = request.getSession();
                historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

                HistorialDao historialDao = new HistorialDao();
                boolean isInserted = historialDao.insert(historial);
                if (isInserted) {
                    response.sendRedirect("html/verDocentes.jsp?success=true");
                } else {
                    response.sendRedirect("error.jsp?error=insertion_failed");
                }
            } else {
                response.sendRedirect("error.jsp?error=update_failed");
            }
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp?error=" + e.getMessage());
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
