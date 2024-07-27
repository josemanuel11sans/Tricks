package mx.edu.utez.tricks.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import mx.edu.utez.tricks.dao.UsuarioDao;
import mx.edu.utez.tricks.model.Usuario;
import mx.edu.utez.tricks.utils.GmailSender;
import mx.edu.utez.tricks.utils.SimpleRandomStringGenerator;

import java.io.IOException;

@WebServlet(name = "RecuperacionServlet",value = "/solicitudRecuperacion")
public class RecuperacionServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //Checar que el código exista en la BD
        String codigo = req.getParameter("codigo");
        System.out.println("estas entrando ya al metodo doGet con el codigo "+codigo);
        UsuarioDao dao = new UsuarioDao();
        if(dao.existe(codigo)){
            //Si si existe redirigir al usuario a la página de restablecimiento de contra
            resp.sendRedirect("html/recuperacion.jsp?codigo="+codigo);
        }else{
            //Decirle al usuario que el código no sirve o esta expirado
            req.getSession().setAttribute("mensaje", "El código no sirve o esta expirado");
            resp.sendRedirect("html/login.jsp");
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //1) Checar que el usuario tenga una cuenta en nuestro sistema
        String correo = req.getParameter("correo");
        System.out.println(correo);
        UsuarioDao dao = new UsuarioDao();
        Usuario u = dao.getOne2(correo);
        if(u.getEstado() == 1 && u.getRol() == 2){
            //Significa que además de que si existe si puede cambiar su contraseña
            //2) Generar un código unico para ese usuario
            String codigo = SimpleRandomStringGenerator.generateRandomString(20);
            System.out.println(codigo);
            //3) Insertar ese código en la base de datos
            dao.updateCodigo(u,codigo);
            //4) Generar un correo electronico donde exista un enlace a un Servlet que maneje el código
            try{
                GmailSender gmail = new GmailSender();
                String para = correo;
                String asunto = "Restablecimiento de contraseña";
                //req.getServletContext().getContextPath();
                String mensaje =
                        "<h1>Le enviamos es código para el restablecimiento de su contraseña</h1>\n"+
                                //este ruta se tiene que modificar ala ora de desplegar esta app
                        "<a href=\"http://localhost:8080/tricks_war/solicitudRecuperacion?codigo="+codigo+"\">haz click AQUI PARA RESTABLECER TU CONTRASEÑA</a>";
                gmail.sendMail(para,asunto,mensaje);
                req.getSession().setAttribute("mensaje","Favor de revisar tu correo electronico y la carpeta de SPAM");
                String men = (String) req.getSession().getAttribute("mensaje");
                System.out.println(men);
                resp.sendRedirect("html/login.jsp");
            }catch(Exception e){
                e.printStackTrace();
            }
        }else{
            //No existe o no puede cambiar su contraseña
            req.getSession().setAttribute("mensaje","El usuario no existe en la BD");
            String men = (String) req.getSession().getAttribute("mensaje");
            System.out.println(men);
            resp.sendRedirect("html/login.jsp");
        }

    }


    //5) Mandar al usuario a cambiar su contraseña (vista recuperacion.jsp)

}
