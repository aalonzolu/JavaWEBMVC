/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author crismtl
 */
public class Conexion {

    public static final String USERNAME = "root";
    public static final String PASSWORD = "";
    public static final String HOST = "127.0.0.1";
    public static final String PORT = "3306";
    public static final String DATABASE = "inventario";
    public static final String CLASSNAME = "com.mysql.jdbc.Driver";
    public static final String URL = "jdbc:mysql://" + HOST + ":" + PORT + "/" + DATABASE;

    public Connection connection;

    public Conexion() {
        try {
            Class.forName(CLASSNAME);
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.err.println("Error de clase: " + e.toString());
        } catch (SQLException e) {
            System.err.println("Error de sql: " + e.toString());
        }
    }
}
