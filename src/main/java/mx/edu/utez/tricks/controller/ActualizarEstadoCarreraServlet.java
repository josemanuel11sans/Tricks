package mx.edu.utez.tricks.controller;


import jakarta.servlet.http.HttpSession;
import mx.edu.utez.tricks.dao.CarreraDao;
import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.model.Carrera;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.model.Usuario;


import java.io.IOException;


@WebServlet(name = "ActualizarEstadoCarreraServlet", value = "/ActualizarEstadoCarreraServlet")
public class ActualizarEstadoCarreraServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtén el parámetro del ID del grupo y del estado
        int idCarreraStr = Integer.parseInt(request.getParameter("idCarrera2"));
        int estadoIdCarreraStr = Integer.parseInt(request.getParameter("estadoIdCarrera"));




        Carrera carrera = new Carrera();
        carrera.setIdCarrera(idCarreraStr);
        carrera.setIdEstado(estadoIdCarreraStr);


        CarreraDao dao = new CarreraDao();
        boolean resultado = dao.actualizarEstado(carrera);


        HttpSession session = request.getSession();






        carrera.setIdEstado(estadoIdCarreraStr);
        boolean isUpdated = dao.actualizarEstado(carrera);


        if (isUpdated) {
            response.sendRedirect("html/verCarrera.jsp?success=true");
        } else {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "No se pudo actualizar el grupo.");
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}


