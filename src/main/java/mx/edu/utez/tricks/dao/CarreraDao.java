package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Carreras;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CarreraDao {
    public ArrayList<Carreras> getAll() {
        ArrayList<Carreras> lista = new ArrayList<>();
        String query = "SELECT * FROM Carreras";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Carreras carrera = new Carreras();
                carrera.setIdCarrera(rs.getInt("idCarrera"));
                carrera.setNombreCarrera(rs.getString("nombreCarrera"));
                lista.add(carrera);
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
