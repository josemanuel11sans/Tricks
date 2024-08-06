package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.dao.GruposAsignadosDao;
import mx.edu.utez.tricks.model.Usuario;
import mx.edu.utez.tricks.model.GrupoAsignado;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DocenteServlet", value = "/DocenteServlet")
public class DocenteServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String mailDoc = req.getParameter("mailDoc");
        String contraDoc = req.getParameter("contraDoc");

        UsuarioDao usuarioDao = new UsuarioDao();
        Usuario usuario = usuarioDao.getOne(mailDoc, contraDoc);

        HttpSession session = req.getSession();

        // Validar primero el correo
        if (!usuarioDao.emailExists(mailDoc)) {
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

        // Validar el estado del usuario
        if (usuario.getEstado() == 2) {
            session.setAttribute("alerta", "estadoInactivo");
            resp.sendRedirect("html/login.jsp");
            return;
        }

        // Validar el rol del usuario
        if (usuario.getRol() == 2) {
            // Obtener el número de grupos asignados
            GruposAsignadosDao gruposDao = new GruposAsignadosDao();
            List<GrupoAsignado> grupos = gruposDao.getGruposAsignadosPorDocente(mailDoc);
            int numeroDeGrupos = grupos.size();

            // Almacenar la información del docente y el número de grupos en la sesión
            session.setAttribute("username", usuario.getNombre());
            session.setAttribute("userEmail", usuario.getMail());
            session.setAttribute("userApellido", usuario.getApellido());
            session.setAttribute("numeroDeGrupos", numeroDeGrupos);

            resp.sendRedirect("html_docentes/inicioDocente.jsp");
        } else {
            session.setAttribute("alerta", "rolMal");
            resp.sendRedirect("html/login.jsp");
        }
    }
}
