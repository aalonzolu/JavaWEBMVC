<%-- 
    Document   : home
    Created on : May 23, 2017, 11:21:52 PM
    Author     : lexo
--%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Bienvenido <%= session.getAttribute("name") %></h1>
<div class="">
    <div class="col-md-4" style="margin-top: 2em;">
        <a type="button" class="btn btn-success btn-lg btn-block" href="pos.jsp">
            <span class="glyphicon glyphicon-shopping-cart" aria-hidden="true" style=" font-size: 9em; "></span><br>
            <h3>Punto de venta</h3>
        </a>
    </div>
    
    <div class="col-md-4" style="margin-top: 2em;">
        <a type="button" class="btn btn-success btn-lg btn-block" href="listadoClientes.jsp">
            <span class="glyphicon glyphicon-user" aria-hidden="true" style=" font-size: 9em; "></span><br>
            <h3>Clientes</h3>
        </a>
    </div>
    
    <div class="col-md-4" style="margin-top: 2em;">
        <a type="button" class="btn btn-success btn-lg btn-block" href="listadoBodegas.jsp">
            <span class="glyphicon glyphicon-inbox" aria-hidden="true" style=" font-size: 9em; "></span><br>
            <h3>Bodegas</h3>
        </a>
    </div>
    
    <div class="col-md-4" style="margin-top: 2em;">
        <a type="button" class="btn btn-success btn-lg btn-block" href="listadoProveedor.jsp">
            <span class="glyphicon glyphicon-folder-close" aria-hidden="true" style=" font-size: 9em; "></span><br>
            <h3>Proveedores</h3>
        </a>
    </div>
    
    <div class="col-md-4" style="margin-top: 2em;">
        <a type="button" class="btn btn-success btn-lg btn-block" href="listadoProductos.jsp">
            <span class="glyphicon glyphicon-barcode" aria-hidden="true" style=" font-size: 9em; "></span><br>
            <h3>Productos</h3>
        </a>
    </div>
</div>
<%@include file='templates/footer_user.html'%>
