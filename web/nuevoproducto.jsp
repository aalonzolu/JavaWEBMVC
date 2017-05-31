<%-- 
    Document   : nuevoproducto
    Created on : 25/05/2017, 09:48:44 AM
    Author     : kilroy
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@page import="modelos.ConsultasBodega"%>
<%@page import="modelos.ConsultasProveedor"%>


<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Nuevo Producto</h1>
<h1>Bodegas  </h1>

<form action="nuevoProducto" method="post">
 
  <div class="form-group">
    <label for="codigo_producto">Codigo Producto: </label>
    <input type="text" name="codigo_producto" class="form-control" id="codigo_producto">
  </div>
  <div class="form-group">
    <label for="nombre_producto">Nombre del Producto: </label>
    <input type="text" name="nombre_producto" class="form-control" id="nombre_producto">
  </div>
   <div class="form-group">
    <label for="precio_venta">Precio de venta: </label>
    <input type="number" name="precio_venta" class="form-control" id="precio_venta">
  </div>
    <div class="form-group">
    <label for="precio_compra">Precio de Compra: </label>
    <input type="number" name="precio_compra" class="form-control" id="precio_compra">
  </div>
  <div class="form-group">
    <label for="id_proveedor">Proveedor: </label>
    <select name="id_proveedor" class="form-control" id="id_proveedor">
        <% ConsultasProveedor ConnP = new ConsultasProveedor();
    ResultSet proveedores = ConnP.listado();
     while(proveedores.next()){ %>
     <option value="<%= proveedores.getString(1) %>"><%= proveedores.getString(3) %></option>
      <% } %>
    </select>
  </div>
  <div class="form-group">
    <label for="id_bodega">Bodega: </label>
    <select name="id_bodega" class="form-control" id="id_bodega">
        <%
    ConsultasBodega Conn = new ConsultasBodega();
    ResultSet bodega = Conn.listado();
     while(bodega.next()){ %>
     <option value="<%= bodega.getString(1) %>"><%= bodega.getString(2) %></option>
      <% } %>
    </select>
  </div>
  
  <div class="form-group">
    <label for="cantidad">Unidades en existencia: </label>
    <input type="number" name="cantidad" class="form-control" id="cantidad">
  </div>
   
    
  <button type="submit" class="btn btn-default">Guardar</button>
</form>
<%@include file='templates/footer_user.html'%>
