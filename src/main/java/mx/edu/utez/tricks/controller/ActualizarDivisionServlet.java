package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.dao.DivisionesAcademicasDAO;
import mx.edu.utez.tricks.model.DivisionesAcademicas;

import java.io.IOException;

@WebServlet(name = "ActualizarDivisionServlet", value = "/ActualizarDivisionServlet")
public class ActualizarDivisionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Recibiendo parámetros del formulario
        int idDivision = Integer.parseInt(req.getParameter("idDivision"));
        String nombre = req.getParameter("nombreDivision");
        String siglas = req.getParameter("siglas");
        String coordinador = req.getParameter("coordinadorDivision");

        // Creando una instancia de DivisionesAcademicas con los datos recibidos
        DivisionesAcademicas division = new DivisionesAcademicas();
        division.setIdDivision(idDivision);
        division.setNombreDivision(nombre);
        division.setSiglas(siglas);
        division.setCoordinadorDivision(coordinador);

        // Actualizando la división
        DivisionesAcademicasDAO dao = new DivisionesAcademicasDAO();
        boolean resultado = dao.actualizarDivision(division);

        // Redireccionando según el resultado de la actualización
        if (resultado) {
            resp.sendRedirect("success.jsp"); // Redirige a una página de éxito
        } else {
            resp.sendRedirect("error.jsp"); // Redirige a una página de error
        }
    }
}
