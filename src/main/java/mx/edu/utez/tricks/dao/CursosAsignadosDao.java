package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.CursosAsignados;

import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class CursosAsignadosDao {
    public ArrayList<CursosAsignados> getAll(){
        ArrayList<CursosAsignados> listaCursosAsignados = new ArrayList<>();
        String query = "{call GetGroupCareerInfo() }";
        try{
            Connection con = DatabaseConnectionManager.getConnection();
            PreparedStatement ps = con.prepareStatement(query);
            //esto ejeccuta la consulta
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                CursosAsignados u = new CursosAsignados();

                u.setGrupos(rs.getString("grupo"));
                u.setCarrera(rs.getString("carrera"));
                u.setEstado(rs.getString("estado"));
                u.setAsistencia_id(rs.getInt("asistencia"));
                u.setCalificacion_id(rs.getInt("calificacion"));

                listaCursosAsignados.add(u);
            }
            rs.close();
            ps.close();
            con.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return listaCursosAsignados;
    }

}
