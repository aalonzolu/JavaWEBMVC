<%-- 
    Document   : nuevaventa
    Created on : 25/05/2017, 10:34:56 AM
    Author     : juan
--%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Nueva Venta</h1>
<form action="nuevaVenta" method="post">
  <div class="form-group" >
    <label for="correlativo">Correlativo de la venta: </label>
    <input type="text" name="correlativo" class="form-control" id="correlativo">
  </div>
  <div class="form-group">
    <label for="id_producto">Producto: </label>
    <input type="int" name="id_producto" class="form-control" id="id_producto">
  </div>
  <div class="form-group">
    <label for="id_bodega">Bodega: </label>
    <input type="number" name="id_bodega" class="form-control" id="id_bodega">
  </div>
    
   <div class="form-group">
    <label for="cantidad">cantidad vendida: </label>
    <input type="number" name="cantidad" class="form-control" id="cantidad">
  </div>
     <div class="form-group">
    <label for="precio_venta">Precio de la venta: </label>
    <input type="number" name="precio_venta" class="form-control" id="precio_venta">
  </div>
     <div class="form-group">
    <label for="precio_compra">Precio de la compra: </label>
    <input type="number" name="precio_compra" class="form-control" id="precio_compra">
  </div>
     <div class="form-group">
    <label for="id_cliente">Cliente: </label>
    <input type="number" name="id_cliente" class="form-control" id="id_cliente">
  </div>
     <div class="form-group">
    <label for="descuento">Descuento: </label>
    <input type="number" name="descuento" class="form-control" id="descuento">
  </div>
     <div class="form-group">
    <label for="fecha">Fecha de la venta: </label>
    <input type="date" name="fecha" class="form-control" id="fecha">
  </div>
     <div class="form-group">
    <label for="id_usuario">Usuario: </label>
    <input type="number" name="id_usuario" class="form-control" id="id_usuario">
  </div>
  
  
  <button type="submit" class="btn btn-default">Guardar</button>
</form>
<%@include file='templates/footer_user.html'%>


