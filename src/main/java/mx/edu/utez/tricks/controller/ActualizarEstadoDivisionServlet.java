package mx.edu.utez.tricks.controller;


import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.DivisionesAcademicasDAO;
import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.model.DivisionesAcademicas;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.model.Usuario;


import java.io.IOException;


@WebServlet(name = "ActualizarEstadoDivisionServlet", value = "/ActualizarEstadoDivisionServlet")
public class ActualizarEstadoDivisionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtén el parámetro del ID del grupo y del estado
        int idDivisionStr = Integer.parseInt(request.getParameter("idDivision2"));
        int estadoIdDivisionStr = Integer.parseInt(request.getParameter("estadoIdDivision"));




        DivisionesAcademicas grupo = new DivisionesAcademicas();
        grupo.setIdDivision(idDivisionStr);
        grupo.setEstado(estadoIdDivisionStr);


        DivisionesAcademicasDAO dao = new DivisionesAcademicasDAO();
        boolean resultado = dao.actualizarEstado(grupo);


        HttpSession session = request.getSession();






        grupo.setEstado(estadoIdDivisionStr);
        boolean isUpdated = dao.actualizarEstado(grupo);


        if (isUpdated) {
            response.sendRedirect("html/verDivision.jsp?success=true");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo actualizar el grupo.");
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
