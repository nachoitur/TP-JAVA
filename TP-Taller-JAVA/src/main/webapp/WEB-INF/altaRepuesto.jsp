<%@page import="entities.Repuesto" %>
<%@page import="entities.Usuario" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registro Repuesto</title>
    <link rel="stylesheet" href="style/styles.css">
    <link href="style/bootstrap.css" rel="stylesheet">
    
    <% Usuario userLogin = (Usuario) session.getAttribute("usuarioLogin"); %>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp" %>
	<div class="container">
        <h1 class="text-center mt-2">Registro Repuesto</h1>
        <form action="ABMCRepuesto" method="post" class="form-registro">
        	<input type="hidden" name="optionBM" value="alta">
            <input type="hidden" class="custom-control-input" name="bandera" value="añadido">
            <input type="hidden" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
            
            <!-- Descripcion -->
            <div class="form-group">
                <label for="descripcion">Descripción: </label>
                <input id="descripcion" name="descripcion" class="form-control col-8"  type="text" min="0" required>
            </div>
            
            <!-- Precio -->
            <div class="form-group">
                <label for="precio">Precio: $</label>
                <input id="precio" name="precio" class="form-control col-8"  type="number" step="any" min="0" required>
            </div>
            
            <!-- Stock -->
            <div class="form-group">
                <label for="stock">Stock: </label>
                <input id="stock" name="stock" class="form-control col-8"  type="number" step="any" required>
            </div>
            
            <button id="submitBtn" type="submit" class="btn btn-success">Registrar Repuesto</button>
        </form>
	</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>