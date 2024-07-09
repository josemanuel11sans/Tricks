package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.dao.DivisionesAcademicasDAO;
import mx.edu.utez.tricks.model.DivisionesAcademicas;

import java.io.IOException;

@WebServlet(name = "RegistrarDivisonServlet", value = "/RegistrarDivisonServlet")
public class RegistrarDivisonServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombre = req.getParameter("nombreDivision");
        String coordinador = req.getParameter("coordinadorDivision");

        DivisionesAcademicas division = new DivisionesAcademicas(nombre, coordinador);

        DivisionesAcademicasDAO dao = new DivisionesAcademicasDAO();
        boolean resultado = dao.agregarDivision(division);

        if (resultado) {
            resp.sendRedirect("success.jsp"); // Redirige a una página de éxito
        } else {
            resp.sendRedirect("error.jsp"); // Redirige a una página de error
        }
    }
}
