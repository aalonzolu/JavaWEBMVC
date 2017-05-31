<%-- 
    Document   : nuevocliente
    Created on : 25/05/2017, 09:34:48 AM
    Author     : kilroy
--%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Nuevo Cliente</h1>
<form action="nuevoCliente" method="post">
 
  <div class="form-group">
    <label for="nit_cliente">Nit del Cliente: </label>
    <input type="text" name="nit_cliente" class="form-control" id="nit_cliente">
  </div>
  <div class="form-group">
    <label for="nombre_cliente">Nombre del Cliente: </label>
    <input type="text" name="nombre_cliente" class="form-control" id="nombre_cliente">
  </div>
   <div class="form-group">
    <label for="apellido_cliente">Apellidos del Cliente: </label>
    <input type="text" name="apellido_cliente" class="form-control" id="apellido_cliente">
  </div>
    <div class="form-group">
    <label for="direccion_cliente">Dirección del Cliente: </label>
    <input type="text" name="direccion_cliente" class="form-control" id="direccion_cliente">
  </div>
    <div class="form-group">
    <label for="telefono_cliente">Telefono del Cliente: </label>
    <input type="tel" maxlength="8"  name="telefono_cliente" class="form-control" id="telefono_cliente">
  </div>
    
  <button type="submit" class="btn btn-default">Guardar</button>
</form>
<%@include file='templates/footer_user.html'%>
