package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.dao.CarreraDao;
import mx.edu.utez.tricks.model.Carrera;

import java.io.IOException;

@WebServlet(name = "ActualizarCarreraServlet", value = "/ActualizarCarreraServlet")
public class ActualizarCarreraServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action.equals("actualizar")) {
            actualizarCarrera(req, resp);
        }
    }

    private void actualizarCarrera(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int idCarrera = Integer.parseInt(req.getParameter("idCarrera"));
        String nombreCarrera = req.getParameter("nombreCarrera");
        int idDivisionAcademica = Integer.parseInt(req.getParameter("idDivisionAcademica"));

        Carrera carrera = new Carrera(idCarrera, nombreCarrera, idDivisionAcademica, 1);
        CarreraDao dao = new CarreraDao();
        boolean resultado = dao.actualizarCarrera(carrera);

        if (resultado) {
            resp.sendRedirect("consultarCarrera.jsp");
        } else {
            resp.sendRedirect("../error.jsp");
        }
    }
}
