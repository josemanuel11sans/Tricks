package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.HelloServlet;
import mx.edu.utez.tricks.dao.AspiranteDAO;
import mx.edu.utez.tricks.model.Aspirante;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "ActualizarEstadoServlet", value = "/ActualizarEstadoServlet")
public class ActualizarEstadoServlet extends HelloServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String folio = request.getParameter("folioAspirante2");
        String estado = request.getParameter("estadoAspirante");

        Aspirante aspirante = new Aspirante(folio,estado); // Valores de grupo y estado temporales

        AspiranteDAO dao = new AspiranteDAO();
        boolean resultado = dao.actualizarEstado(aspirante);

        if (resultado) {
            response.sendRedirect("html/verAspirantes.jsp");
        } else {
            response.sendRedirect("../error.jsp");
        }
    }
}
