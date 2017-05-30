<%-- 
    Document   : nuevoproveedor
    Created on : 24/05/2017, 10:19:59 PM
    Author     : kilroy
--%>
<% if (request.getParameter("proveedor") == null){
    // si no se mando el parametro cliente redireccionar al listado
    response.sendRedirect("listadoProveedor.jsp");
}
%>
<%@page import="java.lang.Integer.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@page import="modelos.ConsultasProveedor"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Nuevo Proveedor</h1>
<%
        String nit = "";
        String nombre = "";
        String direccion = "";
        String telefono = "";
        
        int ID = Integer.parseInt(request.getParameter("proveedor"));
        ConsultasProveedor Conn = new ConsultasProveedor();
        ResultSet proveedor = Conn.getUno(ID);
        while(proveedor.next()){ 
            nit = proveedor.getString(2);
            nombre = proveedor.getString(3);
            direccion = proveedor.getString(4);
            telefono = proveedor.getString(5);
        } %>
<form action="actualizarProveedor" method="post">
  <div class="form-group">
    <label for="nit">NIT</label>
    <input type="number" name="nit" class="form-control" value="<%= nit %>" id="nit">
     <input type="hidden" name="id_proveedor" value="<%= ID %>" id="nit">

  </div>
  <div class="form-group">
    <label for="nombre_proveedor">Nombre del proveedor: </label>
    <input type="text" name="nombre_proveedor" class="form-control" value="<%= nombre %>" id="nombre_proveedor">
  </div>
  <div class="form-group">
    <label for="direccion_proveedor">Direccion del proveedor: </label>
    <input type="text" name="direccion_proveedor" class="form-control" value="<%= direccion %>" id="direccion_proveedor">
  </div>
   <div class="form-group">
    <label for="telefono_proveedor">telefono del proveedor: </label>
    <input type="text" name="telefono_proveedor" class="form-control" value="<%= telefono %>" id="telefono_proveedor">
  </div>
   
  
  <button type="submit" class="btn btn-default">Actualizar</button>
</form>
<%@include file='templates/footer_user.html'%>

