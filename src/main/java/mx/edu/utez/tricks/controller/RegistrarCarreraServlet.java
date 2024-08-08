package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.CarreraDao;
import mx.edu.utez.tricks.dao.DivisionesAcademicasDAO;
import mx.edu.utez.tricks.dao.HistorialDao;
import mx.edu.utez.tricks.model.Carrera;
import mx.edu.utez.tricks.model.DivisionesAcademicas;
import mx.edu.utez.tricks.model.Historial;

import java.io.IOException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "RegistrarCarreraServlet", value = "/RegistrarCarreraServlet")
public class RegistrarCarreraServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action.equals("agregar")) {
            agregarCarrera(req, resp);
        }
    }

    private void agregarCarrera(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String nombreCarrera = req.getParameter("nombreCarrera");
        int idDivisionAcademica = Integer.parseInt(req.getParameter("idDivisionAcademica"));
        int idEstado = Integer.parseInt(req.getParameter("idEstado"));
        HttpSession session = req.getSession();

        Carrera carrera = new Carrera(0, nombreCarrera, idDivisionAcademica, idEstado);
        CarreraDao carreraDao = new CarreraDao();
        boolean resultado = carreraDao.agregarCarrera(carrera);

        if (resultado) {
            // Insertar en el historial
            Date fechaCreacion = new Date(); // Fecha y hora actuales
            HistorialDao historialDao = new HistorialDao();
            Historial historial = new Historial();
            historial.setDescripcion("Se agregó la carrera " + nombreCarrera);
            historial.setFecha_creacion(fechaCreacion);
            historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

            // Manejar el historial en un bloque separado
            try {
                historialDao.insert(historial);
            } catch (Exception e) {
                e.printStackTrace(); // Imprime el error en caso de fallo
                // Aquí puedes manejar el error de manera específica si lo deseas
            }

            session.setAttribute("alerta", "exito");
            resp.sendRedirect("html/verCarrera.jsp");
        } else {
            session.setAttribute("alerta", "error");
            resp.sendRedirect("../error.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Obteniendo todas las divisiones académicas para el formulario
        DivisionesAcademicasDAO divisionesAcademicasDAO = new DivisionesAcademicasDAO();
        List<DivisionesAcademicas> divisionesList = divisionesAcademicasDAO.getAllDivisiones();

        // Pasando la lista de divisiones académicas a la JSP
        req.setAttribute("divisionesList", divisionesList);

        // Redirigiendo al formulario de registro de carreras
        req.getRequestDispatcher("html/registrarCarrera.jsp").forward(req, resp);
    }
}
