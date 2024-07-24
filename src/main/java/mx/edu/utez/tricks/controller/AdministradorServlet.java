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

@WebServlet(name = "AdministradorServlet", value = "/AdministradorServlet")
public class AdministradorServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mailAdm = req.getParameter("mailAdm");
        String contraAdm = req.getParameter("contraAdm");

        UsuarioDao dao = new UsuarioDao();
        Usuario usuario = dao.getOne(mailAdm, contraAdm);

        HttpSession session = req.getSession();

        // Validar primero el correo
        if (!dao.emailExists(mailAdm)) {
            session.setAttribute("alerta", "correoMal");
            resp.sendRedirect("html/login.jsp");
            return;
        }

        // Validar la combinación de correo y contraseña
        if (usuario == null || usuario.getNombre() == null) {
            session.setAttribute("alerta", "contraMal");
            resp.sendRedirect("html/login.jsp");
            return;
        }

        if (usuario.getRol() == 1) {
            // Usuario administrador
            session.setAttribute("username", usuario.getNombre());
            session.setAttribute("idUsuarioSession", usuario.getId_usuario());
            resp.sendRedirect("html/inicioAdmin.jsp");
        } else {
            session.setAttribute("alerta", "rolMal");
            resp.sendRedirect("html/login.jsp");
        }
    }
}
