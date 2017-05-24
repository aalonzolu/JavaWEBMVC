<%-- 
    Document   : registro
    Created on : May 23, 2017, 10:13:35 PM
    Author     : lexo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file='templates/header.html'%>
<div class="login-page">
  <div class="form">
      <h1>Registro de usuarios</h1>
      <b><%if (request.getParameter("error") != null) {out.println(request.getParameter("error"));} %></b>
    <form class="login-form" action="SignUp" method="post">
      <input type="text" name="user" placeholder="Usuario"/>
      <input type="password" name="pass" placeholder="Contraseña"/>
      <input type="password" name="confirmpass" placeholder="Repetir contraseña"/>
      <button ype="submit"  name="Entrar" id="Entrar">Registro</button>
      <p class="message"><a href="login.jsp">Entrar</a></p>
    </form>
  </div>
</div>
<%@include file='templates/footer.html'%>
