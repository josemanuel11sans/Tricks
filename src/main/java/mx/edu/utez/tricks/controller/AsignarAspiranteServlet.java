package mx.edu.utez.tricks.controller;

import mx.edu.utez.tricks.dao.AspiranteDAO;
import mx.edu.utez.tricks.dao.GrupoDao;
import mx.edu.utez.tricks.model.Aspirante;
import mx.edu.utez.tricks.model.Grupo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AsignarAspiranteServlet")
public class AsignarAspiranteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recupera los parámetros del formulario
        int idGrupo = Integer.parseInt(request.getParameter("IdGrupo"));
        String folioAspirante = request.getParameter("folioAspirante");
        HttpSession session = request.getSession();

        // Instancias de los DAOs
        GrupoDao grupoDao = new GrupoDao();

        Grupo grupo = new Grupo(idGrupo, folioAspirante);
        // Obtener el grupo por ID
        boolean resultado = grupoDao.asignarAspiranteAGrupo(grupo);
        if (resultado) {
            session.setAttribute("alerta", "asignarpirante");
            response.sendRedirect("html/verGrupos.jsp?success=true");
        } else {
            session.setAttribute("alerta", "errorasignarpirante");
            request.getRequestDispatcher("verGrupos.jsp");
        }
    }
}

