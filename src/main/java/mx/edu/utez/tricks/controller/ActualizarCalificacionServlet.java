package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Enumeration;

import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.AlumnoDao;

@WebServlet(name = "ActualizarCalificacionesServlet", urlPatterns = {"/ActualizarCalificacionesServlet"})
public class ActualizarCalificacionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        AlumnoDao dao = new AlumnoDao();
        boolean actualizadas = true;

        // Iterar sobre todos los parámetros del formulario
        Enumeration<String> parameterNames = request.getParameterNames();
        while (parameterNames.hasMoreElements()) {
            String key = parameterNames.nextElement();

            // Buscar solo los parámetros que comienzan con "calificaciones["
            if (key.startsWith("calificaciones[")) {
                // Extraer el folio y la calificación
                String folio = key.substring("calificaciones[".length(), key.length() - 1);
                String calificacionStr = request.getParameter(key);

                // Validar y actualizar la calificación
                double calificacion;
                try {
                    calificacion = Double.parseDouble(calificacionStr);
                    if (calificacion < 0 || calificacion > 10) {
                        actualizadas = false;
                        continue;
                    }
                } catch (NumberFormatException e) {
                    actualizadas = false;
                    continue;
                }

                boolean actualizado = dao.actualizarCalificacion(folio, calificacion);
                if (!actualizado) {
                    actualizadas = false;
                }
            }
        }

        // Enviar respuesta
        if (actualizadas) {
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("Calificaciones actualizadas.");
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("Error al actualizar algunas calificaciones.");
        }


}
}
