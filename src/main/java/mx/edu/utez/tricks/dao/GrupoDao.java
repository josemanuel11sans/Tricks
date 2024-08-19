package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Grupo;
import mx.edu.utez.tricks.model.Aspirante;
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
    public boolean agregarGrupo(Grupo grupo) {
        String query = "INSERT INTO grupos (nombre_grupo, carreras_id_carrera, id_usuario, estado) VALUES (?, ?, ?, 1)";
        boolean isInserted = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, grupo.getNombreGrupo());
            ps.setInt(2, grupo.getIdCarrera());
            ps.setInt(3, grupo.getIdDocente());

            isInserted = ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error SQL: " + e.getMessage());
            System.out.println("Código de error SQL: " + e.getErrorCode());
            System.out.println("Estado SQL: " + e.getSQLState());
            return false;
        }

        return isInserted;
    }

    // Actualizar un grupo existente
    public boolean actualizarGrupo(Grupo grupo) {
        String query = "UPDATE grupos SET nombre_grupo = ?, carreras_id_carrera = ?, id_usuario = ? WHERE id_grupo = ?";
        boolean isUpdated = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, grupo.getNombreGrupo());
            ps.setInt(2, grupo.getIdCarrera());
            ps.setInt(3, grupo.getIdDocente());
            ps.setInt(4, grupo.getIdGrupo());

            isUpdated = ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error SQL: " + e.getMessage());
            System.out.println("Código de error SQL: " + e.getErrorCode());
            System.out.println("Estado SQL: " + e.getSQLState());
            return false;
        }

        return isUpdated;
    }

    // Actualizar el estado de un grupo
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

    // Verificar si el nombre del grupo ya existe
    public boolean nombreExistente(String nombreGrupo) {
        String query = "SELECT COUNT(*) FROM grupos WHERE nombre_grupo = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, nombreGrupo);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // Devuelve verdadero si el nombre ya existe
            }
        } catch (SQLException a) {
            throw new RuntimeException("Error al verificar la existencia del grupo", a);
        }
        return false; // Devuelve falso si el nombre no existe
    }

    // Asignar un aspirante a un grupo
    public boolean asignarAspiranteAGrupo(Grupo grupo, Aspirante aspirante) {
        String query = "INSERT INTO grupo_aspirantes (id_grupo, folio_aspirante) VALUES (?, ?)";
        boolean isAssigned = false;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, grupo.getIdGrupo());
            ps.setString(2, aspirante.getFolioAspirante());
            isAssigned = ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error SQL: " + e.getMessage());
            System.out.println("Código de error SQL: " + e.getErrorCode());
            System.out.println("Estado SQL: " + e.getSQLState());
            return false;
        }

        return isAssigned;
    }
}



