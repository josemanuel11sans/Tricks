package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.HelloServlet;
import mx.edu.utez.tricks.dao.AspiranteDAO;
import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.model.Usuario;

import jakarta.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebServlet(name = "ModificarEstadoDocServlet", value = "/ModificarEstadoDocServlet")
public class ModificarEstadoDocServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idUsuarioStr = request.getParameter("idDocente2");
        int idUsuario = Integer.parseInt(idUsuarioStr);

        String estado = request.getParameter("estadoDocente");

        Usuario usuario = new Usuario(idUsuario, estado);

        UsuarioDao dao = new UsuarioDao();
        boolean resultado = dao.actualizarEstado(usuario);

        if (resultado) {
            response.sendRedirect("html/verDocentes.jsp");
        } else {
            response.sendRedirect("../error.jsp");
        }
    }


}