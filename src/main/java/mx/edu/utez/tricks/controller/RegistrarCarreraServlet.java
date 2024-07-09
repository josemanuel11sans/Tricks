package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.dao.CarreraDao;
import mx.edu.utez.tricks.model.Carrera;

import java.io.IOException;

@WebServlet(name = "RegistrarCarreraServlet", value = "/RegistrarCarreraServlet")
public class RegistrarCarreraServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action.equals("agregar")) {
            agregarCarrera(req, resp);
        } else if (action.equals("actualizar")) {
            actualizarCarrera(req, resp);
        }
    }

    private void agregarCarrera(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombreCarrera = req.getParameter("nombreCarrera");
        int idDivisionAcademica = Integer.parseInt(req.getParameter("idDivisionAcademica"));
        int idEstado = Integer.parseInt(req.getParameter("idEstado"));

        Carrera carrera = new Carrera(0, nombreCarrera, idDivisionAcademica, idEstado);
        CarreraDao dao = new CarreraDao();
        boolean resultado = dao.agregarCarrera(carrera);

        if (resultado) {
            resp.sendRedirect("verCarreras.jsp");
        } else {
            resp.sendRedirect("error.jsp");
        }
    }

    private void actualizarCarrera(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idCarrera = Integer.parseInt(req.getParameter("idCarrera"));
        String nombreCarrera = req.getParameter("nombreCarrera");
        int idDivisionAcademica = Integer.parseInt(req.getParameter("idDivisionAcademica"));
        int idEstado = Integer.parseInt(req.getParameter("idEstado"));

        Carrera carrera = new Carrera(idCarrera, nombreCarrera, idDivisionAcademica, idEstado);
        CarreraDao dao = new CarreraDao();
        boolean resultado = dao.actualizarCarrera(carrera);

        if (resultado) {
            resp.sendRedirect("verCarreras.jsp");
        } else {
            resp.sendRedirect("error.jsp");
        }
    }
}
