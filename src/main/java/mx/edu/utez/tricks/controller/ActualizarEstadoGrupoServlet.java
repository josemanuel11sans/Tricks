package mx.edu.utez.tricks.controller;

import mx.edu.utez.tricks.dao.GrupoDao;
import mx.edu.utez.tricks.model.Grupo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ActualizarEstadoGrupoServlet", urlPatterns = {"/ActualizarEstadoServlet"})
public class ActualizarEstadoGrupoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idGrupo = request.getParameter("folioGrupo2");
        String estadoGrupo = request.getParameter("estadoGrupo");

        GrupoDao grupoDao = new GrupoDao();
        Grupo grupo = grupoDao.getGrupoById(Integer.parseInt(idGrupo));
        if (grupo != null) {
            grupo.setEstadoIdEstado(Integer.parseInt(estadoGrupo));
            boolean isUpdated = grupoDao.updateGrupo(grupo);
            if (isUpdated) {
                response.sendRedirect("verGrupo.jsp");
            } else {
                response.sendRedirect("error.jsp");
            }
        } else {
            response.sendRedirect("error.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

