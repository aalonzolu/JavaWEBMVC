<%-- 
    Document   : nuevobodega
    Created on : 25/05/2017, 09:25:02 AM
    Author     : kilroy
--%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Nueva Bodega</h1>
<form action="nuevaBodega" method="post">
  <div class="form-group">
    <label for="codigo">Codigo</label>
    <input type="number" name="codigo" class="form-control" id="codigo">
  </div>
  <div class="form-group">
    <label for="nombre">Nombre de la Bodega: </label>
    <input type="text" name="nombre_bodega" class="form-control" id="nombre_proveedor">
  </div>
  <div class="form-group">
    <label for="direccion_bodega">Direccion de la Bodega: </label>
    <input type="text" name="direccion_bodega" class="form-control" id="direccion_bodega">
  </div>
   <div class="form-group">
    <label for="telefono_bodega">Telefono de la Bodega: </label>
    <input type="text" name="telefono_bodega" class="form-control" id="telefono_bodega">
  </div>
    
  <button type="submit" class="btn btn-default">Guardar</button>
</form>
<%@include file='templates/footer_user.html'%>


