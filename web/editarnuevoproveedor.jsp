<%-- 
    Document   : nuevoproveedor
    Created on : 24/05/2017, 10:19:59 PM
    Author     : kilroy
--%>


<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Nuevo Proveedor</h1>
<form action="" method="post">
  <div class="form-group">
    <label for="nit">NIT</label>
    <input type="number" name="nit" class="form-control" id="nit">
  </div>
  <div class="form-group">
    <label for="nombre_proveedor">Nombre del proveedor: </label>
    <input type="text" name="nombre_proveedor" class="form-control" id="nombre_proveedor">
  </div>
  <div class="form-group">
    <label for="direccion_proveedor">Direccion del proveedor: </label>
    <input type="text" name="direccion_proveedor" class="form-control" id="direccion_proveedor">
  </div>
   <div class="form-group">
    <label for="telefono_proveedor">telefono del proveedor: </label>
    <input type="text" name="telefono_proveedor" class="form-control" id="telefono_proveedor">
  </div>
     <div class="form-group">
    <label for="producto_id_producto">Id del producto: </label>
    <input type="number" name="producto_id_producto" class="form-control" id="producto_id_producto">
  </div>
  
  
  <button type="submit" class="btn btn-default">Guardar</button>
</form>
<%@include file='templates/footer_user.html'%>

