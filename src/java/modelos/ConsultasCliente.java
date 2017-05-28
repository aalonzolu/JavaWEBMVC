/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;
import java.sql.*;
/**
 *
 * @author kilroy
 */
public class ConsultasCliente extends Conexion{
    public int nuevo(String nit,String nombre, String apellido, String direccion,String telefono, String venta_codigo, String venta_id_cliente) {
        int filas = 0;
        Statement st = null;
        try {
            //en la cadena de insercion no agregue venta_codigo ni venta_id_cliente ya que no me dejaba guardar los datos en la bd
            st = connection.createStatement();
            String consultaSQL = "insert into cliente(nit_cliente, nombre_cliente, apellido_cliente, direccion_cliente, telefono_cliente) values " + "('" + nit + "', '" + nombre + "','" + apellido + "', '" + direccion + "', '"+telefono+"')";
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
            String consultaSQL = "SELECT * FROM cliente";
            filas = st.executeQuery(consultaSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        } 
        return filas;
    }
}
