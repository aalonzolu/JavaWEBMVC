/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;
import java.sql.*;
//import java.sql.SQLException;
//import java.sql.Statement;
/**
 *
 * @author lexo
 */
public class ConsultasBodega extends Conexion  {
    
    public int nuevo(String codigo,String nombre, String direccion,String telefono) {
        int filas = 0;
        
        Statement st = null;
        try {
            st = connection.createStatement();
            String consultaSQL = "insert into bodega(codigo, nombre,direccion_bodega,telefono_bodega) values " + "('" + codigo + "', '" + nombre + "', '" + direccion + "', '"+telefono+"')";
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
    
    public ResultSet listado() {
        ResultSet filas = null;
        Statement st = null;
        try {
            st = connection.createStatement();
            String consultaSQL = "SELECT * FROM bodega";
            filas = st.executeQuery(consultaSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        } 
        return filas;
    }
     public ResultSet getUno(int id) {
        ResultSet filas = null;
        Statement st = null;
        try {
            st = connection.createStatement();
            String consultaSQL = "SELECT * FROM bodega WHERE id_bodega='"+id+"'";
            filas = st.executeQuery(consultaSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        } 
        return filas;
    }
     public int actualizar(int idbodega, String codigo,String nombre, String direccion,String telefono) {
        int filas = 0;
        Statement st = null;
        try {
            
            st = connection.createStatement();
            String udateSQL = "UPDATE bodega " +
                    "SET codigo = '"+codigo+"', nombre= '" + nombre + "'," +" direccion_bodega = '" + direccion + "'," 
                    +" telefono_bodega = '" + telefono + "' " +"  WHERE id_bodega ="+idbodega+";";
            System.out.println(udateSQL);
            filas = st.executeUpdate(udateSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        }
        return filas;
    }

}
