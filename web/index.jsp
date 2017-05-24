<%-- 
    Document   : login
    Created on : May 23, 2017, 10:10:52 PM
    Author     : lexo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header.html'%>
<div class="login-page">
  <div class="form">
      <h1>Entrar</h1>
      <b><%if (request.getParameter("error") != null) {out.println(request.getParameter("error"));} %></b>
    <form class="login-form" action="Login" method="post">
      <input type="text" name="user" placeholder="Usuario"/>
      <input type="password" name="pass" placeholder="Contraseña"/>
      <button ype="submit"  name="Entrar" id="Entrar">Entrar</button>
      <p class="message"><a href="registro.jsp">Registro</a></p>
    </form>
  </div>
</div>
<%@include file='templates/footer.html'%>
