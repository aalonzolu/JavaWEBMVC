<%-- 
    Document   : listadoProductos
    Created on : 29/05/2017, 09:10:00 PM
    Author     : kilroy
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@page import="modelos.ConsultasProducto"%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Listado de productos a la venta</h1>

<table class="table table-hover">
    <thead>
      <tr>
        <th>Nombre del Producto</th>
        <th>Precio en Venta</th>
        <th>Precio en Compra</th>
        <th>Proveedor</th>
        <th>Unidades en Existencia</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
<%
    ConsultasProducto Conn = new ConsultasProducto();
    ResultSet productos = Conn.listado();
     while(productos.next()){ %>
     <tr>
        <td><%= productos.getString(3) %></td>
        <td><%= productos.getString(4) %></td>
        <td><%= productos.getString(5) %></td>
        <td><%= productos.getString(6) %></td>
         <td><%= productos.getString(7) %></td>
        <td>
            <a href="editarproducto.jsp?producto=<%= productos.getString(1) %>" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>
<%@include file='templates/footer_user.html'%>
