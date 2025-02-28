<%@page import="java.util.LinkedList" %>
<%@page import="entities.Vehiculo" %>
<%@page import="entities.Usuario" %>
<%@page import="logic.UsuarioLogic" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <title>Actualizar Vehiculo</title>
    <link rel="stylesheet" href="style/styles.css">
    <link href="style/bootstrap.css" rel="stylesheet">
<%
	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Vehiculo ve = (Vehiculo)request.getAttribute("vehiculo");
	UsuarioLogic ctrlUsuario = new UsuarioLogic();
%>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<div class="container">
		<h1>Modificacion</h1>
    	<h3>Vehículo a modificar: <%=ve.getPatente()%></h3>
    	<form action="ABMCVehiculo" method="post" class="form-registro">
    		<input type="hidden" name="optionBM" value="modificacion">
        	<input type="hidden" class="custom-control-input" name="bandera" value="modificado">
        	<input type="hidden" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
        	
        	<!-- Patente -->
            <div class="form-group">
                <label for="patente">Patente: </label>
                <input id="patente" name="patente" class="form-control col-8"  type="text" placeholder="<%=ve.getPatente()%>" value="<%=ve.getPatente()%>" required>
            </div>
            
            <!-- Marca -->
            <div class="form-group">
                <label for="marca">Marca: </label>
                <input id="marca" name="marca" class="form-control col-8"  type="text" placeholder="<%=ve.getMarca()%>" value="<%=ve.getMarca()%>" required>
            </div>
            
            <!-- Modelo -->
            <div class="form-group">
                <label for="modelo">Modelo: </label>
                <input id="modelo" name="modelo" class="form-control col-8"  type="text" placeholder="<%=ve.getModelo()%>" value="<%=ve.getModelo()%>" required>
            </div>
            
            <!-- Año -->
			<div class="form-group">
    			<label for="anio">Año: </label>
    			<input list="listaAnios" id="anio" name="anio" class="form-control col-8" placeholder="<%=ve.getAño()%>" value="<%=ve.getAño()%>" required>
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
                <input id="color" name="color" class="form-control col-8"  type="text" placeholder="<%=ve.getColor()%>" value="<%=ve.getColor()%>" required>
            </div>
            
            <!-- Info adicional -->
            <div class="form-group">
                <label for="infoAdicional">Información adicional: </label>
                <input id="infoAdicional" name="infoAdicional" class="form-control col-8"  type="text" placeholder="<%=ve.getInfoAdicional()%>" value="<%=ve.getInfoAdicional() %>" required>
            </div>
            
            <!-- Info adicional -->
            <div class="form-group">
            	<%Usuario usu = ctrlUsuario.getById(ve.getId_usuario()); %>
                <label for="usuario">Usuario del auto: </label>
                <input id="usuario" name="usuario" class="form-control col-8"  type="text" placeholder="<%= usu.getNombre()%> <%=usu.getApellido()%>" readonly>
            </div>
            
            <div class="form-group">
            	<button id="submitBtn" type="submit" class="btn btn-success">Guardar cambios</button>
            </div>
            
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