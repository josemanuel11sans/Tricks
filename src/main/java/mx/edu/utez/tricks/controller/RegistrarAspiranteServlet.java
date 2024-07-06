package mx.edu.utez.tricks.controller;

import mx.edu.utez.tricks.dao.AspiranteDAO;
import mx.edu.utez.tricks.model.Aspirante;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(name = "RegistrarAspiranteServlet", value = "/RegistrarAspiranteServlet")
public class RegistrarAspiranteServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String folio = request.getParameter("folioAspirante");
        String nombre = request.getParameter("nombreAspirante");
        String apellidos = request.getParameter("apellidosAspirante");
        String curp = request.getParameter("curpAspirante");
        String fechaNacimientoStr = request.getParameter("fechaNacimientoAspirante");

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        Date fechaNacimiento = null;
        try {
            fechaNacimiento = formatter.parse(fechaNacimientoStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Aspirante aspirante = new Aspirante(folio, nombre, apellidos, curp, fechaNacimiento, "1", "1"); // Valores de grupo y estado temporales

        AspiranteDAO dao = new AspiranteDAO();
        boolean resultado = dao.agregarAspirante(aspirante);

        if (resultado) {
            response.sendRedirect("html/verAspirantes.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
