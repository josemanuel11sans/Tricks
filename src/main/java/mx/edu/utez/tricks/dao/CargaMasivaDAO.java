package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Aspirante;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.Date; // Importar java.sql.Date
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class CargaMasivaDAO {

    public boolean CargaMasiva(Aspirante aspirante) {
        String sql = "INSERT INTO aspirantes (folio_aspirante, nombre, apellido, curp, estado, fecha_nac) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnectionManager.getConnection(); // Asegúrate de que `DatabaseConnectionManager.getConnection()` retorne una conexión válida
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, aspirante.getFolioAspirante());
            stmt.setString(2, aspirante.getNombre());
            stmt.setString(3, aspirante.getApellidos());
            stmt.setString(4, aspirante.getCurp());
            stmt.setInt(5, 1); // Usar el método getEstado() si está disponible en Aspirante

            // Convertir la fecha de nacimiento de tipo java.util.Date a java.sql.Date
            java.sql.Date sqlDate = new java.sql.Date(aspirante.getFechaNacimiento().getTime());
            stmt.setDate(6, sqlDate);

            //stmt.setInt(7, aspirante.getGrupo());

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean asignarGrupo(String folioAspirante, int nuevoGrupoId) {
        String sql = "UPDATE aspirantes SET grupos_id_grupo = ? WHERE folio_aspirante = ?";

        try (Connection conn = DatabaseConnectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, nuevoGrupoId);
            stmt.setString(2, folioAspirante);

            int rowsAffected = stmt.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
