<%-- 
    Document   : verVenta
    Created on : Jun 1, 2017, 11:30:12 PM
    Author     : lexo
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
<%
    ConsultasVenta Conn = new ConsultasVenta();
    int id_venta = Integer.parseInt(request.getParameter("venta"));
    ResultSet Venta = Conn.getUno(id_venta);
    int user_id = 0;
    int cliente_id = 0;
    String fecha_venta = "";
    int status = 0;
    while(Venta.next()){
        user_id = Venta.getInt(2);
        cliente_id = Venta.getInt(3);
        fecha_venta = Venta.getString(4);
        status = Venta.getInt(5);
    }
    %>
    
    <% if(status==1){
    %><div class="panel panel-primary"><%    
    }else {
    %><div class="panel panel-danger"><%
    }%>
      
  <div class="panel-heading">
    <h3 class="panel-title"><h1>Detalles de la venta SALE#<%= request.getParameter("venta") %></h1></h3>
  </div>
  <div class="panel-body">
    
<a href="listadoVentas.jsp" class="btn btn-default btn-circle btn-danger no-print"><span class="glyphicon glyphicon-arrow-left" aria-hidden="true"></span></a>


    

<% if(status==1){
    %><a href="javascript:window.print()" class="btn btn-default btn-circle no-print"><span class="glyphicon glyphicon-print" aria-hidden="true"></span></a><%    
    }else {
    %><a  class="btn btn-default btn-circle no-print" disabled><span class="glyphicon glyphicon-print" aria-hidden="true"></span></a><%
    }%>

    <div class="form-inline">
        <div col-md-4 col-sm-12>
            <div class="form-group">
    <label for="exampleInputName2">Atendido por: </label>
    <input type="text" class="form-control" id="exampleInputName2" value="<% ConsultasUser Conn1 = new ConsultasUser();String res = Conn1.getDato("name",id_venta);%><%=res%>" disabled>
  </div>
        </div>
  <div col-md-4 col-sm-12>
            <div class="form-group">
    <label for="exampleInputName2">Cliente: </label>
    <input type="text" class="form-control" id="exampleInputName2" value="<% ConsultasCliente Conn2 = new ConsultasCliente();
            res = Conn2.getDato("concat(nombre_cliente,' ', apellido_cliente) as nombre_completo",cliente_id);    %><%=res%>" disabled>
  </div>
        </div>
  
  <div col-md-4 col-sm-12>
            <div class="form-group">
    <label for="exampleInputName2">Total de la venta: </label>
    <input type="text" class="form-control" id="exampleInputName2" value="Q. <% res = Conn.getTotalVenta(id_venta);%><%=res%>" disabled>
  </div>
        </div>
  
    </div>
    
    
<h4>Elementos de la venta</h4>
<table class="table table-hover">
    <thead>
      <tr>
        <th>Codigo</th>
        <th>Producto</th>
        <th>Cantidad</th>
        <th>Precio</th>
        <th>Total</th>
      </tr>
    </thead>
    <tbody>
<%
    
    ResultSet ventas = Conn.getElementosVenta(id_venta);
     while(ventas.next()){ %>
     <tr>
        <td><%= ventas.getString(2) %></td>
        <td><%= ventas.getString(3) %></td> 
        <td><%= ventas.getString(4) %></td> 
        <td>Q. <%= ventas.getString(5) %></td> 
        <td>Q. <%= ventas.getInt(4)*ventas.getInt(5) %></td>
    
      </tr>
      <% } %>
    </tbody>
  </table>
    <br/><br/><br/>
    <% if(status==1){
    %><a type="button" id='anular_venta' href="#" class="btn btn-danger btn-lg btn-block no-print">Anular venta</a><%    
    }else {
    %><a type="button" class="btn btn-danger btn-lg btn-block no-print" disabled>Venta anulada</a><%
    }%>
    
  </div>
</div>
    <script>
        $("#anular_venta").click(function(event){
        event.preventDefault();
        console.log(bootbox.confirm("Esta seguro de anular esta venta?", function(result){
            if(result){
                window.location.href = "anularVenta?id=<%=id_venta%>";
            }
        }));
    
   
});
        </script>
<%@include file='templates/footer_user.html'%>

