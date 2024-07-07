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
        String nombreDocente = request.getParameter("nombreDocente");
        String nombreCarrera = request.getParameter("nombreCarrera");
        String nombreDivision = request.getParameter("nombreDivision");

        Grupo grupo = new Grupo();
        grupo.setNombreGrupo(nombreGrupo);
        grupo.setDocente(nombreDocente);
        grupo.setCarrera(nombreCarrera);
        grupo.setDivisionAcademica(nombreDivision);

        GrupoDao grupoDao = new GrupoDao();
        if (grupoDao.insert(grupo)) {
            response.sendRedirect("verGrupo.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
