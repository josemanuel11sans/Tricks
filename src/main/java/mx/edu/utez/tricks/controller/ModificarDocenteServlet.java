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
                response.sendRedirect("html/verDocentes.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
