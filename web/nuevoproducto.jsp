<%-- 
    Document   : nuevoproducto
    Created on : 25/05/2017, 09:48:44 AM
    Author     : kilroy
--%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Nuevo Producto</h1>
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
    <label for="id_proveedor">id del Proveedor: </label>
    <input type="number" name="venta_codigo" class="form-control" id="id_proveedor">
  </div>
  <div class="form-group">
    <label for="cantidad">Unidades en existencia: </label>
    <input type="number" name="cantidad" class="form-control" id="cantidad">
  </div>
    <div class="form-group">
    <label for="id_bodega">Id Bodega: </label>
    <input type="number" name="id_bodega" class="form-control" id="id_bodega">
  </div>
    
  <button type="submit" class="btn btn-default">Guardar</button>
</form>
<%@include file='templates/footer_user.html'%>
