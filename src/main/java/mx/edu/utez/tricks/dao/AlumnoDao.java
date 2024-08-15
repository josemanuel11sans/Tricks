package mx.edu.utez.tricks.dao;

import mx.edu.utez.tricks.model.Alumno;
import mx.edu.utez.tricks.model.Grupo;
import mx.edu.utez.tricks.utils.DatabaseConnectionManager;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AlumnoDao {

    /**
     * Obtiene una lista de alumnos pertenecientes a un grupo específico.
     *
     * @param grupoId El ID del grupo del cual se desean obtener los alumnos.
     * @return Una lista de objetos Alumno correspondientes al grupo especificado.
     */
    public List<Alumno> getAlumnosPorGrupo(int grupoId) {
        List<Alumno> alumnos2 = new ArrayList<>(); // Lista para almacenar los alumnos obtenidos
        String query = "SELECT a.folio_aspirante, a.nombre, a.apellido, c.nombre_carrera, a.estado, " +
                "COALESCE(cal.calificacion, 0) as calificacion " + // Utiliza COALESCE para manejar posibles valores nulos
                "FROM aspirantes a " +
                "JOIN grupos g ON a.grupos_id_grupo = g.id_grupo " + // Une la tabla de aspirantes con la tabla de grupos
                "JOIN carreras c ON g.carreras_id_carrera = c.id_carrera " + // Une la tabla de grupos con la tabla de carreras
                "LEFT JOIN calificaciones cal ON a.folio_aspirante = cal.aspirante_folio_aspirante " + // Une la tabla de aspirantes con la tabla de calificaciones
                "WHERE g.id_grupo = ?"; // Filtro para obtener solo los alumnos del grupo especificado

        try (Connection conn = DatabaseConnectionManager.getConnection(); // Establece conexión con la base de datos
             PreparedStatement stmt = conn.prepareStatement(query)) { // Prepara la consulta SQL

            stmt.setInt(1, grupoId); // Establece el parámetro del ID del grupo en la consulta
            //System.out.println(grupoId.getIdGrupo() + "id ");
            ResultSet rs = stmt.executeQuery(); // Ejecuta la consulta y obtiene los resultados

            while (rs.next()) { // Itera sobre cada fila del ResultSetx|
                Alumno alumno = new Alumno(); // Crea un nuevo objeto Alumno
                alumno.setFolio(rs.getString("folio_aspirante")); // Establece el folio del alumno
                alumno.setNombre(rs.getString("nombre") + " " + rs.getString("apellido")); // Establece el nombre completo del alumno
                alumno.setCarrera(rs.getString("nombre_carrera")); // Establece el nombre de la carrera
                alumno.setEstado(rs.getInt("estado")); // Establece el estado del alumno
                alumno.setCalificacion(rs.getDouble("calificacion")); // Establece la calificación del alumno
                alumnos2.add(alumno); // Agrega el alumno a la lista

            }
        } catch (SQLException e) { // Captura y maneja posibles errores SQL
            e.printStackTrace(); // Imprime el stack trace del error para depuración
        }
        return alumnos2; // Retorna la lista de alumnos obtenidos
    }
// Método existente para obtener alumnos por grupo

    /**
     * Actualiza la calificación de un alumno.
     *
     * @param folio        El folio del alumno.
     * @param calificacion La nueva calificación.
     * @return true si la calificación se actualizó correctamente, false en caso contrario.
     */
    public boolean actualizarCalificacion(String folio, double calificacion) {
        String query = "UPDATE calificaciones SET calificacion = ? WHERE aspirante_folio_aspirante = ?";
        boolean actualizado = false;

        try (Connection conn = DatabaseConnectionManager.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setDouble(1, calificacion);
            stmt.setString(2, folio);

            int filasAfectadas = stmt.executeUpdate();
            actualizado = (filasAfectadas > 0);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return actualizado;
    }
}
