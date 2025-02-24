<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Turno"%>
<%@page import="entities.Trabajo"%>
<%@page import="entities.Vehiculo"%>
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
Turno t =(Turno)request.getAttribute("turno");
 %>  
   
<title>Consulta Turno</title>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>
</head>
<body>
	<div class="comeabcck">
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
		<form action="Conexion" method="post">
			<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
			<button class="btn btn-primary" type="submit" name="optionBM" value="trabajos">Volver</button>
		</form>
	</div>
	<div class="container d-flex flex-column  justify-content-center align-items-center">
		<div class="dentro d-flex flex-column  justify-content-center align-items-center">
			<div class="row text-center">
				<div class="col text center">
					<label  class="font-weight-bold">Fecha del turno</label>
					<input class="form-control text-center bg-light" type="text" value="<%=t.getFecha() %>" disabled>
				</div>
			</div>
			<div class="row text-center">
				<div class="col text-center">
					<label class="font-weight-bold ">Hora del turno</label>
					<input class="form-control text-center bg-light" type="text" value="<%=t.getHora() %>" disabled>
				</div>
			</div>
			<div class="row text-center">
				<div class="col">
					<label class="font-weight-bold ">Descripción del vehículo</label>
					<%
					Vehiculo v = t.getVehiculo();
					String desc = v.getMarca() + " - " + v.getModelo() + " - " + v.getColor() + " - " + v.getPatente() + " - " + v.getAño();
					%>
					<input class="form-control text-center bg-light" type="text" value="<%=desc%>" disabled>
				</div>
			</div>
			<div class="row text-center">
				<div class="col">
					<label class="font-weight-bold ">Kilómetros actuales</label>
					<input class="form-control text-center bg-light" type="text" value="<%=t.getKm_actuales()%>" disabled>
				</div>
			</div>
			<div class="row text-center">
				<div class="col">
					<label class="font-weight-bold ">Estado</label>
					<input class="form-control text-center bg-light" type="text" value="<%=t.getEstado()%>" disabled>
				</div>
			</div>
			<h4>Trabajos en el turno:</h4>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
	 						<th></th>
	 						<th>Trabajo</th>
	 						<th>Costo mano de obra</th>
	 						<th>Costo repuestos</th>
	 						<th>Subtotal</th>
	 						<th></th>
	 					</tr>
	 				</thead>
	 				<tbody>
	 					<%for (Trabajo tra: t.getTrabajos()) { %>
	 						<tr>
	 							<td><%=tra.getDescripcion()%></td>
	 							<td><%=tra.getCosto_mdo()%></td>
	 							<td><%=tra.getTotalRepuestos()%></td>
	 							<td><%=(tra.getCosto_mdo() + tra.getTotalRepuestos())%></td>
	 						</tr>
	 					<% } %>
	 				</tbody>
				</table>
			</div>
			<div class="botonn mb-3">
				<form action="ABMCTrabajo" method="post">
					<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
					<input type="hidden" class="custom-control-input" name="fechaTurno" value="<%=t.getFecha()%>">
					<input type="hidden" class="custom-control-input" name="horaTurno" value="<%=t.getHora()%>">
					<input type="hidden" class="custom-control-input" name="idVehiculo" value="<%=v.getId_vehiculo()%>">
					<input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
					<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
				</form>
			</div>						
			<div class="botonn">
				<form action="ABMCUsuario" method="post">
					<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
					<input type="hidden" class="custom-control-input" name="fechaTurno" value="<%=t.getFecha()%>">
					<input type="hidden" class="custom-control-input" name="horaTurno" value="<%=t.getHora()%>">
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