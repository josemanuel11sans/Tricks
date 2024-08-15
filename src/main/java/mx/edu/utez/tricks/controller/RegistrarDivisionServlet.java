package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.DivisionesAcademicasDAO;
import mx.edu.utez.tricks.dao.HistorialDao;
import mx.edu.utez.tricks.model.DivisionesAcademicas;
import mx.edu.utez.tricks.model.Historial;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegistrarDivisionServlet", value = "/RegistrarDivisionServlet")
public class RegistrarDivisionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // Recibiendo parámetros del formulario
            String nombreDivision = req.getParameter("nombreDivision");
            String siglas = req.getParameter("siglas");
            String coordinador = req.getParameter("coordinadorDivision");
            HttpSession session = req.getSession();

            // Creando una instancia de DivisionesAcademicas con los datos recibidos
            DivisionesAcademicas division = new DivisionesAcademicas();
            division.setNombreDivision(nombreDivision);
            division.setSiglas(siglas);
            division.setCoordinadorDivision(coordinador);

            // Agregando la división
            DivisionesAcademicasDAO dao = new DivisionesAcademicasDAO();

            // Verificación de existencia de nombre y siglas
            if (dao.existeNombre(nombreDivision)) {
                session.setAttribute("alerta", "nombreExistente");
                resp.sendRedirect("html/registrarDivision.jsp");
                return;
            }

            if (dao.existeSiglas(siglas)) {
                session.setAttribute("alerta", "siglasExistente");
                resp.sendRedirect("html/registrarDivision.jsp");
                return;
            }

            boolean resultado = dao.agregarDivision(division);

            // Insertar en el historial si la división fue agregada exitosamente
            if (resultado) {
                java.util.Date fechaCreacion = new java.util.Date(); // Fecha y hora actuales
                HistorialDao historialDao = new HistorialDao();
                Historial historial = new Historial();
                historial.setDescripcion("Se registró la división académica con siglas: " + siglas);
                historial.setFecha_creacion(fechaCreacion);
                historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

                boolean isHistorialInserted = historialDao.insert(historial);

                if (isHistorialInserted) {
                    // Redirige a una página de éxito
                    session.setAttribute("alerta", "exito");
                    resp.sendRedirect("html/verDivision.jsp");
                } else {
                    // Manejo de error si el registro en el historial falla
                    session.setAttribute("alerta", "error");
                    resp.sendRedirect("../error.jsp");
                }
            } else {
                // Redirige a una página de error si la división no se pudo agregar
                session.setAttribute("alerta", "falloActualizacion");
                resp.sendRedirect("../error.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Manejo de excepciones SQL
            resp.sendRedirect("../error.jsp");
        }
    }
}
