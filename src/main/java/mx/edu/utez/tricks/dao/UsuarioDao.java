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

    public Usuario getOne(String nombre, String contra) {
        Usuario usuario = new Usuario();
        String query = "SELECT * FROM usuarios WHERE mail = ? AND contrasena = ?;";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nombre);
            ps.setString(2, contra);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario.setNombre(rs.getString("mail"));
                usuario.setContra(rs.getString("contrasena"));
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }

    //metodo que verifica si el correo existe
        public boolean emailExists(String nombre) {
            String query = "SELECT COUNT(*) FROM usuarios WHERE mail = ?;";
            try {
                Connection con = DatabaseConnectionManager.getConnection();
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, nombre);
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
                    int count = rs.getInt(1);
                    ps.close();
                    con.close();
                    return count > 0;
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return false;
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
