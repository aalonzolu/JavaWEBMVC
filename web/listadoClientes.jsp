<%-- 
    Document   : listadoClientes
    Created on : May 28, 2017, 5:15:41 PM
    Author     : lexo
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@page import="modelos.ConsultasCliente"%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Listado de clientes registrados</h1>
<a href="nuevocliente.jsp" class="btn btn-default btn-circle btn-danger"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
<table class="table table-hover">
    <thead>
      <tr>
        <th>Nombre</th>
        <th>Apellido</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
<%
    ConsultasCliente Conn = new ConsultasCliente();
    ResultSet clientes = Conn.listado();
     while(clientes.next()){ %>
     <tr>
        <td><%= clientes.getString(3) %></td>
        <td><%= clientes.getString(4) %></td>
        <td><%= clientes.getString(5) %></td>
        <td><%= clientes.getString(6) %></td>
        <td>
            <a href="editarcliente.jsp?cliente=<%= clientes.getString(1) %>" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>
<%@include file='templates/footer_user.html'%>
