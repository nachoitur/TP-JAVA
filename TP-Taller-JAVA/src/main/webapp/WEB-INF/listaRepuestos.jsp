<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Repuesto"%>
<%@page import="logic.RepuestoLogic"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista Repuestos</title>
<%
Usuario userLogin = (Usuario)session.getAttribute("usuarioLogin");
RepuestoLogic rel = new RepuestoLogic();
LinkedList<Repuesto> partslist = rel.getAll();
%>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-danger alert-dismissible">
        <p><%= request.getAttribute("mensaje") %></p>
        <button type="button" class="close" data-dismiss="alert">
        	<span>x</span>
		</button>
    </div>
    <div class="container">
    	<div class="tab-content">
			<div class="tab-pane fade show active" id="opcion1">
     			<div class="row">
     				<h4 class="mx-3 mb-3">Repuestos</h4>
     				<div class="">
	 					<!-- Crear -->
						<form action="ABMCRepuesto" method="post">
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
	 									<th>Descripción</th>
	 									<th>Precio</th>
	 									<th></th>
	 									<th></th>
	 								</tr>
	 							</thead>
	 							<tbody>
	 								<% for (Repuesto r: partslist){ %>
	 									<tr>
	 										<td>
	 											<!-- Consulta -->
												<div>
													<form action="ABMCRepuesto" method="post">
														<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
														<input type="hidden" class="custom-control-input" name="idRepuesto" value="<%=r.getId_repuesto()%>">
														<button type="submit" class="btn btn-consulta btn-primary text-center " name="optionBM" value="consulta">!</button>
													</form>
												</div>
	 										</td>
	 										<td><%=r.getDescripcion()%></td>
											<td>$ <%=r.getPrecio()%></td>
											<td>
												<!-- Modifica -->
												<div>
													<form action="ABMCRepuesto" method="post">
														<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
														<input type="hidden" class="custom-control-input" name="idRepuesto" value="<%=r.getId_repuesto()%>">
														<input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
														<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
													</form>
												</div>
											</td>
											<td>
												<!-- Borra -->
												<div>
													<form action="ABMCRepuesto" method="post">
														<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
														<input type="hidden" class="custom-control-input" name="idRepuesto" value="<%=r.getId_repuesto()%>">
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