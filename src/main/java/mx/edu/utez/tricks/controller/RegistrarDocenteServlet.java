package mx.edu.utez.tricks.controller;

import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.HistorialDao;
import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.model.Historial;
import mx.edu.utez.tricks.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegistrarDocenteServlet", urlPatterns = {"/RegistrarDocenteServlet"})
public class RegistrarDocenteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Obtener los parámetros del formulario
            int idDocente = Integer.parseInt(request.getParameter("idDocente"));
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String mail = request.getParameter("mail");
            String contra = request.getParameter("contra");
            int estado = 1;
            int rol = 2;
            java.util.Date fechaCreacion = new java.util.Date(); // Fecha y hora actuales
            HttpSession session = request.getSession();

            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.setId_usuario(idDocente);
            nuevoUsuario.setNombre(nombre);
            nuevoUsuario.setApellido(apellido);
            nuevoUsuario.setMail(mail);
            nuevoUsuario.setContra(contra);
            nuevoUsuario.setEstado(estado);
            nuevoUsuario.setRol(rol);
            nuevoUsuario.setFecha_creacion(fechaCreacion);

            UsuarioDao usuarioDao = new UsuarioDao();
            HistorialDao historialDao = new HistorialDao();

            // Verificar si el correo o la matrícula ya existen
            if (usuarioDao.emailExists(mail)) {
                session.setAttribute("alerta", "correoExistente");
                response.sendRedirect("html/verDocentes.jsp");
                return;
            }

            if (usuarioDao.matriculaExists(idDocente)) {
                session.setAttribute("alerta", "matriculaExistente");
                response.sendRedirect("html/verDocentes.jsp");
                return;
            }

            // Insertar el usuario en la base de datos
            boolean isInserted = usuarioDao.insert(nuevoUsuario);

            // Insertar en el historial y redirigir según el resultado de la inserción
            if (isInserted) {
                Historial historial = new Historial();
                historial.setDescripcion("Se registró el docente " + nombre);
                historial.setFecha_creacion(fechaCreacion);
                historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

                boolean isHistorialInserted = historialDao.insert(historial);

                if (isHistorialInserted) {
                    session.setAttribute("alerta", "exito");
                } else {
                    session.setAttribute("alerta", "falloRegistro");
                }
            } else {
                session.setAttribute("alerta", "falloRegistro");
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
