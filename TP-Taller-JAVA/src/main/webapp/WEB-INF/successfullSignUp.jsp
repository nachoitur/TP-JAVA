<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="entities.Usuario"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro exitoso</title>
<%
 	Usuario u =(Usuario)session.getAttribute("usuario");
 %> 
 <link  href="style/bootstrap.css" rel="stylesheet "/>
</head>
<body>
	<h1>Llegaste el jsp del registro</h1>
	<h2>Hola <%=u.getNombre()%> <%=u.getApellido()%>!</h2>
	
	<h3>O mejor conocido como: <%=u.getNombre_usuario()%>
	
	<%=u.getId_usuario()%></h3>
	
	<form action="signin" method="post">
		<input type="hidden" class="custom-control-input"  name="username" value="<%=u.getNombre_usuario()%>" />
		<input type="hidden" class="custom-control-input"  name="password" value="<%=u.getContraseña()%>" />
		<button type="submit" class="btn btn-primary btn-lg">Volver atrás</button>

		
	</form>
</body>
</html>