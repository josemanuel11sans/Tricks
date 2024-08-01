package mx.edu.utez.tricks.controller;

import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.GrupoDao;
import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.model.Grupo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.model.Usuario;

import java.io.IOException;

@WebServlet(name = "ActualizarEstadoGrupoServlet", value = "/ActualizarEstadoGrupoServlet")
public class ActualizarEstadoGrupoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtén el parámetro del ID del grupo y del estado
        int idGrupoStr = Integer.parseInt(request.getParameter("idGrupo2"));
        int estadoIdEstadoStr = Integer.parseInt(request.getParameter("estadoIdEstado"));


        Grupo grupo = new Grupo();
        grupo.setIdGrupo(idGrupoStr);
        grupo.setEstadoIdEstado(estadoIdEstadoStr);

        GrupoDao dao = new GrupoDao();
        boolean resultado = dao.actualizarEstado(grupo);

        HttpSession session = request.getSession();



        grupo.setEstadoIdEstado(estadoIdEstadoStr);
        boolean isUpdated = dao.actualizarEstado(grupo);

        if (isUpdated) {
            response.sendRedirect("html/verGrupos.jsp?success=true");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo actualizar el grupo.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}

