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
public class ConsultasVenta extends Conexion {
    public int nuevo(String correlativo, String id_producto, String id_bodega, String cantidad, String precio_venta, String precio_compra, String id_cliente, String descuento, String fecha) {
        int filas = 0;
        Statement st = null;
        try {
            
            st = connection.createStatement();
            String consultaSQL = "insert into venta(correlativo, id_producto, id_bodega, cantidad, precio_venta, precio_compra, id_cliente, descuento, fecha) values " + "('" + correlativo + "', '" + id_producto + "','" + id_bodega + "', '" + cantidad + "', '"+precio_venta+"','"+precio_compra+"', '"+id_cliente+"','"+descuento+"','"+fecha+"')";
            filas = st.executeUpdate(consultaSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        }
        return filas;
    }
    public int actualizar(int id,String nit,String nombre, String apellido, String direccion,String telefono) {
        int filas = 0;
        Statement st = null;
        try {
            //en la cadena de insercion no agregue venta_codigo ni venta_id_cliente ya que no me dejaba guardar los datos en la bd
            st = connection.createStatement();
            String udateSQL = "UPDATE cliente " +
                    "SET nit_cliente = '" + nit + "', nombre_cliente = '" + nombre + "'," +" apellido_cliente = '" + apellido + "'," 
                    +" direccion_cliente = '" + direccion + "'," +" telefono_cliente = '" + telefono + "' " +
                    " WHERE id_cliente ="+id+";";
            
            System.out.println(udateSQL);
            filas = st.executeUpdate(udateSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
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
    
    public ResultSet getUno(int id) {
        ResultSet filas = null;
        Statement st = null;
        try {
            st = connection.createStatement();
            String consultaSQL = "SELECT * FROM cliente WHERE id_cliente='"+id+"'";
            filas = st.executeQuery(consultaSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        } 
        return filas;
    } 
}
