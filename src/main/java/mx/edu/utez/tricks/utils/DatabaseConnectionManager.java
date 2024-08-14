package mx.edu.utez.tricks.utils;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class DatabaseConnectionManager {
    //define la rita de la base de daos
    private static final String JDBC_URL = "jdbc:mysql://3.87.221.157:3306/tricks";
    //define el  username de la base de datos
    private static final String USERNAME = "ivan";
    //define la contraseña de la base de datos
    private static final String PASSWORD = "password";
    // Crea una instancia de configuración de HikariCP.
    private static final HikariConfig config = new HikariConfig();
    //Declara el HikariDataSource que gestionará el pool de conexiones.
    private static final HikariDataSource dataSource;


    //Este bloque estático se ejecuta cuando la clase se carga en memoria.
    static {
        //Carga el controlador JDBC de MySQL.
        try { Class.forName("com.mysql.cj.jdbc.Driver"); }
        //Maneja la excepción si el controlador JDBC no se encuentra.
        catch (ClassNotFoundException e) { throw new RuntimeException("Error", e); }
        config.setJdbcUrl(JDBC_URL); //Configura la URL JDBC en HikariConfig.
        config.setUsername(USERNAME);//Configura el nombre de usuario en HikariConfig.
        config.setPassword(PASSWORD); //Configura la contraseña en HikariConfig.
        // Ajustes del pool
        config.setMinimumIdle(10000); //Número mínimo de conexiones inactivas en el pool.
        config.setMaximumPoolSize(100000); //Número máximo de conexiones en el pool.
        config.setConnectionTimeout(300000); // Tiempo máximo de espera para obtener una conexión del pool (30 segundos).
        dataSource = new HikariDataSource(config); //Crea el HikariDataSource con la configuración proporcionada.
    }
    //Método público y estático que devuelve una conexión a la base de datos
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }
    //Constructor privado para evitar que se creen instancias de esta clase.
    // Esto asegura que la clase solo se utilice de manera estática.
    private DatabaseConnectionManager() {
        // Private constructor to prevent instantiation
    }

    public static void close(Connection con, PreparedStatement ps) {

    }
}
