<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title></title>
<link  href="style/bootstrap.css" rel="stylesheet "/>
<%
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Usuario u =(Usuario)request.getAttribute("usuario");
 	//LinkedList<Usuario> userlist=(LinkedList<Usuario>)request.getAttribute("listaUsuarios");
 %> 
</head>
<body>
	
	<h4>¡Modificación/Eliminación Exitosa!</h4>
	
	<form action="signin" method="post">
		<input type="hidden" class="custom-control-input"  name="username" value="<%=userLogin.getNombre_usuario()%>" />
		<input type="hidden" class="custom-control-input"  name="password" value="<%=userLogin.getContraseña()%>" />
		<button type="submit" class="btn btn-primary btn-lg">Volver al menú</button>
	</form>
	 
</body>
</html>