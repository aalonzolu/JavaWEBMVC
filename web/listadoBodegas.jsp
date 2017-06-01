<%-- 
    Document   : listadoBodegas
    Created on : 29/05/2017, 10:05:45 PM
    Author     : kilroy
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@page import="modelos.ConsultasBodega"%>

<%@ page session="true" %>
<%@include file='templates/header_user.html'%>
<h1>Listado de Bodegas de la empresa</h1>
<a href="nuevobodega.jsp" class="btn btn-default btn-circle btn-danger"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>
<table class="table table-hover">
    <thead>
      <tr>
        <th>Nombre de la Bodega</th>
        <th>Direccion de la Bodega</th>
        <th>teléfono de la Bodega</th>
        <th>Acciones</th>
      </tr>
    </thead>
    <tbody>
<%
    ConsultasBodega Conn = new ConsultasBodega();
    ResultSet bodega = Conn.listado();
     while(bodega.next()){ %>
     <tr>
        <td><%= bodega.getString(2) %></td>
        <td><%= bodega.getString(3) %></td>
        <td><%= bodega.getString(4) %></td>
        <td>
            <a href="editarbodega.jsp?bodega=<%= bodega.getString(1) %>" ><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>
<%@include file='templates/footer_user.html'%>

