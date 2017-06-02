/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Arrays;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.ConsultasVenta;

/**
 *
 * @author lexo
 */
@WebServlet(name = "crearVenta", urlPatterns = {"/crearVenta"})
public class crearVenta extends HttpServlet {

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
        
        
        // datos de la venta
        String fecha = request.getParameter("fecha");
        String user = request.getParameter("user");
        String cliente = request.getParameter("cliente");
        int total_productos = 0;
        
        ConsultasVenta Conn = new ConsultasVenta();
        
        // productos como arreglos
        String[] idProducto;
        idProducto= request.getParameterValues("id[]");
        String[] codigoProducto;
        codigoProducto= request.getParameterValues("codigo[]");
        String[] cantidadProducto;
        cantidadProducto= request.getParameterValues("cantidad[]");
        String[] precioCompra;
        precioCompra = request.getParameterValues("precio_compra[]");
        String[] precioVenta;
        precioVenta = request.getParameterValues("precio_venta[]");
        try{
            total_productos = idProducto.length;
        } catch (Exception e) {
            System.err.println("Ha ocurrido un error: " + e.getMessage());
        }

        if(total_productos>0){
            // crear venta y obtener id_venta
            int venta_id = Conn.nuevo(fecha, user, cliente);
            for(int i = 0; i < idProducto.length; i++)
            {
            System.out.println("ID: "+idProducto[i]+" Codigo: "+codigoProducto[i]+" cantidad: "+cantidadProducto[i]+" precioCompra: "+precioCompra[i]+" Venta: "+precioVenta[i]);
            Conn.inserProducto(codigoProducto[i], idProducto[i], cantidadProducto[i], precioVenta[i], precioCompra[i], venta_id);
            }
            response.sendRedirect("pos.jsp?msg=Venta creada con exito");
        }else {
            response.sendRedirect("pos.jsp?error=Agregue por lo menos un elemento a la venta");
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
