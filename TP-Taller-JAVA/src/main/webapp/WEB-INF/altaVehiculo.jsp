<%@page import="java.util.LinkedList" %>
<%@page import="entities.Vehiculo" %>
<%@page import="entities.Usuario" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Registro Vehiculo</title>
    <link rel="stylesheet" href="style/styles.css">
    <link href="style/bootstrap.css" rel="stylesheet">    
    <% Usuario userLogin = (Usuario) session.getAttribute("usuarioLogin"); %>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp" %>
	<div class="container">
		<h1 class="text-center mt-2">Registro Vehiculo</h1>
		
		<form action="ABMCVehiculo" method="post" class="form-registro">
			<input type="hidden" name="optionBM" value="alta">
            <input type="hidden" class="custom-control-input" name="bandera" value="añadido">
            <input type="hidden" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
            
            <!-- Patente -->
            <div class="form-group">
                <label for="patente">Patente: </label>
                <input id="patente" name="patente" class="form-control col-8"  type="text" required>
            </div>
            
            <!-- Marca -->
            <div class="form-group">
                <label for="marca">Marca: </label>
                <input id="marca" name="marca" class="form-control col-8"  type="text" required>
            </div>
            
            <!-- Modelo -->
            <div class="form-group">
                <label for="modelo">Modelo: </label>
                <input id="modelo" name="modelo" class="form-control col-8"  type="text" required>
            </div>
            
            <!-- Año -->
			<div class="form-group">
    			<label for="anio">Año: </label>
    			<input list="listaAnios" id="anio" name="anio" class="form-control col-8" required>
    			<datalist id="listaAnios">
        			<% 
            			int anioActual = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
            			for (int i = 1940; i <= anioActual; i++) {
        			%>
            			<option value="<%=i%>"></option>
        			<% } %>
    			</datalist>
    			<small id="errorAnio" class="text-danger" style="display:none;">Por favor, selecciona un año válido.</small>
			</div>
            
            <!-- Color -->
            <div class="form-group">
                <label for="color">Color: </label>
                <input id="color" name="color" class="form-control col-8"  type="text" required>
            </div>
            
            <!-- Info adicional -->
            <div class="form-group">
                <label for="infoAdicional">Información adicional: </label>
                <input id="infoAdicional" name="infoAdicional" class="form-control col-8"  type="text" required>
            </div>
            
            <!-- Usuario del auto -->
            <div class="form-group">
                <label for="dniDuenio">DNI del usuario del auto: </label>
                <input id="dniDuenio" name="dniDuenio" class="form-control col-8"  type="text" required>
                <small class="text" style="display:none;">Si no conoce el DNI del usuario, escribir '0'</small>
            </div>
            
            <button id="submitBtn" type="submit" class="btn btn-success">Registrar Vehiculo</button>
		</form>
	</div>
<script>
	// Verificación de ingreso de año válido
    document.getElementById("anio").addEventListener("input", function () {
        let input = this.value;
        let lista = document.getElementById("listaAnios");
        let opciones = Array.from(lista.options).map(opt => opt.value);
        let errorMsg = document.getElementById("errorAnio");

        if (!opciones.includes(input)) {
            errorMsg.style.display = "block";
            this.setCustomValidity("Selecciona un año válido de la lista.");
        } else {
            errorMsg.style.display = "none";
            this.setCustomValidity("");
        }
    });
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>