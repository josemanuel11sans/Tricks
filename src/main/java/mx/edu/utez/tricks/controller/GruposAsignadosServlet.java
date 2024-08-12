package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.GruposAsignadosDao;
import mx.edu.utez.tricks.model.GrupoAsignado;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "GruposAsignadosServlet", value = "/GruposAsignadosServlet")
public class GruposAsignadosServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String userEmail = (String) session.getAttribute("userEmail");

        if (userEmail == null) {
            response.sendRedirect("html/login.jsp");
            return;
        }

        GruposAsignadosDao gruposDao = new GruposAsignadosDao();
        List<GrupoAsignado> gruposAsignados = gruposDao.getGruposAsignadosPorDocente(userEmail);

        request.setAttribute("gruposAsignados", gruposAsignados);
        request.getRequestDispatcher("html_docentes/CursosAsignados.jsp").forward(request, response);
    }


}