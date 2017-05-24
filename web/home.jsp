<%-- 
    Document   : home
    Created on : May 23, 2017, 11:21:52 PM
    Author     : lexo
--%>
<%@ page session="true" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header_user.html'%>
<h1>Hola <%= session.getAttribute("name") %></h1>
<%@include file='templates/footer_user.html'%>
