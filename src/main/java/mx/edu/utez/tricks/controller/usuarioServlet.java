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
//Declara una clase usuarioServlet que extiende HttpServlet, lo cual significa que manejará solicitudes HTTP.
public class usuarioServlet extends HttpServlet {
    @Override
    //  Este método se ejecuta cuando se envía una solicitud HTTP POST a la URL /login.
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Conseguir la info del formulario, donde los inputs se llamen así:
        String nombre = req.getParameter("username");
        String contra = req.getParameter("password");
        UsuarioDao dao = new UsuarioDao();
       Usuario usr = dao.getOne(nombre,contra);

        HttpSession session = req.getSession();
        // si el usuario esta vacío,
        if (usr.getNombre() == null) {
            // es porque no existe en la bd
            session.setAttribute("message", "Usuario o contraseña incorrectos");
            System.out.println("El usuario " + nombre + " no existe en la base de datos");
            resp.sendRedirect("html/login.jsp"); //me regresa al login de nuuevo
        }else{
            // si existe en la bd
            session.setAttribute("username", usr.getNombre());
            System.out.println("El usuario " + nombre + " si esta en la base de datos");
            resp.sendRedirect("html/inicioAdmin.jsp");
        }
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
