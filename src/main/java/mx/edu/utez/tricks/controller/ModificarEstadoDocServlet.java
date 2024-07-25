package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.HistorialDao;
import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.model.Historial;
import mx.edu.utez.tricks.model.Usuario;

import java.io.IOException;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "ModificarEstadoDocServlet", value = "/ModificarEstadoDocServlet")
public class ModificarEstadoDocServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener los parámetros del formulario
        String idUsuarioStr = request.getParameter("idDocente2");
        int idUsuario = Integer.parseInt(idUsuarioStr);

        int estado = Integer.parseInt(request.getParameter("estadoDocente"));  // Obtener el estado como entero

        // Crear un objeto Usuario con los datos
        Usuario usuario = new Usuario();
        usuario.setId_usuario(idUsuario);
        usuario.setEstado(estado);

        // Actualizar el estado en la base de datos
        UsuarioDao dao = new UsuarioDao();
        boolean resultado = dao.actualizarEstado(usuario);

        HttpSession session = request.getSession();

        if (resultado) {
            // Insertar un registro en el historial
            Historial historial = new Historial();
            historial.setDescripcion("Se actualizó el estado del docente con matricula " + idUsuario + " a " + (estado == 1 ? "activo" : "inactivo"));
            historial.setFecha_creacion(new java.sql.Timestamp(System.currentTimeMillis()));
            historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

            HistorialDao historialDao = new HistorialDao();
            boolean isInserted = false;
            try {
                isInserted = historialDao.insert(historial);
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

            if (isInserted) {
                session.setAttribute("alerta", "actualizacionExitosaEsta");
                response.sendRedirect("html/verDocentes.jsp");
            } else {
                session.setAttribute("alerta", "error");
                response.sendRedirect("error.jsp");
            }
        } else {
            session.setAttribute("alerta", "falloActualizacion");
            response.sendRedirect("html/verDocentes.jsp");
        }
    }
}

