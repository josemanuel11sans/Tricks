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
        String query = "{  CALL verCarreras() }";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Carrera carrera = new Carrera();
                carrera.setIdCarrera(rs.getInt("id_carrera"));
                carrera.setNombreCarrera(rs.getString("nombre_carrera"));
                carrera.setNombreDivision(rs.getString("siglas"));
                carrera.setIdEstado(rs.getInt("estado"));

                carreras.add(carrera);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return carreras;
    }

    public boolean agregarCarrera(Carrera carrera) {
        String query = "INSERT INTO carreras (nombre_carrera, siglas, estado) VALUES (?, ?, ?)";

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
        String query = "UPDATE carreras SET nombre_carrera = ?, siglas = ?, estado = ? WHERE id_carrera = ?";

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
