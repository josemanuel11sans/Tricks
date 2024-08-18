package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.GrupoAsignado;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GruposAsignadosDao {
    public List<GrupoAsignado> getGruposAsignadosPorDocente(String email) {
        List<GrupoAsignado> grupos = new ArrayList<>();
        String query = "SELECT g.nombre_grupo, c.nombre_carrera, g.estado, u.id_usuario, g.id_grupo " +
                "FROM grupos g JOIN carreras c ON g.carreras_id_carrera = c.id_carrera " +
                "JOIN usuarios u ON g.id_usuario = u.id_usuario " +
                "WHERE u.mail = ? AND g.estado = 1;";  // Filtra solo los grupos activos

        try (Connection conn = DatabaseConnectionManager.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                GrupoAsignado grupo = new GrupoAsignado();
                grupo.setNombreGrupo(rs.getString("nombre_grupo"));
                grupo.setCarrera(rs.getString("nombre_carrera"));
                grupo.setEstado(rs.getInt("estado"));
                grupo.setIdUsuario(rs.getInt("id_usuario"));
                grupo.setIdGrupo(rs.getInt("id_grupo"));
                grupos.add(grupo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return grupos;
    }
}