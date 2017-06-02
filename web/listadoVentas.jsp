<%-- 
    Document   : listadoVentas
    Created on : 29/05/2017, 10:28:36 PM
    Author     : juan
--%>

<%@page import="modelos.ConsultasCliente"%>
<%@page import="modelos.ConsultasUser"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@page import="modelos.ConsultasVenta"%>

<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Listado de ventas realizadas</h1>
<a href="pos.jsp" class="btn btn-default btn-circle btn-danger"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span></a>

<ul class="nav nav-tabs">
  <li class="active"><a data-toggle="tab" href="#activos">Ventas activas</a></li>
  <li><a data-toggle="tab" href="#anulados">Ventas anuladas</a></li>
</ul>


<div class="tab-content">
  <div id="activos" class="tab-pane fade in active">
    <h3>Activos</h3>
    
<table class="table table-hover">
    <thead>
      <tr>
        <th>Correlativo</th>
        <th>Vendedor</th>
        <th>Cliente</th>
        <th>Fecha</th>
        <th>Total</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
<%
    ConsultasVenta Conn = new ConsultasVenta();
    ResultSet ventas = Conn.listado();
     while(ventas.next()){ %>
     <tr>
        <td>SALE#<%= ventas.getString(1) %></td>
        <td><%
            ConsultasUser Conn1 = new ConsultasUser();
            int id = ventas.getInt(2);
            String res = Conn1.getDato("name",id);    
        %><%=res%></td> 
        <td><%
            ConsultasCliente Conn2 = new ConsultasCliente();
            id = ventas.getInt(3);
            res = Conn2.getDato("concat(nombre_cliente,' ', apellido_cliente) as nombre_completo",id);    
        %><%=res%></td>
        <td><%= ventas.getString(4) %></td>
        <td><%
            ConsultasVenta Conn3 = new ConsultasVenta();
            id = ventas.getInt(1);
            res = Conn3.getTotalVenta(id);
        %>Q. <%=res%></td>
        <td></td>
     
        <td>
            <a href="verVenta.jsp?venta=<%= ventas.getString(1) %>" ><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span></a>
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>
    
  </div>
  <div id="anulados" class="tab-pane fade">
    <h3>Anulados</h3>
    
<table class="table table-hover">
    <thead>
      <tr>
        <th>Correlativo</th>
        <th>Vendedor</th>
        <th>Cliente</th>
        <th>Fecha</th>
        <th>Total</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
<%
    ConsultasVenta ConnV = new ConsultasVenta();
    ResultSet anuladas = ConnV.anulados();
     while(anuladas.next()){ %>
     <tr>
        <td>SALE#<%= anuladas.getString(1) %></td>
        <td><%
            ConsultasUser ConnU = new ConsultasUser();
            int id = anuladas.getInt(2);
            String res = ConnU.getDato("name",id);    
        %><%=res%></td> 
        <td><%
            ConsultasCliente ConnC = new ConsultasCliente();
            id = anuladas.getInt(3);
            res = ConnC.getDato("concat(nombre_cliente,' ', apellido_cliente) as nombre_completo",id);    
        %><%=res%></td>
        <td><%= anuladas.getString(4) %></td>
        <td><%
            //ConsultasVenta ConnV = new ConsultasVenta();
            id = anuladas.getInt(1);
            res = ConnV.getTotalVenta(id);
        %>Q. <%=res%></td>
        <td></td>
     
        <td>
            <a href="verVenta.jsp?venta=<%= anuladas.getString(1) %>" ><span class="glyphicon glyphicon-zoom-in" aria-hidden="true"></span></a>
        </td>
      </tr>
      <% } %>
    </tbody>
  </table>
    
  </div>

</div>

<%@include file='templates/footer_user.html'%>

