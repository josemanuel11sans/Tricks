package mx.edu.utez.tricks.controller;

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
        String carrera = request.getParameter("nombreCarrera");
        String division = request.getParameter("nombreDivision");
        String docente = request.getParameter("nombreDocente");

        Grupo grupo = new Grupo();
        grupo.setNombreGrupo(nombreGrupo);
        grupo.setCarrera(carrera);
        grupo.setDivisionAcademica(division);
        grupo.setNombreDocente(docente);  // Corregido

        GrupoDao dao = new GrupoDao();
        boolean isInserted = dao.insert(grupo);

        if (isInserted) {
            response.sendRedirect("html/verGrupo.jsp");
        } else {
            response.sendRedirect("../error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
