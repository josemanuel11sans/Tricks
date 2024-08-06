package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.CarreraDao;
import mx.edu.utez.tricks.dao.HistorialDao;
import mx.edu.utez.tricks.model.Carrera;
import mx.edu.utez.tricks.model.Historial;

import java.io.IOException;
import java.util.Date;

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

        HttpSession session = req.getSession();
        Date fechaCreacion = new Date(); // Fecha y hora actuales
        HistorialDao historialDao = new HistorialDao();

        if (resultado) {
            // Insertar en el historial
            Historial historial = new Historial();
            historial.setDescripcion("Se actualizó la carrera con ID: " + idCarrera);
            historial.setFecha_creacion(fechaCreacion);
            historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

            try {
                historialDao.insert(historial);
            } catch (Exception e) {
                e.printStackTrace(); // Imprime el error en caso de fallo
                // Puedes manejar el error aquí si lo deseas
            }

            resp.sendRedirect("html/verCarrera.jsp?success=true");
        } else {
            resp.sendRedirect("../error.jsp");
        }
    }
}
