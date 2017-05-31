<%-- 
    Document   : listadoProveedor
    Created on : 30/05/2017, 02:15:41 PM
    Author     : juan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@page import="modelos.ConsultasProveedor"%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Listado de proveedores</h1>
<form action="nuevoproveedor.jsp" method="post">
     <button type="submit" class="btn btn-default" value="nuevoproveedor.jsp">Nuevo</button>
</form>
<table class="table table-hover">
    <thead>
      <tr>
        <th>NIT del Proveedor</th>
        <th>Nombre del Proveedor</th>
        <th>Dirección del Proveedor</th>
        <th>Teléfono del Proveedor</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
<%
    ConsultasProveedor Conn = new ConsultasProveedor();
    ResultSet proveedor = Conn.listado();
     while(proveedor.next()){ %>
     <tr>
        <td><%= proveedor.getString(2) %></td>
        <td><%= proveedor.getString(3) %></td>
        <td><%= proveedor.getString(4) %></td>
        <td><%= proveedor.getString(5) %></td>
        <td>
            <a href="editarproveedor.jsp?proveedor=<%= proveedor.getString(1) %>" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>
<%@include file='templates/footer_user.html'%>
