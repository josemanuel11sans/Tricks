package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.dao.UsuarioDao;

import java.io.IOException;

@WebServlet(name="ContraServlet",value = "/updateContra")
public class ContraServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String contra = req.getParameter("contra");
        String codigo = req.getParameter("codigo");
        UsuarioDao dao = new UsuarioDao();
        //Deberiamos cambiar la contra y el codigo de una vez
        if(dao.updateContrasena(contra, codigo)){
            //Si se hizo
            System.out.println("nueva contra"+contra);
            resp.sendRedirect("html/login.jsp");
        }else{
            //Nose hizo error*
        }
    }
}
