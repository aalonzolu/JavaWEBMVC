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
    public int nuevo(String fecha, String usuario, String cliente) {
        int id = 0;
        int lastid =0;
        Statement st = null;
        try {
            
            st = connection.createStatement();
            String consultaSQL = "insert into venta(fecha_venta, user_id, cliente_id) values " + "('" + fecha + "', '" + usuario + "','" + cliente + "')";
            id = st.executeUpdate(consultaSQL, Statement.RETURN_GENERATED_KEYS);
            ResultSet rs = st.executeQuery("SELECT MAX(id_venta) AS id FROM venta");
            while(rs.next()){
                lastid = rs.getInt(1);
            }
            
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        }
        // obtener el ultimo id ingresado
        System.out.println("Last ID: "+lastid);
        
        return lastid;
    }
    
    public int inserProducto(String codigo_producto,String id_producto, String cantidad, String precio_venta, String precio_compra,int id_venta) {
        int id = 0;
        Statement st = null;
        try {
            
            st = connection.createStatement();
                String consultaSQL = "insert into venta_detalle(codigo_producto,id_producto, cantidad, precio_venta,precio_compra,id_venta) values " + 
                    "('" + codigo_producto + "', '" + id_producto + "', '" + cantidad + "','" + precio_venta + "','" + precio_compra + "','" + id_venta + "')";
            id = st.executeUpdate(consultaSQL);
            // restar elementos
            this.restar(Integer.parseInt(id_producto),Integer.parseInt(cantidad));
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        }
        return id;
    }
    public int anular(int id) {
        int filas = 0;
        Statement st = null;
        try {
            //en la cadena de insercion no agregue venta_codigo ni venta_id_cliente ya que no me dejaba guardar los datos en la bd
            st = connection.createStatement();
            String udateSQL = "UPDATE venta SET status='0' WHERE id_venta='"+id+"';";
            System.out.println(udateSQL);
            filas = st.executeUpdate(udateSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        }
        return filas;
    }
    
    public int restar(int id,int cantidad) {
        int filas = 0;
        Statement st = null;
        try {
            //restar elementos al producto vendido
            st = connection.createStatement();
            String udateSQL = "UPDATE producto SET cantidad=cantidad-"+cantidad+" WHERE id_producto='"+id+"';";
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
            String consultaSQL = "SELECT * FROM venta WHERE status='1'";
            filas = st.executeQuery(consultaSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        } 
        return filas;
    }
    
    public ResultSet anulados() {
        ResultSet filas = null;
        Statement st = null;
        try {
            st = connection.createStatement();
            String consultaSQL = "SELECT * FROM venta WHERE status='0'";
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
            String consultaSQL = "SELECT * FROM venta WHERE id_venta='"+id+"'";
            filas = st.executeQuery(consultaSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        } 
        return filas;
    }
    public ResultSet getElementosVenta(int id) {
        ResultSet filas = null;
        Statement st = null;
        try {
            st = connection.createStatement();
            String consultaSQL = "SELECT * FROM venta_detalle WHERE id_venta='"+id+"'";
            filas = st.executeQuery(consultaSQL);
        } catch (SQLException e) {
            System.err.println("Error en la carga del driver: " + e.getMessage());
        } 
        return filas;
    }
    
    public String getTotalVenta(int id){
        Statement st = null;
        ResultSet resultSet = null;
        String resVal = null;
        try {
            st = connection.createStatement();
            String consultaSQL = "SELECT sum(precio_venta*cantidad) as total_venta FROM venta_detalle WHERE id_venta='"+id+"';";
            // Result set get the result of the SQL query
            resultSet = st.executeQuery(consultaSQL);
            while (resultSet.next()) {
                resVal = resultSet.getString(1);
            }
            
        } catch (SQLException e) {
            System.err.println("Ha ocurrido un error: " + e.getMessage());
        }
        return resVal;
    }
}
