<%-- 
    Document   : nuevoproducto
    Created on : 25/05/2017, 09:48:44 AM
    Author     : kilroy
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Nuevo Producto</h1>
<h1>Bodegas  </h1>

<form action="" method="post">
 
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
    <input type="number" name="precio_compra" class="form-control" id="direccion_cliente">
  </div>
  <div class="form-group">
    <label for="id_proveedor">Proveedor: </label>
    <input type="number" name="venta_codigo" class="form-control" id="id_proveedor">
  </div>
  <div class="form-group">
    <label for="cantidad">Unidades en existencia: </label>
    <input type="number" name="cantidad" class="form-control" id="cantidad">
  </div>
    <div class="form-group">
    <label for="id_bodega">Bodega: </label>
    <select class="form-control selectpicker" name="id_bodega" id="id_bodega">
        <% ResultSet resultados = (ResultSet) request.getAttribute("resultados");
     while(resultados.next()){ %>
     <option name="<%= resultados.getString(1) %>"><%= resultados.getString(2) %></option>
            <% } %>
      </select>

    
  </div>
    
  <button type="submit" class="btn btn-default">Guardar</button>
</form>
<%@include file='templates/footer_user.html'%>
