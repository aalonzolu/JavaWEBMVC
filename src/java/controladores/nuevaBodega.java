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
import modelos.ConsultasBodega;
import modelos.ConsultasUser;

/**
 *
 * @author lexo
 */
@WebServlet(name = "nuevaBodega", urlPatterns = {"/nuevaBodega"})
public class nuevaBodega extends HttpServlet {

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
        String codigo = request.getParameter("codigo");
        String nombre_bodega = request.getParameter("nombre_bodega");
        String direccion_bodega = request.getParameter("direccion_bodega");
        String telefono_bodega = request.getParameter("telefono_bodega");
        
        if(!codigo.isEmpty() && !nombre_bodega.isEmpty() && !direccion_bodega.isEmpty() && !telefono_bodega.isEmpty()){
            
                ConsultasBodega Conn = new ConsultasBodega();
                Conn.nuevo( codigo, nombre_bodega,  direccion_bodega, telefono_bodega);
                response.sendRedirect("listadoBodegas.jsp");
            
        }
        else {
            response.sendRedirect("nuevabodega.jsp?error=Llene todos los campos");
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
