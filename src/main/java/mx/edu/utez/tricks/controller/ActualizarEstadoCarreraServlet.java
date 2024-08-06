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

@WebServlet(name = "ActualizarEstadoCarreraServlet", value = "/ActualizarEstadoCarreraServlet")
public class ActualizarEstadoCarreraServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el parámetro del ID de la carrera y del estado
        int idCarreraStr = Integer.parseInt(request.getParameter("idCarrera2"));
        int estadoIdCarreraStr = Integer.parseInt(request.getParameter("estadoIdCarrera"));

        // Crear un objeto Carrera con los datos recibidos
        Carrera carrera = new Carrera();
        carrera.setIdCarrera(idCarreraStr);
        carrera.setIdEstado(estadoIdCarreraStr);

        // Crear instancias de DAO
        CarreraDao dao = new CarreraDao();
        HistorialDao historialDao = new HistorialDao();

        // Actualizar el estado de la carrera
        boolean isUpdated = dao.actualizarEstado(carrera);

        HttpSession session = request.getSession();
        Date fechaCreacion = new Date(); // Fecha y hora actuales

        if (isUpdated) {
            // Determinar la descripción del estado
            String estadoDescripcion = estadoIdCarreraStr == 1 ? "Activo" : "Inactivo";

            // Insertar en el historial
            Historial historial = new Historial();
            historial.setDescripcion("Se actualizó el estado de la carrera con ID: " + idCarreraStr + " a estado " + estadoDescripcion);
            historial.setFecha_creacion(fechaCreacion);
            historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

            try {
                historialDao.insert(historial);
            } catch (Exception e) {
                e.printStackTrace(); // Imprime el error en caso de fallo
                // Puedes manejar el error aquí si lo deseas
            }

            response.sendRedirect("html/verCarrera.jsp?success=true");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo actualizar el estado de la carrera.");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
