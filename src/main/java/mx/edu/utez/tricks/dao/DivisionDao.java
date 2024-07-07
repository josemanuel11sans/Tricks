package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.DivicionesAcademicas;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DivisionDao {
    public ArrayList<DivicionesAcademicas> getAll() {
        ArrayList<DivicionesAcademicas> lista = new ArrayList<>();
        String query = "SELECT * FROM DivicionesAcademicas";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                DivicionesAcademicas division = new DivicionesAcademicas();
                division.setIdDivision(rs.getInt("idDivision"));
                division.setNombreDivision(rs.getString("nombreDivision"));
                division.setCoordinadorDivision(rs.getString("coordinadorDivision"));
                lista.add(division);
            }
            ps.close();
            con.close();
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
}
