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

        // Validar primero el correo
        if (!dao.emailExists(mailAdm)) {
            System.out.println("El correo " + mailAdm + " no existe en la base de datos");
            resp.sendRedirect("html/login.jsp?error=email_error");
            return;
        }

        // Validar la combinación de correo y contraseña
        if (usuario == null || usuario.getNombre() == null) {
            System.out.println("La contraseña es incorrecta");
            resp.sendRedirect("html/login.jsp?error=password_error");
            return;
        }

        if (usuario.getRol() == 1) {
            // Usuario administrador
            System.out.println("Entro como administrador");
            HttpSession session = req.getSession();
            session.setAttribute("username", usuario.getNombre());
            session.setAttribute("idUsuarioSession", usuario.getId_usuario());

            System.out.println("Tiene este ID " + session.getAttribute("idUsuarioSession"));
            resp.sendRedirect("html/inicioAdmin.jsp");
        } else {
            resp.sendRedirect("html/login.jsp?error=role_error");
        }
    }
}
