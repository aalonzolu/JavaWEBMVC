/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.ConsultasVenta;
/**
 *
 * @author juan
 */
@WebServlet(name = "nuevaVenta", urlPatterns = {"/nuevaVenta"})
public class nuevaVenta extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String correlativo = request.getParameter("correlativo");
        String id_producto = request.getParameter("id_producto");
        String id_bodega= request.getParameter("id_bodega");
        String cantidad = request.getParameter("cantidad");
        String precio_venta = request.getParameter("precio_venta");
        String precio_compra = request.getParameter("precio_compra");
        String id_cliente = request.getParameter("id_cliente");
        String descuento = request.getParameter("descuento");
        String fecha = request.getParameter("fecha");
        
        if(!correlativo.isEmpty() && !id_producto.isEmpty() && !id_bodega.isEmpty() && !cantidad.isEmpty() && !precio_venta.isEmpty() && !precio_compra.isEmpty() && !id_cliente.isEmpty() && !descuento.isEmpty() && !fecha.isEmpty()){
            
                ConsultasVenta Conn = new ConsultasVenta();
                Conn.nuevo(correlativo, id_producto, id_bodega, cantidad, precio_venta, precio_compra, id_cliente, descuento, fecha);
                response.sendRedirect("listadoVentas.jsp");
            
        }
        else {
            response.sendRedirect("nuevaventa.jsp?error=Llene todos los campos");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
