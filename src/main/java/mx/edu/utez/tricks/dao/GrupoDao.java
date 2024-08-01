package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Grupo;
import mx.edu.utez.tricks.model.Usuario;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GrupoDao {

    // Obtener todos los grupos
    public ArrayList<Grupo> getAll() {
        ArrayList<Grupo> lista = new ArrayList<>();
        String query = "{ CALL verGrupos() }";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Grupo g = new Grupo();
                g.setIdGrupo(rs.getInt("idGrupo"));
                g.setNombreGrupo(rs.getString("nombreGrupo"));
                g.setNombreDocente(rs.getString("nombre"));
                g.setApellidoDocente(rs.getString("apellido"));
                g.setCarrera(rs.getString("carrera"));
                g.setDivisionAcademica(rs.getString("divisionAcademica"));
                g.setEstadoIdEstado(rs.getInt("estadoIdEstado"));
                lista.add(g);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    // Obtener un grupo por ID
    public Grupo getGrupoById(int id) {
        Grupo grupo = null;
        String query = "SELECT * FROM grupo WHERE idGrupo = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    grupo = new Grupo();
                    grupo.setIdGrupo(rs.getInt("idGrupo"));
                    grupo.setNombreGrupo(rs.getString("nombreGrupo"));
                    grupo.setNombreDocente(rs.getString("nombre"));
                    grupo.setApellidoDocente(rs.getString("apellido"));
                    grupo.setCarrera(rs.getString("carrera"));
                    grupo.setDivisionAcademica(rs.getString("divisionAcademica"));
                    grupo.setEstadoIdEstado(rs.getInt("estadoIdEstado"));
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return grupo;
    }

    // Insertar un nuevo grupo
    public boolean insert(Grupo grupo) {
        String query = "INSERT INTO grupo (nombreGrupo, nombre, apellido, carrera, divisionAcademica, estadoIdEstado) VALUES (?, ?, ?, ?, ?, ?)";
        boolean isInserted = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, grupo.getNombreGrupo());
            ps.setString(2, grupo.getNombreDocente());
            ps.setString(3, grupo.getApellidoDocente());
            ps.setString(4, grupo.getCarrera());
            ps.setString(5, grupo.getDivisionAcademica());
            ps.setInt(6, grupo.getEstadoIdEstado());

            isInserted = ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isInserted;
    }

    // Actualizar un grupo existente
    public boolean updateGrupo(Grupo grupo) {
        String query = "UPDATE grupo SET nombreGrupo = ?, nombre = ?, apellido = ?, carrera = ?, divisionAcademica = ?, estadoIdEstado = ? WHERE idGrupo = ?";
        boolean isUpdated = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, grupo.getNombreGrupo());
            ps.setString(2, grupo.getNombreDocente());
            ps.setString(3, grupo.getApellidoDocente());
            ps.setString(4, grupo.getCarrera());
            ps.setString(5, grupo.getDivisionAcademica());
            ps.setInt(6, grupo.getEstadoIdEstado());
            ps.setInt(7, grupo.getIdGrupo());

            isUpdated = ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isUpdated;
    }

    public boolean actualizarEstado(Grupo grupo) {
        String query = "UPDATE grupos SET estado = ? WHERE id_grupo = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, grupo.getEstadoIdEstado());
            ps.setInt(2, grupo.getIdGrupo());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}


