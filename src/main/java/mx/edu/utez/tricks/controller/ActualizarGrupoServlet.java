package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.dao.GrupoDao;
import mx.edu.utez.tricks.model.Grupo;

import java.io.IOException;

@WebServlet(name = "ActualizarGrupoServlet", value = "/ActualizarGrupoServlet")
public class ActualizarGrupoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idGrupo = Integer.parseInt(request.getParameter("idGrupo"));
        String nombreGrupo = request.getParameter("nombreGrupo");
        int carrera = Integer.parseInt(request.getParameter("carrera"));
        int docente = Integer.parseInt(request.getParameter("docente"));

        Grupo grupo = new Grupo();
        grupo.setIdGrupo(idGrupo);
        grupo.setNombreGrupo(nombreGrupo);
        grupo.setIdCarrera(carrera);
        grupo.setIdDocente(docente);

        GrupoDao dao = new GrupoDao();
        boolean isUpdated = dao.actualizarGrupo(grupo);

        if (isUpdated) {
            response.sendRedirect("html/verGrupos.jsp?success=true");
        } else {
            response.sendRedirect("../error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
