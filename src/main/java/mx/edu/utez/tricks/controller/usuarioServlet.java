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

@WebServlet(name = "usuarioServlet", value = "/usuarioServlet")
public class usuarioServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre = req.getParameter("username");
        String contra = req.getParameter("password");
        UsuarioDao dao = new UsuarioDao();

        HttpSession session = req.getSession();

        // Validar primero el correo
        if (!dao.emailExists(nombre)) {
            System.out.println("El correo " + nombre + " no existe en la base de datos");
            resp.sendRedirect("html/login.jsp?error=email_error");
            return;
        }

        // Validar la combinación de correo y contraseña
        Usuario usr = dao.getOne(nombre, contra);
        if (usr.getNombre() == null) {
            System.out.println("La contraseña " + contra + " es incorrecta");
            resp.sendRedirect("html/login.jsp?error=password_error");
            return;
        }

        // Si el usuario y la contraseña son correctos
        session.setAttribute("username", usr.getNombre());
        System.out.println("El usuario " + nombre + " sí está en la base de datos");
        resp.sendRedirect("html/inicioAdmin.jsp");
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}

