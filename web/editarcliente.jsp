<%-- 
    Document   : nuevocliente
    Created on : 25/05/2017, 09:34:48 AM
    Author     : kilroy
--%>
<% if (request.getParameter("cliente") == null){
    // si no se mando el parametro cliente redireccionar al listado
    response.sendRedirect("listadoClientes.jsp");
}
%>
<%@page import="java.lang.Integer.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@page import="modelos.ConsultasCliente"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Editar cliente</h1>
<form action="actualizarCliente" method="post">
    <%
        String nit = "";
        String nombre = "";
        String cliente = "";
        String apellido = "";
        String direccion = "";
        String telefono = "";
        
        int ID = Integer.parseInt(request.getParameter("cliente"));
        ConsultasCliente Conn = new ConsultasCliente();
        ResultSet clientes = Conn.getUno(ID);
        while(clientes.next()){ 
            nit = clientes.getString(2);
            nombre = clientes.getString(3);
            apellido = clientes.getString(4);
            direccion = clientes.getString(5);
            telefono = clientes.getString(6);
        } %>
 
  <div class="form-group">
    <label for="nit_cliente">Nit del Cliente: </label>
    <input type="text" name="nit_cliente" class="form-control" value="<%= nit %>" id="nit_cliente">
    <input type="hidden" name="id_cliente" value="<%= ID %>" id="nit_cliente">
  </div>
  <div class="form-group">
    <label for="nombre_cliente">Nombre del Cliente: </label>
    <input type="text" name="nombre_cliente" class="form-control"  value="<%= nombre %>" id="nombre_cliente">
  </div>
   <div class="form-group">
    <label for="apellido_cliente">Apellidos del Cliente: </label>
    <input type="text" name="apellido_cliente" class="form-control"  value="<%= apellido %>" id="apellido_cliente">
  </div>
    <div class="form-group">
    <label for="direccion_cliente">Dirección del Cliente: </label>
    <input type="text" name="direccion_cliente" class="form-control"  value="<%= direccion %>" id="direccion_cliente">
  </div>
    <div class="form-group">
    <label for="telefono_cliente">Telefono del Cliente: </label>
    <input type="tel" maxlength="8"  name="telefono_cliente" class="form-control"  value="<%= telefono %>" id="telefono_cliente">
  </div>
    
  <button type="submit" class="btn btn-default">Actualizar</button>
</form>
<%@include file='templates/footer_user.html'%>
