package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Alumno;
import mx.edu.utez.tricks.model.Grupo;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class AlumnoDao {
    public List<Alumno> getAlumnosPorGrupo(int grupoId, Integer estado) {
        List<Alumno> alumnos2 = new ArrayList<>();
        String query = "SELECT a.folio_aspirante, a.nombre, a.apellido, c.nombre_carrera, a.estado, " +
                "COALESCE(cal.calificacion, 0) as calificacion " +
                "FROM aspirantes a " +
                "JOIN grupos g ON a.grupos_id_grupo = g.id_grupo " +
                "JOIN carreras c ON g.carreras_id_carrera = c.id_carrera " +
                "LEFT JOIN calificaciones cal ON a.folio_aspirante = cal.aspirante_folio_aspirante " +
                "WHERE g.id_grupo = ?";

        if (estado != null) {
            query += " AND a.estado = ?";
        }

        try (Connection conn = DatabaseConnectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setInt(1, grupoId);
            if (estado != null) {
                stmt.setInt(2, estado);
            }

            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Alumno alumno = new Alumno();
                alumno.setFolio(rs.getString("folio_aspirante"));
                alumno.setNombre(rs.getString("nombre") + " " + rs.getString("apellido"));
                alumno.setCarrera(rs.getString("nombre_carrera"));
                alumno.setEstado(rs.getInt("estado"));
                alumno.setCalificacion(rs.getDouble("calificacion"));
                alumnos2.add(alumno);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return alumnos2;
    }

// Método existente para obtener alumnos por grupo

    /**
     * Actualiza la calificación de un alumno.
     *
     * @param folio        El folio del alumno.
     * @param calificacion La nueva calificación.
     * @return true si la calificación se actualizó correctamente, false en caso contrario.
     */
    public boolean actualizarCalificacion(String folio, double calificacion) {
        String query = "UPDATE calificaciones SET calificacion = ? WHERE aspirante_folio_aspirante = ?";
        boolean actualizado = false;

        try (Connection conn = DatabaseConnectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setDouble(1, calificacion);
            stmt.setString(2, folio);

            int filasAfectadas = stmt.executeUpdate();
            actualizado = (filasAfectadas > 0);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return actualizado;
    }
}
