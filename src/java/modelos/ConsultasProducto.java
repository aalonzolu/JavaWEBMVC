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
public class ConsultasProducto extends Conexion{
    public int nuevo(String codigo, String nombre, String precio_venta, String precio_compra, String id_proveedor ,String cantidad) {
        int filas = 0;
        Statement st = null;
        try {
            
            st = connection.createStatement();
            String consultaSQL = "insert into producto(codigo_producto, nombre_producto, precio_venta, precio_compra, id_proveedor, cantidad) values " + "('" + codigo + "', '" + nombre + "','" + precio_venta + "', '" + precio_compra + "', '"+id_proveedor+"','"+cantidad+"')";
            filas = st.executeUpdate(consultaSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        }
        return filas;
    }
    public int actualizar(int id,String codigo,String nombre, String precio_venta, String precio_compra,String id_proveedor, String cantidad){
        int filas = 0;
        Statement st = null;
        try {
            //en la cadena de insercion no agregue venta_codigo ni venta_id_cliente ya que no me dejaba guardar los datos en la bd
            st = connection.createStatement();
            String udateSQL = "UPDATE cliente " +
                    "SET codigo_producto = '" + codigo + "', nombre_producto = '" + nombre + "'," +" precio_venta = '" + precio_venta + "'," 
                    +" precio_compra = '" + precio_compra + "'," +" id_proveedor = '" + id_proveedor + "'," +" cantidad = '" + cantidad + "' " +
                    " WHERE id_producto ="+id+";";
            
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
            String consultaSQL = "SELECT * FROM producto";
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
            String consultaSQL = "SELECT * FROM producto WHERE id_producto='"+id+"'";
            filas = st.executeQuery(consultaSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        } 
        return filas;
    } 
}
