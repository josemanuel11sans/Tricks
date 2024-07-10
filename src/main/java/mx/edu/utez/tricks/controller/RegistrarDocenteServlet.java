package mx.edu.utez.tricks.controller;

import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegistrarDocenteServlet", urlPatterns = {"/RegistrarDocenteServlet"})
public class RegistrarDocenteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        int idDocente = Integer.parseInt(request.getParameter("idDocente"));
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String mail = request.getParameter("mail");
        String contra = request.getParameter("contra");
        int estado = 1;
        int id_rol = 2;
        int grupos_id_grupo = ' ';

        Usuario nuevoUsuario = new Usuario();
        nuevoUsuario.setId_usuario(idDocente);
        nuevoUsuario.setNombre(nombre);
        nuevoUsuario.setApellido(apellido);
        nuevoUsuario.setMail(mail);
        nuevoUsuario.setContra(contra);
        nuevoUsuario.setId_estado(estado);
        nuevoUsuario.setId_rol(id_rol);
        nuevoUsuario.setGrupos_id_grupo(grupos_id_grupo);

        UsuarioDao usuarioDao = new UsuarioDao();
        boolean isInserted = usuarioDao.insert(nuevoUsuario);

        if (isInserted) {
            response.sendRedirect("html/verDocentes.jsp?success=true");
        } else {
            response.sendRedirect("error.jsp?error=true");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}