<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Turno"%>
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
	 								<th>Vehiculo</th>
	 								<th>KM actuales</th>
	 								<th>Estado</th>
	 								<th>Medio Pago</th>
	 								<th>Total</th>
	 								
	 								<th></th>
	 								<th></th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						<%for (Turno t: shiftlist) {%>
								<tr>
								<td>
									<!-- Consulta -->
									<div>
										<form action="ABMCTurno" method="post">
											<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
											<input type="hidden" class="custom-control-input" name="idTurno" value="<%=t.getId_turno()%>">
											<button type="submit" class="btn btn-consulta btn-primary text-center " name="optionBM" value="consulta">!</button>
										</form>
									</div>
								</td>
								<td><%=t.getId_trabajo()%></td>
								<td><%=t.getTipo_trabajo()%></td>
								<td><%=t.getDescripcion()%></td>
								<td><%=t.getCosto_mdo()%></td>
								<td>
									<!-- Modifica -->
									<div>
										<form action="ABMCTrabajo" method="post">
											<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
											<input type="hidden" class="custom-control-input" name="idTrabajo" value="<%=t.getId_trabajo()%>">
											 <input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
											<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
										</form>
									</div>
								</td>
								<td>
									<!-- Borra -->
									<div>
										<form action="ABMCTrabajo" method="post">
											<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
											<input type="hidden" class="custom-control-input" name="idTrabajo" value="<%=t.getId_trabajo()%>">
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