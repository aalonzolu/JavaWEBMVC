<%-- 
   Document   : pos
   Created on : May 31, 2017, 10:04:58 PM
   Author     : lexo
   --%>
<%@page import="modelos.ConsultasCliente"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="modelos.ConsultasProducto"%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_pos.html'%>
<div class="pos">
   <div class="col col-md-6 col-sm-12">
      <div class="panel panel-primary" style=" min-height: 40em; ">
         <div class="panel-heading">
            <h3 class="panel-title">Listado de productos</h3>
         </div>
         <div class="panel-body">
            <table class="table table-striped table-bordered" id="productsTable">
               <caption>Seleccione un producto de la lista para agregarlo a la venta</caption>
               <thead>
                  <tr>
                     <th>#</th>
                     <th>Producto</th>
                     <th>Stock</th>
                     <th>Bodega</th>
                     <th>Precio</th>
                  </tr>
               </thead>
               <tbody>
                   <%
                       ConsultasProducto Conn1 = new ConsultasProducto();
                       ResultSet productos = Conn1.listado();
                        while(productos.next()){ 
                   %>
                  <tr onclick="addItem(<%= productos.getString(1) %>,<%= productos.getString(2) %>,'<%= productos.getString(3) %>',<%= productos.getString(7) %>,<%= productos.getString(4) %>)">
                     <th scope="row"><%= productos.getString(2) %></th>
                     <td><%= productos.getString(3) %></td>
                     <td><%= productos.getString(7) %></td>
                     <td><%= productos.getString(8) %></td>
                     <td> Q. <%= productos.getString(4) %></td>
                  </tr>
                  <% } %>
               </tbody>
            </table>

         </div>
      </div>
   </div>
   <div class="col col-md-6 col-sm-12">
      <div class="panel panel-success" style=" min-height: 40em; ">
         <div class="panel-heading">
            <h3 class="panel-title">Venta</h3>
         </div>
         <div class="panel-body">
             <form action="crearVenta" method="post" id="posForm">
             <div class="col col-md-5">
             
                 <div class="form-group">
    <label for="fecha">Fecha</label>
    <input type="datetime" class="form-control" id="fecha" name='fecha'>
  </div>
             </div>
             <div class="col col-md-5">
  <div class="form-group">
    <label for="cliente">Cliente</label>
    <select name='cliente' id="cliente" class='form-control selectpicker' data-live-search="true">
    
    <% 
    ConsultasCliente conn2 = new ConsultasCliente();
    ResultSet clientes = conn2.listado();
    while(clientes.next()){
    %>
    <option value='<%= clientes.getString(1) %>'><%= clientes.getString(3) %>,<%= clientes.getString(4) %></option>
    <% } %>
    </select>
    
  </div>    
         </div>
             
             
    
    <div class="col col-md-12">
        <table class="table table-striped" id='venta_tabla'>
    <thead>
      <tr>
        <th>Codigo</th>
        <th>Producto</th>
        <th>Cantidad</th>
        <th>Precio</th>
        <th>Total</th>
      </tr>
    </thead>
    <tbody id='venta_elementos'>
      
      
    </tbody>
  </table>
    </div>
    
    <div class="col col-md-6">
                 <label for="cliente"> </label>
                 <button type="button" onclick="removeItems()" class="btn btn-danger btn-block">Cancelar</button>
             </div>
    
    <div class="col col-md-6">
                 <label for="cliente"> </label>
                 <button type="submit" class="btn btn-success  btn-block">Crear venta</button>
             </div>
             
             </form>
         </div>
      </div>
   </div>
</div>
    <script>
        $(document).ready(function() {
                       $('#productsTable').DataTable();
                   } );
                   function addItem(id,codigo,nombre,stock,precio){
                       console.log('Producto: '+nombre+" ID:"+id+" Codigo: "+codigo+" stock: "+stock);
                       var cantidad =1;
                       $('#venta_tabla tr:last').after('<tr onclick ="delete_item($(this))">'+
                               '<input type="hidden" name="id[]" value="'+id+'">'+
                               '<input type="hidden" name="codigo[]" value="'+codigo+'">'+
                               '<input type="hidden" name="cantidad[]" value="'+cantidad+'">'+
        '<td>'+codigo+'</td>'+
        '<td>'+nombre+'</td>'+
        '<td>'+cantidad+'</td>'+
        '<td>'+precio+'</td>'+
        '<td>'+precio*cantidad+'</td>'+
      '</tr>');
                   }
        function removeItems(){
            $('#venta_tabla').find("tr:gt(0)").remove();
        }
        function delete_item(row){
            row.closest('tr').remove();
        }
        </script>
<%@include file='templates/footer_user.html'%>