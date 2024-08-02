package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.model.Usuario;

import java.io.IOException;

@WebServlet(name = "DocenteServlet", value = "/DocenteServlet")
public class DocenteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mailDoc = req.getParameter("mailDoc");
        String contraDoc = req.getParameter("contraDoc");

        UsuarioDao dao = new UsuarioDao();
        Usuario usuario = dao.getOne(mailDoc, contraDoc);

        HttpSession session = req.getSession();

        if (!dao.emailExists(mailDoc)) {
            session.setAttribute("alerta", "correoMal");
            resp.sendRedirect("html/login.jsp");
            return;
        }

        if (usuario == null || usuario.getNombre() == null) {
            session.setAttribute("alerta", "contraMal");
            resp.sendRedirect("html/login.jsp");
            return;
        }

        if (usuario.getEstado() == 2) {
            session.setAttribute("alerta", "estadoInactivo");
            resp.sendRedirect("html/login.jsp");
            return;
        }

        if (usuario.getRol() == 2) {
            session.setAttribute("username", usuario.getNombre());
            session.setAttribute("userEmail", usuario.getMail());
            session.setAttribute("userApellido", usuario.getApellido());
            resp.sendRedirect("html_docentes/inicioDocente.jsp"); // Redirige a inicioDocente.jsp
        } else {
            session.setAttribute("alerta", "rolMal");
            resp.sendRedirect("html/login.jsp");
        }
    }
}
