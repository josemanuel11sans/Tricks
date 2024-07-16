package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.model.Usuario;

import java.io.IOException;

@WebServlet(name = "ModificarEstadoDocServlet", value = "/ModificarEstadoDocServlet")
public class ModificarEstadoDocServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String idUsuarioStr = request.getParameter("idDocente2");
        int idUsuario = Integer.parseInt(idUsuarioStr);

        int estado = Integer.parseInt(request.getParameter("estadoDocente"));  // Obtener el estado como entero

        // Crear un objeto Usuario con los datos
        Usuario usuario = new Usuario();
        usuario.setId_usuario(idUsuario);
        usuario.setEstado(estado);

        // Actualizar el estado en la base de datos
        UsuarioDao dao = new UsuarioDao();
        boolean resultado = dao.actualizarEstado(usuario);

        // Redireccionar según el resultado de la actualización
        if (resultado) {
            response.sendRedirect("html/verDocentes.jsp");
        } else {
            response.sendRedirect("../error.jsp");
        }
    }
}
