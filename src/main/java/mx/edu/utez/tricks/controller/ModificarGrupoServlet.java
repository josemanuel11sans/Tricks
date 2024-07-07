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
        String nombreDocente = request.getParameter("modNombreDocente");
        String nombreCarrera = request.getParameter("modNombreCarrera");
        String nombreDivision = request.getParameter("modNombreDivision");

        Grupo grupo = new Grupo();
        grupo.setIdGrupo(idGrupo);
        grupo.setNombreGrupo(nombreGrupo);
        grupo.setDocente(nombreDocente);
        grupo.setCarrera(nombreCarrera);
        grupo.setDivisionAcademica(nombreDivision);

        GrupoDao grupoDao = new GrupoDao();
        if (grupoDao.update(grupo)) {
            response.sendRedirect("verGrupo.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
