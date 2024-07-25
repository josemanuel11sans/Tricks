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

            UsuarioDao dao = new UsuarioDao();

            // Verificar si el correo ya existe para otro usuario
            if (dao.emailExists(mail) && !dao.buscarEmail(idUsuario).getMail().equals(mail)) {
                HttpSession session = request.getSession();
                session.setAttribute("alerta", "correoExistente");
                response.sendRedirect("html/verDocentes.jsp");
                return;
            }

            Usuario usuario = new Usuario(idUsuario, nombre, apellido, mail, contra);
            boolean resultado = dao.actualizarUsuario(usuario);

            if (resultado) {
                Historial historial = new Historial();
                historial.setDescripcion("Se actualizó el docente " + nombre + " con matricula: " + idUsuarioStr);
                historial.setFecha_creacion(new java.sql.Timestamp(System.currentTimeMillis()));
                HttpSession session = request.getSession();
                historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

                HistorialDao historialDao = new HistorialDao();
                boolean isInserted = historialDao.insert(historial);
                if (isInserted) {
                    session.setAttribute("alerta", "actualizacionExitosa");
                } else {
                    session.setAttribute("alerta", "falloActualizacion");
                }
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("alerta", "falloActualizacion");
            }

            response.sendRedirect("html/verDocentes.jsp");
        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("alerta", "error");
            response.sendRedirect("html/verDocentes.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
