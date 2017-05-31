<%-- 
    Document   : nuevoproducto
    Created on : 25/05/2017, 09:48:44 AM
    Author     : kilroy
--%>
<%@page import="modelos.ConsultasProveedor"%>
<%@page import="modelos.ConsultasBodega"%>
<% if (request.getParameter("producto") == null){
    // si no se mando el parametro cliente redireccionar al listado
    response.sendRedirect("listadoProductos.jsp");
}
%>
<%@page import="java.lang.Integer.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@page import="modelos.ConsultasProducto"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Nuevo Producto</h1>
<form action="actualizarProducto" method="post">
 <%
        String codigo = "";
        String nombre = "";
        String precio_venta = "";
        String precio_compra = "";
        String id_proveedor= "";
        String cantidad= "";
        String id_bodega="";
        
        
        int ID = Integer.parseInt(request.getParameter("producto"));
        ConsultasProducto Conn = new ConsultasProducto();
        ResultSet productos = Conn.getUno(ID);
        while(productos.next()){ 
            codigo = productos.getString(2);
            nombre = productos.getString(3);
            precio_venta = productos.getString(4);
            precio_compra = productos.getString(5);
            id_proveedor = productos.getString(6);
            cantidad = productos.getString(7);
            id_bodega = productos.getString(8);
        } %>
  <div class="form-group">
    <label for="codigo_producto">Codigo Producto: </label>
    <input type="text" name="codigo_producto" class="form-control" value="<%= codigo %>" id="codigo_producto">
     <input type="hidden" name="id_producto" value="<%= ID %>" id="codigo_producto">
  </div>
  <div class="form-group">
    <label for="nombre_producto">Nombre del Producto: </label>
    <input type="text" name="nombre_producto" class="form-control"value="<%= nombre %>" id="nombre_producto">
  </div>
   <div class="form-group">
    <label for="precio_venta">Precio de venta: </label>
    <input type="number" name="precio_venta" class="form-control" value="<%= precio_venta %>" id="precio_venta">
  </div>
    <div class="form-group">
    <label for="precio_compra">Precio de Compra: </label>
    <input type="number" name="precio_compra" class="form-control"value="<%= precio_compra %>" id="precio_compra">
  </div>
  <div class="form-group">
    <label for="id_proveedor">Proveedor: </label>
    <select name="id_proveedor" class="form-control <%= id_proveedor %>" id="id_proveedor">
        <% ConsultasProveedor ConnP = new ConsultasProveedor();
    ResultSet proveedores = ConnP.listado();
     while(proveedores.next()){ %>
     <option value="<%= proveedores.getString(1) %>"<%
             if(proveedores.getString(1).equals(id_proveedor)){
                 %> selected <%
             }
             %>><%= proveedores.getString(3) %></option>
      <% } %>
    </select>
  </div>
  <div class="form-group">
    <label for="id_bodega">Bodega: </label>
    <select name="id_bodega" class="form-control" id="id_bodega">
        <%
    ConsultasBodega Conn3 = new ConsultasBodega();
    ResultSet bodega = Conn3.listado();
     while(bodega.next()){ %>
     <option value="<%= bodega.getString(1) %>"<%if(bodega.getString(1).equals(id_bodega)){
%> selected <%}%>><%= bodega.getString(2) %></option>
      <% } %>
    </select>
  </div>
  <div class="form-group">
    <label for="cantidad">Unidades en existencia: </label>
    <input type="number" name="cantidad" class="form-control" value="<%= cantidad %>" id="cantidad">
  </div>
    
    
  <button type="submit" class="btn btn-default">Actualizar</button>
</form>
<%@include file='templates/footer_user.html'%>
