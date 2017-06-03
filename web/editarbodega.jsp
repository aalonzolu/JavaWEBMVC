<%-- 
    Document   : nuevobodega
    Created on : 25/05/2017, 09:25:02 AM
    Author     : kilroy
--%>
<% if (request.getParameter("bodega") == null){
    // si no se mando el parametro bodega redireccionar al listado
    response.sendRedirect("listadoBodegas.jsp");
}
%>
<%@page import="java.lang.Integer.*"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Types"%>
<%@page import="modelos.ConsultasBodega"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Nueva Bodega</h1>
<form action="actualizarBodega" method="post">
     <%
        
        String codigo = "";
        String nombre = "";
        String direccion = "";
        String telefono = "";
        String bodega= "";
     
        
        int ID = Integer.parseInt(request.getParameter("bodega"));
        ConsultasBodega Conn = new ConsultasBodega();
        ResultSet bodegas = Conn.getUno(ID);
        while(bodegas.next()){ 
            
            codigo = bodegas.getString(5);
            nombre = bodegas.getString(2);
            direccion = bodegas.getString(3);
            telefono = bodegas.getString(4);
            
        } %>
  <div class="form-group">
    <label for="codigo">Codigo</label>
    <input type="text" name="codigo" class="form-control" value="<%= codigo %>"id="codigo">
     <input type="hidden" name="id_bodega" value="<%= ID %>" id="codigo">
  </div>
  <div class="form-group">
    <label for="nombre">Nombre de la Bodega: </label>
    <input type="text" name="nombre_bodega" class="form-control" value="<%= nombre %>" id="nombre_bodega">
    
  </div>
  <div class="form-group">
    <label for="direccion_bodega">Direccion de la Bodega: </label>
    <input type="text" name="direccion_bodega" class="form-control" value="<%= direccion %>" id="direccion_bodega">
  </div>
   <div class="form-group">
    <label for="telefono_bodega">Telefono de la Bodega: </label>
    <input type="text" name="telefono_bodega" class="form-control" value="<%= telefono %>" id="telefono_bodega">
  </div>
    
    
  <button type="submit" class="btn btn-default">Guardar</button>
</form>
<%@include file='templates/footer_user.html'%>


