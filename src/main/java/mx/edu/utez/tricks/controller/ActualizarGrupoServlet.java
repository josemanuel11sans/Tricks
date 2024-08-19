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
        try {
            // Validar y parsear los parámetros
            int idGrupo = Integer.parseInt(request.getParameter("idGrupo"));
            String nombreGrupo = request.getParameter("nombreGrupo");
            int carrera = Integer.parseInt(request.getParameter("carrera"));
            int docente = Integer.parseInt(request.getParameter("docente"));

            // Crear objeto Grupo con los valores obtenidos
            Grupo grupo = new Grupo();
            grupo.setIdGrupo(idGrupo);
            grupo.setNombreGrupo(nombreGrupo);
            grupo.setIdCarrera(carrera);
            grupo.setIdDocente(docente);

            // Actualizar en la base de datos
            GrupoDao dao = new GrupoDao();
            boolean isUpdated = dao.actualizarGrupo(grupo);

            // Redirigir según el resultado de la actualización
            if (isUpdated) {
                response.sendRedirect("html/verGrupos.jsp?success=true");
            } else {
                response.sendRedirect("../error.jsp");
            }
        } catch (NumberFormatException e) {
            // Manejo de excepciones si los parámetros no son válidos
            response.sendRedirect("../error.jsp?message=Invalid+input+data");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
