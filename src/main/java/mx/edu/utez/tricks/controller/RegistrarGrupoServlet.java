package mx.edu.utez.tricks.controller;

import mx.edu.utez.tricks.dao.GrupoDao;
import mx.edu.utez.tricks.model.Grupo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/RegistrarGrupoServlet")
public class RegistrarGrupoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreGrupo = request.getParameter("nombreGrupo");
        String docente = request.getParameter("nombreDocente");
        String carrera = request.getParameter("nombreCarrera");
        String division = request.getParameter("nombreDivision");

        Grupo grupo = new Grupo();
        grupo.setNombreGrupo(nombreGrupo);
        grupo.setDocente(docente);
        grupo.setCarrera(carrera);
        grupo.setDivisionAcademica(division);

        GrupoDao dao = new GrupoDao();
        boolean isInserted = dao.insert(grupo);

        if (isInserted) {
            response.sendRedirect("html/verGrupo.jsp"); // Cambia esto a la página que quieras mostrar tras éxito
        } else {
            response.sendRedirect("error.jsp"); // Cambia esto a la página que quieras mostrar tras fallo
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}