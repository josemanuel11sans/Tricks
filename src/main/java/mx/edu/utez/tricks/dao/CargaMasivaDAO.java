package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Aspirante;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CargaMasivaDAO {

    public boolean CargaMasiva(Aspirante aspirante) {
        String sql = "INSERT INTO aspirantes (folio_aspirante, nombre, apellido, curp, estado, fecha_nac) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, aspirante.getFolioAspirante());
            stmt.setString(2, aspirante.getNombre());
            stmt.setString(3, aspirante.getApellidos());
            stmt.setString(4, aspirante.getCurp());
            stmt.setInt(5, 1);

            java.sql.Date sqlDate = new java.sql.Date(aspirante.getFechaNacimiento().getTime());
            stmt.setDate(6, sqlDate);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean asignarGrupo(Aspirante aspirante) {
        String sql = "UPDATE aspirantes SET grupos_id_grupo = ? WHERE folio_aspirante = ?";

        try (Connection conn = DatabaseConnectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, Integer.parseInt(aspirante.getGrupo2()));
            stmt.setString(2, aspirante.getFolioAspirante());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
