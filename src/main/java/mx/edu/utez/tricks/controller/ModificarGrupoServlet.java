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
        String nombre = request.getParameter("modNombreDocente");
        String apellido = request.getParameter("modApellidoDocente");
        String carrera = request.getParameter("modNombreCarrera");
        String division = request.getParameter("modNombreDivision");

        Grupo grupo = new Grupo();
        grupo.setIdGrupo(idGrupo);
        grupo.setNombreGrupo(nombreGrupo);
        grupo.setNombreDocente(nombre);
        grupo.setCarrera(apellido);
        grupo.setCarrera(carrera);
        grupo.setDivisionAcademica(division);

        GrupoDao dao = new GrupoDao();
        boolean isUpdated = dao.updateGrupo(grupo);

        if (isUpdated) {
            response.sendRedirect("html/verGrupo.jsp");
        } else {
            response.sendRedirect("../error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
