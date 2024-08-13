package mx.edu.utez.tricks.controller;

import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.GrupoDao;
import mx.edu.utez.tricks.model.Grupo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "RegistrarGrupoServlet", value = "/RegistrarGrupoServlet")
public class RegistrarGrupoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreGrupo = request.getParameter("nombreGrupo");
        int carrera = Integer.parseInt(request.getParameter("carrera")); // debe coincidir con el name del select
        int docente = Integer.parseInt(request.getParameter("docente")); // debe coincidir con el name del select

        HttpSession session = request.getSession();

        Grupo grupo = new Grupo();
        grupo.setNombreGrupo(nombreGrupo);
        grupo.setIdCarrera(carrera);
        grupo.setIdDocente(docente);

        GrupoDao dao = new GrupoDao();
        boolean isInserted = dao.agregarGrupo(grupo);

        if (isInserted) {
            response.sendRedirect("html/verGrupos.jsp?success=true");
        } else {
            response.sendRedirect("../error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
