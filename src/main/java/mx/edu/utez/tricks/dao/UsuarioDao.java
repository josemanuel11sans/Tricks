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


    //CRUD para usuario

    //Primera parte de modificar usuario
    public Usuario getOne(int id){
        Usuario usuario = new Usuario();
        String query = "select * from usuarios where id_usuario = ?;";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                usuario.setId_usuario(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setContra(rs.getString("contra"));
                usuario.setMail(rs.getString("correo"));
                usuario.setEstado(rs.getString("estado"));
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }

    //Insert para un nuevo usuario
    public boolean insert(Usuario u){
        boolean flag = false;
        String query = "insert into usuarios(nombre,contrasena,mail) values (?,sha2(?,256),?);";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,u.getNombre());
            ps.setString(2,u.getContra());
            ps.setString(3,u.getMail());
            if(ps.executeUpdate()>0){
                flag = true;
            }
            ps.close();
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return flag;
    }

    //Read pero para TODOS
    //esto se usa para mostra los datos en la tabla
    public ArrayList<Usuario> getAll(){
        ArrayList<Usuario> lista = new ArrayList<>();
        //el id_rol = 2 segun la bd corresponde solo a los docentes
       //se usa en procedimieno almacenado la sigiente consulata
        String query = "{ CALL verUsuarios(2)}";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Usuario u = new Usuario();
                //los parametros que se le dan a estos gets tienen  que ser los mismos que como estan na la bd
                u.setId_usuario(rs.getInt("id_usuario"));
                //en el procedimiento almacenado se concatena el nombre y el apellido
                //por esta razon puse nombre completo como identificador
                u.setNombre(rs.getString("nombre_completo"));
               u.setContra(rs.getString("contrasena"));
                u.setMail(rs.getString("mail"));
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

    public boolean update(Usuario u){
        boolean flag = false;
        String query = "update usuarios set nombre = ?, contrasena = ?, mail = ? where id_usuario = ?";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,u.getNombre());
            ps.setString(2,u.getContra());
            ps.setString(3,u.getMail());
            ps.setInt(4,u.getId_usuario());
            if(ps.executeUpdate()>0){
                flag = true;
            }
            ps.close();
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return flag;
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
