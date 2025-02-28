<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Vehiculo"%>
<%@page import="logic.UsuarioLogic"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
   
 <%
Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
Vehiculo v =(Vehiculo)request.getAttribute("vehiculo");
UsuarioLogic ctrlUsuario = new UsuarioLogic();
 %>  
   
<title>Consulta Vehiculo</title>
<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>
</head>
<body>
	<div class="comeabcck">
		<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	</div>
	<div>
		<form action="Conexion" method="post">
			<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
			<button class="btn btn-primary" type="submit" name="optionBM" value="vehiculos">Volver</button>
		</form>
	</div>
		<div class="container d-flex flex-column  justify-content-center align-items-center">
			<div class="dentro d-flex flex-column  justify-content-center align-items-center">
				<div class="row text-center">
					<div class="col text center">
						<label  class="font-weight-bold">Patente</label>
						<input class="form-control text-center bg-light" type="text" value="<%=v.getPatente() %>" disabled>
					</div>
				</div>
				<div class="row text-center">
					<div class="col text center">
						<label  class="font-weight-bold">Marca</label>
						<input class="form-control text-center bg-light" type="text" value="<%=v.getMarca() %>" disabled>
					</div>
				</div>
				<div class="row text-center">
					<div class="col text center">
						<label  class="font-weight-bold">Modelo</label>
						<input class="form-control text-center bg-light" type="text" value="<%=v.getModelo() %>" disabled>
					</div>
				</div>
				<div class="row text-center">
					<div class="col text center">
						<label  class="font-weight-bold">Año</label>
						<input class="form-control text-center bg-light" type="number" value="<%=v.getAño() %>" disabled>
					</div>
				</div>
				<div class="row text-center">
					<div class="col text center">
						<label  class="font-weight-bold">Color</label>
						<input class="form-control text-center bg-light" type="text" value="<%=v.getColor() %>" disabled>
					</div>
				</div>
				<div class="row text-center">
					<div class="col text center">
						<label  class="font-weight-bold">Información adicional</label>
						<input class="form-control text-center bg-light" type="text" value="<%=v.getInfoAdicional() %>" disabled>
					</div>
				</div>
				<div class="row text-center">
					<div class="col text center">
						<label  class="font-weight-bold">Usuario del vehículo</label>
						<%Usuario usu = ctrlUsuario.getById(v.getId_usuario()); %>
						<input class="form-control text-center bg-light" type="text" value="<%= usu.getNombre()%> <%=usu.getApellido()%>" disabled>
					</div>
				</div>
				<div class="botonn mb-3">
					<form action="ABMCTurno" method="post">
						<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="idVehiculo" value="<%=v.getId_vehiculo()%>">
						<input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
						<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
					</form>
				</div>						
				<div class="botonn">
					<form action="ABMCTurno" method="post">
						<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="idVehiculo" value="<%=v.getId_vehiculo()%>">
						<button type="submit" class="btn btn-danger" name="optionBM" value="baja">Eliminar</button>
					</form>
				</div>
			</div>
		</div>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>