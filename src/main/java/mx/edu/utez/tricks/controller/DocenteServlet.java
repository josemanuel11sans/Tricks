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

        // Validar primero el correo
        if (!dao.emailExists(mailDoc)) {
            System.out.println("El correo " + mailDoc + " no existe en la base de datos");
            resp.sendRedirect("html/login.jsp?error=email_error");
            return;
        }

        // Validar la combinación de correo y contraseña
        if (usuario == null || usuario.getNombre() == null) {
            System.out.println("La contraseña es incorrecta");
            resp.sendRedirect("html/login.jsp?error=password_error");
            return;
        }

        if (usuario.getRol() == 2) {
            // Usuario docente
            System.out.println("Entro como docente");
            HttpSession session = req.getSession();
            session.setAttribute("username", usuario.getNombre());
            resp.sendRedirect("html_docentes/inicioDocente.jsp");
        } else {
            resp.sendRedirect("html/login.jsp?error=role_error");
        }
    }
}
