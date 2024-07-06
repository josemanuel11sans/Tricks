package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Aspirante;
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
        String query = " CALL verAspirantes() ";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Aspirante aspirante = new Aspirante();
                aspirante.setFolioAspirante(rs.getString("folio_aspirante"));
                aspirante.setNombre(rs.getString("nombre"));
                aspirante.setApellidos(rs.getString("apellido"));
                aspirante.setCurp(rs.getString("curp"));
                aspirante.setGrupo(rs.getString("grupos_id_grupo"));
                aspirante.setEstado(rs.getString("estado_id_estado"));

                aspirantes.add(aspirante);
            }
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return aspirantes;
    }

    public boolean agregarAspirante(Aspirante aspirante) {
        String query = "INSERT INTO aspirante (folio_aspirante, nombre, apellido, curp, fecha_nac, grupos_id_grupo, estado_id_estado) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, aspirante.getFolioAspirante());
            ps.setString(2, aspirante.getNombre());
            ps.setString(3, aspirante.getApellidos());
            ps.setString(4, aspirante.getCurp());
            ps.setDate(5, new java.sql.Date(aspirante.getFechaNacimiento().getTime()));
            ps.setString(6, aspirante.getGrupo());


            ps.close();
            con.close();

            ps.setString(7, aspirante.getEstado());



            ps.close();
            con.close();
            ps.setString(7, aspirante.getEstado());


            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }

    }

    public boolean actualizarAspirante(Aspirante aspirante) {
        String query = "UPDATE aspirante SET nombre = ?, apellido = ?, curp = ?, fecha_nac = ?, grupos_id_grupo = ?, estado_id_estado = ? " +
                "WHERE folio_aspirante = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, aspirante.getNombre());
            ps.setString(2, aspirante.getApellidos());
            ps.setString(3, aspirante.getCurp());
            ps.setDate(4, new java.sql.Date(aspirante.getFechaNacimiento().getTime()));
            ps.setString(5, aspirante.getGrupo());

            ps.setString(6, aspirante.getFolioAspirante());
            ps.close();
            con.close();
            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }


    public boolean eliminarAspirante(String folioAspirante) {
        String query = "DELETE FROM aspirante WHERE folio_aspirante = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {

            ps.setString(1, folioAspirante);
            // ps.setString(6, .getEstado());
            //ps.setString(7, aspirante.getFolioAspirante());
            ps.close();
            con.close();

            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}
