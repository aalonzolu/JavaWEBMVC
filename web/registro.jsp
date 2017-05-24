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
      <input type="text" name="name" placeholder="Nombre completo" required/>
      <input type="text" name="user" placeholder="Usuario" required/>
      <input type="password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$" title="Su contraseña debe tener por lo menos una mayuscula, una minuscula, un numero y la sangre de una virgen." name="pass" placeholder="Contraseña" required/>
      <input type="password" pattern="^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*$" title="Su contraseña debe tener por lo menos una mayuscula, una minuscula, un numero y la sangre de una virgen." name="confirmpass" placeholder="Repetir contraseña" required/>
      <button ype="submit"  name="Entrar" id="Entrar">Registro</button>
      <p class="message"><a href="login.jsp">Entrar</a></p>
    </form>
  </div>
</div>
<%@include file='templates/footer.html'%>
