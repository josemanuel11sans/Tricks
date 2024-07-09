package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Carrera;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarreraDao {

    public List<Carrera> getAllCarreras() {
        List<Carrera> carreras = new ArrayList<>();
        String query = "SELECT c.id_carrera, c.nombre_carrera, d.nombre_division, c.estado_id_estado " +
                "FROM carreras c " +
                "JOIN divisiones_academicas d ON c.divisiones_academicas_id_division = d.id_division";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Carrera carrera = new Carrera();
                carrera.setIdCarrera(rs.getInt("id_carrera"));
                carrera.setNombreCarrera(rs.getString("nombre_carrera"));
                carrera.setNombreDivision(rs.getString("nombre_division"));
                carrera.setIdEstado(rs.getInt("estado_id_estado"));

                carreras.add(carrera);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return carreras;
    }

    public boolean agregarCarrera(Carrera carrera) {
        String query = "INSERT INTO carreras (nombre_carrera, divisiones_academicas_id_division, estado_id_estado) VALUES (?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, carrera.getNombreCarrera());
            ps.setInt(2, carrera.getIdDivisionAcademica());
            ps.setInt(3, carrera.getIdEstado());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizarCarrera(Carrera carrera) {
        String query = "UPDATE carreras SET nombre_carrera = ?, divisiones_academicas_id_division = ?, estado_id_estado = ? WHERE id_carrera = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, carrera.getNombreCarrera());
            ps.setInt(2, carrera.getIdDivisionAcademica());
            ps.setInt(3, carrera.getIdEstado());
            ps.setInt(4, carrera.getIdCarrera());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean eliminarCarrera(int idCarrera) {
        String query = "DELETE FROM carreras WHERE id_carrera = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, idCarrera);

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
