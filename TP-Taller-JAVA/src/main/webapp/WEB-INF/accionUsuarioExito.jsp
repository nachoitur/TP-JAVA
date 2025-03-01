<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="ISO-8859-1">
    <title>Operaci�n Exitosa</title>
    <link href="style/bootstrap.css" rel="stylesheet">
    <%
 		Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
 	%> 
</head>
<body class="d-flex align-items-center justify-content-center vh-100 bg-light">
    <div class="card shadow-lg p-4 text-center" style="max-width: 400px;">
        <div class="card-body">
            <h3 class="text-success font-weight-bold">�Operaci�n realizada con �xito!</h3>
            <p class="text-muted">Tu <%=request.getAttribute("operacion").equals("vehiculo") ? "veh�culo" : "turno" %> se ha registrado correctamente.</p>
            <form action="signin" method="post">
                <input type="hidden" name="username" value="<%=userLogin.getNombre_usuario()%>">
                <input type="hidden" name="password" value="<%=userLogin.getContrase�a()%>">
                <button type="submit" class="btn btn-primary btn-lg mt-3">Volver al men�</button>
            </form>
        </div>
    </div>
</body>
</html>
