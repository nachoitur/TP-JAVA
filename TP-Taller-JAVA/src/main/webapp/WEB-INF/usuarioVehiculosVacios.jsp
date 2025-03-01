<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="ISO-8859-1">
	<title>Error - Sin Vehículos</title>
	<link href="style/bootstrap.css" rel="stylesheet "/>
<%
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
 %> 
</head>
<body class="bg-light">
	<div class="container vh-100 d-flex justify-content-center align-items-center">
		<div class="card shadow-lg p-4 text-center" style="max-width: 500px;">
			<h3 class="text-danger">¡Error!</h3>
			<p class="lead">
				El usuario <strong><%userLogin.getNombre_usuario();%></strong> no tiene vehículos registrados para sacar turno.
			</p>
			<div class="mt-4">
				<h5>¿Deseas registrar un vehículo?</h5>
				<form action="ConexionUsuario" method="post">
					<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>" />
					<input type="hidden" class="custom-control-input"  name="bandera" value="agregar" />
					<input type="hidden" class="custom-control-input"  name="optionBM" value="registrarVehiculo" />
					<button type="submit" class="btn btn-success btn-block">Registrar un vehículo</button>
				</form>
			</div>
			<hr>
			<div class="mt-3">
				<h5>O volver al menú principal</h5>
				<form action="signin" method="post">
					<input type="hidden" class="custom-control-input"  name="username" value="<%=userLogin.getNombre_usuario()%>" />
					<input type="hidden" class="custom-control-input"  name="password" value="<%=userLogin.getContraseña()%>" />
					<button type="submit" class="btn btn-primary btn-block">Volver al menú</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>