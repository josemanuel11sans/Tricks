package mx.edu.utez.tricks.dao;


import mx.edu.utez.tricks.model.DivisionesAcademicas;
import mx.edu.utez.tricks.model.Grupo;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class DivisionesAcademicasDAO {


    public List<DivisionesAcademicas> getAllDivisiones() {
        List<DivisionesAcademicas> divisiones = new ArrayList<>();
        String query = "{ call verDivisionesAcademicas()}";


        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {


            while (rs.next()) {
                DivisionesAcademicas division = new DivisionesAcademicas();
                division.setIdDivision(rs.getInt("id_division"));
                division.setNombreDivision(rs.getString("nombre_division"));
                division.setCoordinadorDivision(rs.getString("coordinador_division"));
                division.setSiglas(rs.getString("siglas"));
                division.setEstado(rs.getInt("estado"));


                divisiones.add(division);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }


        return divisiones;
    }


    public boolean agregarDivision(DivisionesAcademicas division) {
        String query = "INSERT INTO divisiones_academicas (nombre_division, siglas ,coordinador_division,estado) " +
                "VALUES (?, ?, ?, 1)";


        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {


            ps.setString(1, division.getNombreDivision());
            ps.setString(2, division.getSiglas());
            ps.setString(3, division.getCoordinadorDivision());
            ; // Asumiendo que tienes un método getEstado() en tu clase DivisionesAcademicas


            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error SQL: " + e.getMessage());
            System.out.println("Código de error SQL: " + e.getErrorCode());
            System.out.println("Estado SQL: " + e.getSQLState());
            return false;
        }
    }


    public boolean actualizarDivision(DivisionesAcademicas division) {
        String query = "UPDATE divisiones_academicas SET nombre_division = ?, siglas = ?, coordinador_division = ? WHERE id_division = ?";


        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {


            ps.setString(1, division.getNombreDivision());
            ps.setString(2, division.getSiglas());
            ps.setString(3, division.getCoordinadorDivision());
            ps.setInt(4, division.getIdDivision());  // Asumiendo que tienes un método getIdDivision() en tu clase DivisionesAcademicas


            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error SQL: " + e.getMessage());
            System.out.println("Código de error SQL: " + e.getErrorCode());
            System.out.println("Estado SQL: " + e.getSQLState());
            return false;
        }
    }




    public boolean actualizarEstado(DivisionesAcademicas division) {
        String query = "UPDATE divisiones_academicas SET estado = ? WHERE id_division = ?";


        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {


            ps.setInt(1, division.getEstado());
            ps.setInt(2, division.getIdDivision());


            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;


        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
