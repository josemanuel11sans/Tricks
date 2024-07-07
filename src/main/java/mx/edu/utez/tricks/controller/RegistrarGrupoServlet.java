package mx.edu.utez.tricks.controller;

import mx.edu.utez.tricks.dao.GrupoDao;
import mx.edu.utez.tricks.model.Grupo;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name = "RegistrarGrupoServlet", urlPatterns = {"/RegistrarGrupoServlet"})
public class RegistrarGrupoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombreGrupo = request.getParameter("nombreGrupo");
        String nombreDocente = request.getParameter("nombreDocente");
        String nombreCarrera = request.getParameter("nombreCarrera");
        String nombreDivision = request.getParameter("nombreDivision");

        // Agregar validación de datos
        if (nombreGrupo == null || nombreDocente == null || nombreCarrera == null || nombreDivision == null) {
            System.out.println("Faltan datos para registrar el grupo");
            response.sendRedirect("error.jsp");
            return;
        }

        Grupo nuevoGrupo = new Grupo();
        nuevoGrupo.setNombreGrupo(nombreGrupo);
        nuevoGrupo.setDocente(nombreDocente);
        nuevoGrupo.setCarrera(nombreCarrera);
        nuevoGrupo.setDivisionAcademica(nombreDivision);

        GrupoDao dao = new GrupoDao();
        boolean isSuccess = dao.insert(nuevoGrupo);

        if (isSuccess) {
            System.out.println("Registro del grupo exitoso: " + nuevoGrupo.getNombreGrupo());
            response.sendRedirect("verGrupos.jsp");
        } else {
            System.out.println("Error en el registro del grupo: " + nuevoGrupo.getNombreGrupo());
            response.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
