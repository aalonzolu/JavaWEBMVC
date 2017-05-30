<%-- 
    Document   : listadoVentas
    Created on : 29/05/2017, 10:28:36 PM
    Author     : juan
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@page import="modelos.ConsultasVenta"%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Listado de productos a la venta</h1>

<table class="table table-hover">
    <thead>
      <tr>
        <th>Correlativo</th>
        <th>Producto</th>
        <th>Bodega</th>
        <th>Cantidad</th>
        <th>Precio en Venta</th>
        <th>Precio en Compra</th>
        <th>Cliente</th>
        <th>Descuento</th>
        <th>Fecha de la compra</th>
        <th>Acciones</th>
        
      </tr>
    </thead>
    <tbody>
<%
    ConsultasVenta Conn = new ConsultasVenta();
    ResultSet ventas = Conn.listado();
     while(ventas.next()){ %>
     <tr>
        <td><%= ventas.getString(2) %></td>
        <td><%= ventas.getString(3) %></td>
        <td><%= ventas.getString(4) %></td>
        <td><%= ventas.getString(5) %></td>
        <td><%= ventas.getString(6) %></td>
        <td><%= ventas.getString(7) %></td>
        <td><%= ventas.getString(8) %></td>
        <td><%= ventas.getString(9) %></td>
        <td><%= ventas.getString(10) %></td>
     
        <td>
            <a href="editarcliente.jsp?cliente=<%= ventas.getString(1) %>" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>
<%@include file='templates/footer_user.html'%>

