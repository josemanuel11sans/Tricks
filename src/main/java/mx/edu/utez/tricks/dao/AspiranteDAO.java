package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Aspirante;
import mx.edu.utez.tricks.model.Usuario;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AspiranteDAO {

    public List<Aspirante> getAllAspirantes() {
        List<Aspirante> aspirantes = new ArrayList<>();
        String query = "{ CALL GetAllAspirantes() }";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Aspirante aspirante = new Aspirante();
                aspirante.setFolioAspirante(rs.getString("folio_aspirante"));
                aspirante.setNombre(rs.getString("nombre"));
                aspirante.setApellidos(rs.getString("apellido"));
                aspirante.setCurp(rs.getString("curp"));
                aspirante.setGrupo2(rs.getString("nombre_grupo"));
                aspirante.setEstado(rs.getInt("estado"));
                aspirante.setFechaNacimiento(rs.getDate("fecha_nac"));

                aspirantes.add(aspirante);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return aspirantes;
    }

    public boolean agregarAspirante(Aspirante aspirante) {
        String query = "INSERT INTO aspirantes (folio_aspirante, nombre, apellido, curp, fecha_nac, grupos_id_grupo, estado) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, aspirante.getFolioAspirante());
            ps.setString(2, aspirante.getNombre());
            ps.setString(3, aspirante.getApellidos());
            ps.setString(4, aspirante.getCurp());
            ps.setDate(5, new java.sql.Date(aspirante.getFechaNacimiento().getTime()));
            ps.setInt(6, aspirante.getGrupo());
            ps.setInt(7, aspirante.getEstado());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizarAspirante(Aspirante aspirante) {
        String query = "UPDATE aspirantes SET nombre = ?, apellido = ?, curp = ?, fecha_nac = ?" +
                "WHERE folio_aspirante = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, aspirante.getNombre());
            ps.setString(2, aspirante.getApellidos());
            ps.setString(3, aspirante.getCurp());
            ps.setDate(4, new java.sql.Date(aspirante.getFechaNacimiento().getTime()));
            ps.setString(5, aspirante.getFolioAspirante());

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean actualizarEstado(Aspirante aspirante) {
        String query = "UPDATE aspirantes SET estado = ? " +
                "WHERE folio_aspirante = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setInt(1, aspirante.getEstado());
            ps.setString(2, aspirante.getFolioAspirante());


            int rowsAffected = ps.executeUpdate();
            con.close();
            ps.close();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean folioExistente(String folio) {
        String query = "SELECT COUNT(*) FROM aspirantes WHERE folio_aspirante = ?";
        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, folio);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                return count > 0; // Devuelve verdadero si el folio ya existe
            }
        } catch (SQLException a) {
            throw new RuntimeException("Error al verificar la existencia de la matrícula", a);
        }
        return false; // Devuelve falso si la matrícula no existe
    }

    public boolean curpExistente(String curp) {
        String query = "SELECT COUNT(*) FROM aspirantes WHERE curp = ?;";
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, curp);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt(1);
                ps.close();
                con.close();
                return count > 0;
            }
        } catch (SQLException a) {
            throw new RuntimeException(a);
        }
        return false;
    }

    // Método para ver que ningun usuario tiene ese curp
    public Aspirante buscarCurp(String folio) {
        String query = "SELECT * FROM aspirantes WHERE folio_aspirante = ?";
        Aspirante aspirante = null;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, folio);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                aspirante = new Aspirante();
                aspirante.setFolioAspirante(rs.getString("folio_aspirante"));
                aspirante.setNombre(rs.getString("nombre"));
                aspirante.setApellidos(rs.getString("apellido"));
                aspirante.setCurp(rs.getString("curp"));
                aspirante.setEstado(rs.getInt("estado"));
                aspirante.setFechaNacimiento(rs.getTimestamp("fecha_nac"));
                aspirante.setGrupo(rs.getInt("grupos_id_grupo"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return aspirante;
    }

    public Aspirante getAspiranteByFolio(String folioAspirante) {
        String query = "SELECT * FROM aspirantes WHERE folio_aspirante = ?";
        Aspirante aspirante = null;

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, folioAspirante);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                aspirante = new Aspirante();
                aspirante.setFolioAspirante(rs.getString("folio_aspirante"));
                aspirante.setNombre(rs.getString("nombre"));
                aspirante.setApellidos(rs.getString("apellido"));
                aspirante.setCurp(rs.getString("curp"));
                aspirante.setEstado(rs.getInt("estado"));
                aspirante.setFechaNacimiento(rs.getDate("fecha_nac"));
                aspirante.setGrupo(rs.getInt("grupos_id_grupo"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return aspirante;
    }
}



