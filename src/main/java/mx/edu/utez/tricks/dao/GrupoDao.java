package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Grupo;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GrupoDao {

    // Read para todos los grupos
    public ArrayList<Grupo> getAll() {
        ArrayList<Grupo> lista = new ArrayList<>();
        String query = "{ CALL verGrupos() }";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Grupo g = new Grupo();
                g.setIdGrupo(rs.getInt("idGrupo"));
                g.setNombreGrupo(rs.getString("nombreGrupo"));
                g.setDocente(rs.getString("docente"));
                g.setCarrera(rs.getString("carrera"));
                g.setDivisionAcademica(rs.getString("divisionAcademica"));
                lista.add(g);
            }
            ps.close();
            con.close();
            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    // Insertar un nuevo grupo
    public boolean insert(Grupo grupo) {
        boolean isInserted = false;
        String query = "INSERT INTO grupo (nombreGrupo, docente, carrera, divisionAcademica) VALUES (?, ?, ?, ?)";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, grupo.getNombreGrupo());
            ps.setString(2, grupo.getDocente());
            ps.setString(3, grupo.getCarrera());
            ps.setString(4, grupo.getDivisionAcademica());
            isInserted = ps.executeUpdate() > 0;
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isInserted;
    }

    // Modificar un grupo existente
    public boolean update(Grupo grupo) {
        boolean isUpdated = false;
        String query = "UPDATE grupo SET nombreGrupo = ?, docente = ?, carrera = ?, divisionAcademica = ? WHERE idGrupo = ?";

        try {
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, grupo.getNombreGrupo());
            ps.setString(2, grupo.getDocente());
            ps.setString(3, grupo.getCarrera());
            ps.setString(4, grupo.getDivisionAcademica());
            ps.setInt(5, grupo.getIdGrupo());
            isUpdated = ps.executeUpdate() > 0;
            ps.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return isUpdated;
    }
}
