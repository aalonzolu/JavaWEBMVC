/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author crismtl
 */
public class ConsultasUser extends Conexion {

    public int registro(String username, String password,String name) {
        int filas = 0;
        Statement st = null;
        try {
            st = connection.createStatement();
            String consultaSQL = "insert into user(username, password,name) values " + "('" + username + "', '" + password + "', '" + name + "')";
            filas = st.executeUpdate(consultaSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        } finally {
            if (st != null) {
                try {
                    st.close();
                } catch (SQLException ex) {
                    System.err.println("Error cerrando la sentencia: " + ex.getMessage());
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    System.err.println("Error cerrando la conexión: " + ex.getMessage());
                }
            }
        }
        return filas;
    }
    public String login(String username, String password){
        int filas = 0;
        Statement st = null;
        ResultSet resultSet = null;
        String resName = "";
        try {
            st = connection.createStatement();
            String consultaSQL = "SELECT * FROM user WHERE username='" + username + "' AND password='" + password + "';";
            // Result set get the result of the SQL query
            resultSet = st.executeQuery(consultaSQL);
            //Contar los resultados
            int rowcount = 0;
            if (resultSet.last()) {
              rowcount = resultSet.getRow();
              resultSet.beforeFirst(); // regresar al primero
            }
            if(rowcount>=1){
                // se encontraron registros y se setea el nombre
                while (resultSet.next()) {
                    resName = resultSet.getString("name");
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Ha ocurrido un error: " + e.getMessage());
        }
        return resName;
    }
}