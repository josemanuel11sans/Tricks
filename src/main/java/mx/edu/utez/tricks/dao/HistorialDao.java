package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Historial;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

public class HistorialDao {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    // Método para ver la información de un docente en la tabla
    public ArrayList<Historial> getAll() {
        ArrayList<Historial> lista = new ArrayList<>();
        String query = " select * from historial order by fecha_creacion desc";
        try {
            con = DatabaseConnectionManager.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                Historial historial = new Historial();
                historial.setIdHistorial(rs.getInt("id_historial"));
                historial.setDescripcion(rs.getString("descripcion"));
                historial.setFecha_creacion(rs.getDate("fecha_creacion"));
                historial.setUsuarioIdusuario(rs.getInt("usuarios_id_usuario"));
                lista.add(historial);
            }
        } catch (SQLException e) {
            System.out.println("Error en el metodo getAll() - HistorialDao - " + e.getMessage());
        } finally {
            cerrarConexiones("getAllHistorial");
        }
        return lista;
    }


    // Método para registrar historial
    public boolean insert(Historial historial) throws SQLException {
        String query = "INSERT INTO historial (descripcion, fecha_creacion, usuarios_id_usuario) VALUES (?, ?, ?)";

        try {
            con = DatabaseConnectionManager.getConnection();
            ps = con.prepareStatement(query);

            ps.setString(1, historial.getDescripcion());
            ps.setDate(2, new java.sql.Date(historial.getFecha_creacion().getTime()));
            ps.setInt(3, historial.getUsuarioIdusuario());

            boolean result = ps.executeUpdate() > 0;
            System.out.println("historial insertado correctamente");
            return result;
        } catch (SQLException e) {
            System.err.println("Error al insertar historial: " + e.getMessage());
            throw e;
        } finally {
            cerrarConexiones("insertHistorial");
        }
    }


    public void cerrarConexiones(String metodo) {
        try {
            if (rs != null)
                rs.close();

            if (ps != null)
                ps.close();

            if (con != null)
                con.close();
        } catch (SQLException e) {
            System.out.println("Error al cerrar la conexion en el metodo: " + metodo + " mensaje: " + e.getMessage());
        }
    }
}
