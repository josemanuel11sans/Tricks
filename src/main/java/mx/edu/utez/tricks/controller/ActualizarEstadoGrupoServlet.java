package mx.edu.utez.tricks.controller;

import mx.edu.utez.tricks.dao.GrupoDao;
import mx.edu.utez.tricks.model.Grupo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/actualizarEstadoGrupo")
public class ActualizarEstadoGrupoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtén el parámetro del ID del grupo y del estado
        String idGrupoStr = request.getParameter("idGrupo");
        String estadoIdEstadoStr = request.getParameter("estadoIdEstado");

        if (idGrupoStr == null || idGrupoStr.isEmpty() || estadoIdEstadoStr == null || estadoIdEstadoStr.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de grupo y estado son requeridos.");
            return;
        }

        try {
            int idGrupo = Integer.parseInt(idGrupoStr);
            int estadoIdEstado = Integer.parseInt(estadoIdEstadoStr);

            GrupoDao grupoDao = new GrupoDao();
            Grupo grupo = grupoDao.getGrupoById(idGrupo);

            if (grupo == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Grupo no encontrado.");
                return;
            }

            grupo.setEstadoIdEstado(estadoIdEstado);
            boolean isUpdated = grupoDao.updateGrupo(grupo);

            if (isUpdated) {
                response.sendRedirect("success.jsp");
            } else {
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo actualizar el grupo.");
            }

        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de grupo y estado deben ser números.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
