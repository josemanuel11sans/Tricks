package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Usuario;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class UsuarioDao {
    // Read para un usuario
    public Usuario getOne(String nombre, String contra) {
        Usuario usuario = new Usuario();
        //de esta forma se hace una consulta de contraseña encriptada usando SHA2
        String query = "SELECT * FROM usuarios WHERE mail = ? AND contrasena = SHA2(?, 256);";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nombre);
            ps.setString(2, contra);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usuario.setNombre(rs.getString("mail"));
                usuario.setContra(rs.getString("contrasena"));

                //aqui recuperamos el rol de cada uno de los usuarios ya que la consulta esta trallendo toda la tabla
                usuario.setRol(rs.getInt("rol"));
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return usuario;
    }


    // Método que verifica si el correo existe
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


    // Método para ver la información de un docente en la tabla
    public ArrayList<Usuario> getAll() {
        ArrayList<Usuario> lista = new ArrayList<>();
        String query = " CALL verDocentes(); ";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Usuario u = new Usuario();
                u.setId_usuario(rs.getInt("matricula"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setMail(rs.getString("correo"));
                u.setEstado(Integer.parseInt(rs.getString("estadoCorrecto")));
                lista.add(u);
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return lista;
    }

    // Método para encriptar contraseña
    public String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hash) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error al encriptar la contraseña", e);
        }
    }

    // Método para registrar un docente
    public boolean insert(Usuario usuario) throws SQLException {
        String query = "INSERT INTO usuarios (id_usuario, nombre, apellido, mail, contrasena, estado, rol, fecha_creacion) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        String hashedPassword = hashPassword(usuario.getContra());

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, usuario.getId_usuario());
            ps.setString(2, usuario.getNombre());
            ps.setString(3, usuario.getApellido());
            ps.setString(4, usuario.getMail());
            ps.setString(5, hashedPassword);
            ps.setInt(6, usuario.getEstado());
            ps.setInt(7, usuario.getRol());
            ps.setTimestamp(8, new java.sql.Timestamp(usuario.getFecha_creacion().getTime()));

            boolean result = ps.executeUpdate() > 0;
            System.out.println("Usuario insertado correctamente");
            return result;
        } catch (SQLException e) {
            System.err.println("Error al insertar usuario: " + e.getMessage());
            throw e;
        }
    }

    // Método para actualizar los datos del usuario
    public boolean actualizarUsuario(Usuario usuario) {
        String query = "UPDATE usuarios SET nombre = ?, apellido = ?, mail = ?, contrasena = ? WHERE id_usuario = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, usuario.getNombre());
            ps.setString(2, usuario.getApellido());
            ps.setString(3, usuario.getMail());

            // Verificar si la contraseña ha cambiado y encriptarla si es necesario
            String nuevaContra = usuario.getContra();
            if (nuevaContra != null && !nuevaContra.isEmpty()) {
                nuevaContra = hashPassword(nuevaContra);
            }
            ps.setString(4, nuevaContra);
            ps.setInt(5, usuario.getId_usuario());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            System.out.println("Error en actualización de usuario");
            e.printStackTrace();
            return false;
        }
    }


    // Método para actualizar el estado del docente
    public boolean actualizarEstado(Usuario usuario) {
        String query = "UPDATE usuarios SET estado = ? WHERE id_usuario = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, usuario.getEstado());
            ps.setInt(2, usuario.getId_usuario());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para ver si la matricula del docente ya existe
    public boolean matriculaExists(int idUsuario) {
        String query = "SELECT COUNT(*) FROM usuarios WHERE id_usuario = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // Devuelve verdadero si la matrícula ya existe
            }
        } catch (SQLException e) {
            throw new RuntimeException("Error al verificar la existencia de la matrícula", e);
        }
        return false; // Devuelve falso si la matrícula no existe
    }

    // Método para ver que ningun usuario tiene ese email
    public Usuario buscarEmail(int idUsuario) {
        String query = "SELECT * FROM usuarios WHERE id_usuario = ?";
        Usuario usuario = null;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, idUsuario);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId_usuario(rs.getInt("id_usuario"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setApellido(rs.getString("apellido"));
                usuario.setMail(rs.getString("mail"));
                usuario.setContra(rs.getString("contrasena"));
                usuario.setEstado(rs.getInt("estado"));
                usuario.setRol(rs.getInt("rol"));
                usuario.setFecha_creacion(rs.getTimestamp("fecha_creacion"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return usuario;
    }


    // ESTADISTICAS DE LAS CARDS DEL INICIO - NO MOVER -
    public int getAspirantesCount() {
        int count = 0;
        String query = "SELECT COUNT(*) AS count FROM aspirantes";
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
        String query = "SELECT COUNT(*) AS count FROM usuarios WHERE rol = 2"; // Suponiendo que el rol de docente es 2
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
