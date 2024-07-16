package mx.edu.utez.tricks.controller;

import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

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

            Usuario nuevoUsuario = new Usuario();
            nuevoUsuario.setId_usuario(idDocente);
            nuevoUsuario.setNombre(nombre);
            nuevoUsuario.setApellido(apellido);
            nuevoUsuario.setMail(mail);
            nuevoUsuario.setContra(contra);
            nuevoUsuario.setEstado(estado);
            nuevoUsuario.setRol(rol);
            nuevoUsuario.setFecha_creacion(fechaCreacion);

            // Insertar el usuario en la base de datos
            UsuarioDao usuarioDao = new UsuarioDao();
            boolean isInserted = usuarioDao.insert(nuevoUsuario);

            // Redirigir según el resultado de la inserción
            if (isInserted) {
                response.sendRedirect("html/verDocentes.jsp?success=true");
            } else {
                response.sendRedirect("error.jsp?error=insertion_failed");
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
