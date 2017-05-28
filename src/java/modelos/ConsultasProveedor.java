/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;
import java.sql.*;
/**
 *
 * @author juan
 */
public class ConsultasProveedor extends Conexion {
     public int nuevo(String nit, String nombre, String direccion, String telefono, String producto_id_producto) {
        int filas = 0;
        Statement st = null;
        try {
            st = connection.createStatement();
            //en la cadena insercion no coloque producto id producto ya que no me dejaba guardar los datos en la base de datos producto_id_producto = fk
            String consultaSQL = "insert into proveedor(nit, nombre_proveedor, direccion_proveedor, telefono_proveedor) values " + "('" + nit + "', '" + nombre + "', '" + direccion + "', '"+telefono+"')";
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
            String consultaSQL = "SELECT * FROM proveedor";
            filas = st.executeQuery(consultaSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        } 
        return filas;
    }
}
