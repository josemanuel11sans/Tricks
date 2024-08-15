package mx.edu.utez.tricks.dao;


import mx.edu.utez.tricks.model.Carrera;
import mx.edu.utez.tricks.model.Grupo;
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
        String query = "INSERT INTO carreras (nombre_carrera, divisiones_academicas_id_division, estado) VALUES (?, ?, 1)";
        System.out.println("Query: " + query);
        System.out.println("Nombre Carrera: " + carrera.getNombreCarrera());
        System.out.println("ID División Académica: " + carrera.getIdDivisionAcademica());
        // Estado no se imprime porque está fijado en 1 en la consulta

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1, carrera.getNombreCarrera());
            ps.setInt(2, carrera.getIdDivisionAcademica());
            System.out.println("PreparedStatement: " + ps);
            int rowsAffected = ps.executeUpdate();
            System.out.println("Rows Affected: " + rowsAffected);
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error SQL: " + e.getMessage());
            System.out.println("Código de error SQL: " + e.getErrorCode());
            System.out.println("Estado SQL: " + e.getSQLState());
            return false;
        }
    }

    public boolean actualizarCarrera(Carrera carrera) {
        String query = "UPDATE carreras SET nombre_carrera = ?, divisiones_academicas_id_division = ? WHERE id_carrera = ?";
        System.out.println("Query: " + query);
        System.out.println("ID Carrera: " + carrera.getIdCarrera());
        System.out.println("Nombre Carrera: " + carrera.getNombreCarrera());
        System.out.println("ID División Académica: " + carrera.getIdDivisionAcademica());


        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {


            ps.setString(1, carrera.getNombreCarrera());
            ps.setInt(2, carrera.getIdDivisionAcademica());
            ps.setInt(3, carrera.getIdCarrera());


            System.out.println("PreparedStatement: " + ps);
            int rowsAffected = ps.executeUpdate();
            System.out.println("Rows Affected: " + rowsAffected);
            return rowsAffected > 0;


        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("Error SQL: " + e.getMessage());
            System.out.println("Código de error SQL: " + e.getErrorCode());
            System.out.println("Estado SQL: " + e.getSQLState());
            return false;
        }
    }

    public boolean actualizarEstado(Carrera carrera) {
        String query = "UPDATE carreras SET estado = ? WHERE id_carrera = ?";

        try (Connection con = DatabaseConnectionManager.getConnection();
             PreparedStatement ps = con.prepareStatement(query)) {


            ps.setInt(1, carrera.getIdEstado());
            ps.setInt(2, carrera.getIdCarrera());


            int rowsAffected = ps.executeUpdate();
            return rowsAffected > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean existeCarrera(String nombreCarrera) {
        boolean existe = false;
        try {
            Connection con = DatabaseConnectionManager.getConnection();
            String query = "SELECT COUNT(*) FROM carreras WHERE nombre_carrera = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, nombreCarrera);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                existe = true;
            }
            rs.close();
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return existe;
    }

}
