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
import modelos.ConsultasCliente;

/**
 *
 * @author lexo
 */
@WebServlet(name = "actualizarCliente", urlPatterns = {"/actualizarCliente"})
public class actualizarCliente extends HttpServlet {

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
        // Obtener datos
        int id = Integer.parseInt(request.getParameter("id_cliente"));
        String nit = request.getParameter("nit_cliente");
        String nombre = request.getParameter("nombre_cliente");
        String apellido= request.getParameter("apellido_cliente");
        String direccion = request.getParameter("direccion_cliente");
        String telefono = request.getParameter("telefono_cliente");
        
        
        if(id>0 && !nit.isEmpty() && !nombre.isEmpty() && !apellido.isEmpty() && !direccion.isEmpty() && !telefono.isEmpty()){
            
                ConsultasCliente Conn = new ConsultasCliente();
                Conn.actualizar(id,nit, nombre, apellido, direccion, telefono);
                response.sendRedirect("listadoClientes.jsp");
            
        }
        else {
            response.sendRedirect("nuevocliente.jsp?error=Llene todos los campos");
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
