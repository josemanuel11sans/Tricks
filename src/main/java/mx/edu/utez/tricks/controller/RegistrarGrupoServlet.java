package mx.edu.utez.tricks.controller;

import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.GrupoDao;
import mx.edu.utez.tricks.dao.HistorialDao;
import mx.edu.utez.tricks.model.Grupo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.model.Historial;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

@WebServlet(name = "RegistrarGrupoServlet", value = "/RegistrarGrupoServlet")
public class RegistrarGrupoServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            String nombreGrupo = request.getParameter("nombreGrupo");
            int carrera = Integer.parseInt(request.getParameter("carrera")); // debe coincidir con el name del select
            int docente = Integer.parseInt(request.getParameter("docente")); // debe coincidir con el name del select
            HttpSession session2 = request.getSession();

            Grupo grupo = new Grupo();
            grupo.setNombreGrupo(nombreGrupo);
            grupo.setIdCarrera(carrera);
            grupo.setIdDocente(docente);

            GrupoDao dao = new GrupoDao();

            if (dao.nombreExistente(nombreGrupo)) {
                session2.setAttribute("alerta", "nombreExistente");
                response.sendRedirect("html/verGrupos.jsp");
                return;
            }

            boolean isInserted = dao.agregarGrupo(grupo);

            if (isInserted) {
                try {
                    // Insertar el mensaje en el historial
                    Historial historial = new Historial();
                    historial.setDescripcion("Se registró el grupo " + nombreGrupo + " para el Docente " + docente);
                    historial.setFecha_creacion(new Date());

                    HttpSession session = request.getSession();
                    historial.setUsuarioIdusuario(Integer.parseInt(session.getAttribute("idUsuarioSession").toString()));

                    HistorialDao historialDao = new HistorialDao();
                    boolean resultado = historialDao.insert(historial);

                    if (resultado) {
                        response.sendRedirect("html/verGrupos.jsp?success=true");
                        session.setAttribute("alerta", "exito");
                    } else {
                        response.sendRedirect("error.jsp?error=historial_insertion_failed");
                        session.setAttribute("alerta", "falloRegistro");
                    }
                } catch (NumberFormatException | SQLException e) {
                    e.printStackTrace();
                    response.sendRedirect("error.jsp?error=" + e.getMessage());
                }
            } else {
                response.sendRedirect("../error.jsp");
            }
        }catch (NumberFormatException a) {
            a.printStackTrace();
            HttpSession session = request.getSession();
            session.setAttribute("alerta", "error");
            response.sendRedirect("html/verGrupos.jsp");
        }
    }
}
