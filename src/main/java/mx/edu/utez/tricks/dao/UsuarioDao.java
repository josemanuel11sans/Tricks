package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Usuario;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsuarioDao {
    // Read para un usuario

    public Usuario getOne(String nombre, String contra){
        //Crea una instancia vacía de la clase usuario para almacenar los datos del usuario encontrado.
        Usuario usuario = new Usuario();

        String query = "select * from usuarios where mail = ? and contrasena = ?;";
        try {
            //Intenta obtener una conexión a la base de datos usando DatabaseConnectionManager.getConnection().
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query); // forma de evitar que inyecten query
            //Establece los parámetros de la consulta (nombre y contra) usando ps.setString().
            ps.setString(1,nombre);
            ps.setString(2,contra);
            //Ejecuta la consulta con executeQuery() y obtiene el resultado en un objeto ResultSet.
            ResultSet rs = ps.executeQuery();
            //Si rs.next() devuelve true, significa que se encontró un usuario con el nombre y la contraseña proporcionados:
            if (rs.next()){
                usuario.setNombre(rs.getString("mail"));
                usuario.setContra(rs.getString("contrasena"));
            }
            //ALERTA///////////////////////////
            //CERRAR LAS CONEXIONES CADA QUE SE TERMINA UNA CONSULTA !!!!!///
            ps.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }


    // VER DOCENTES EN LA TABLA:
    public ArrayList<Usuario> getAll(){
        ArrayList<Usuario> lista = new ArrayList<>();
        String query = "{ CALL verDocentes() }";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                u.setId_usuario(rs.getInt("matricula"));
                u.setNombre(rs.getString("nombre_completo"));
                u.setMail(rs.getString("correo"));
                u.setEstado(rs.getString("estado"));
                lista.add(u);
            }
            ps.close();
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return lista;
    }

    // ESTADISTICAS DE LAS CARDS DEL INICIO - NO MOVER -

    public int getAspirantesCount() {
        int count = 0;
        String query = "SELECT COUNT(*) AS count FROM aspirante";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;
    }

    public int getDocentesCount() {
        int count = 0;
        String query = "SELECT COUNT(*) AS count FROM usuarios WHERE id_rol = 2"; // Suponiendo que el rol de docente es 2
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;
    }

    public int getCarrerasCount() {
        int count = 0;
        String query = "SELECT COUNT(*) AS count FROM carreras";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;
    }

    public int getGruposCount() {
        int count = 0;
        String query = "SELECT COUNT(*) AS count FROM grupos";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt("count");
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return count;
    }
}
