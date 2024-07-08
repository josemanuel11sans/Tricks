package mx.edu.utez.tricks.controller;

import mx.edu.utez.tricks.dao.GrupoDao;
import mx.edu.utez.tricks.model.Grupo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/ModificarGrupoServlet")
public class ModificarGrupoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idGrupo = Integer.parseInt(request.getParameter("idGrupo"));
        String nombreGrupo = request.getParameter("modNombreGrupo");
        String docente = request.getParameter("modNombreDocente");
        String carrera = request.getParameter("modNombreCarrera");
        String division = request.getParameter("modNombreDivision");

        Grupo grupo = new Grupo();
        grupo.setIdGrupo(idGrupo);
        grupo.setNombreGrupo(nombreGrupo);
        grupo.setDocente(docente);
        grupo.setCarrera(carrera);
        grupo.setDivisionAcademica(division);

        GrupoDao dao = new GrupoDao();
        boolean isUpdated = dao.update(grupo);

        if (isUpdated) {
            response.sendRedirect("html/verGrupo.jsp"); // Cambia esto a la página que quieras mostrar tras éxito
        } else {
            response.sendRedirect("error.jsp"); // Cambia esto a la página que quieras mostrar tras fallo
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}