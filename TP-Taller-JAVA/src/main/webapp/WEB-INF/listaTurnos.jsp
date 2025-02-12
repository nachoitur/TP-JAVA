<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Turno"%>
<%@page import="entities.Vehiculo"%>
<%@page import="entities.Trabajo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista Turnos</title>
<%
Usuario userLogin = (Usuario)session.getAttribute("usuarioLogin");
LinkedList<Turno> shiftlist = (LinkedList<Turno>)request.getAttribute("listaTurnos");
%>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<div class="container">
    <div class="tab-content">
		<div class="tab-pane fade show active" id="opcion1">
     	<div class="row">
			<h4 class="mx-3 mb-3">Turnos</h4>
	 		<div class="">
	 			<!-- Crear -->
				<form action="ABMCTurno" method="post">
					<input type="hidden" class="custom-control-input" name="bandera" value="aAnadir">
	 				<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">										
	 				<button type="submit" class="btn btn-success" name="optionBM" value="alta">Agregar</button>
	 			</form>
	 		</div>
	 			<div class="col-12 col-sm-12 col-lg-12">
	 				<div class="table-responsive">
	 					<table class="table">
	 						<thead>
	 							<tr>
	 								<th></th>
	 								<th>Fecha</th>
	 								<th>Hora</th>
	 								<th>Marca</th>
	 								<th>Modelo</th>
	 								<th>Estado</th>
	 								
	 								<th></th>
	 								<th></th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						<%for (Turno t: shiftlist) {
	 							Vehiculo v = t.getVehiculo();%>
								<tr>
								<td>
									<!-- Consulta -->
									<div>
										<form action="ABMCTurno" method="post">
											<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
											<input type="hidden" class="custom-control-input" name="fechaTurno" value="<%=t.getFecha()%>">
											<input type="hidden" class="custom-control-input" name="horaTurno" value="<%=t.getHora()%>">
											<input type="hidden" class="custom-control-input" name="idVehiculo" value="<%=v.getId_vehiculo()%>">
											<button type="submit" class="btn btn-consulta btn-primary text-center " name="optionBM" value="consulta">!</button>
										</form>
									</div>
								</td>
								<td><%=t.getFecha()%></td>
								<td><%=t.getHora()%></td>
								<td><%=v.getMarca()%></td>
								<td><%=v.getModelo()%></td>
								<td><%=t.getEstado()%></td>
								<td>
									<!-- Modifica -->
									<div>
										<form action="ABMCTurno" method="post">
											<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
											<input type="hidden" class="custom-control-input" name="fechaTurno" value="<%=t.getFecha()%>">
											<input type="hidden" class="custom-control-input" name="horaTurno" value="<%=t.getHora()%>">
											<input type="hidden" class="custom-control-input" name="idVehiculo" value="<%=v.getId_vehiculo()%>">
											<input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
											<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
										</form>
									</div>
								</td>
								<td>
									<!-- Borra -->
									<div>
										<form action="ABMCTurno" method="post">
											<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
											<input type="hidden" class="custom-control-input" name="fechaTurno" value="<%=t.getFecha()%>">
											<input type="hidden" class="custom-control-input" name="horaTurno" value="<%=t.getHora()%>">
											<input type="hidden" class="custom-control-input" name="idVehiculo" value="<%=v.getId_vehiculo()%>">
											<button type="submit" class="btn btn-danger" name="optionBM" value="baja">Eliminar</button>
										</form>
									</div>
								</td>
								</tr>
							<% } %>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
    </div>
  </div>
	
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>