<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Trabajo"%>
<%@page import="entities.Repuesto"%>
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
Trabajo t =(Trabajo)request.getAttribute("trabajo");
 %>  
   
<title>Consulta Trabajo</title>

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
			<button class="btn btn-primary" type="submit" name="optionBM" value="trabajos">Volver</button>
		</form>
	</div>
	<div class="container d-flex flex-column  justify-content-center align-items-center">
		<div class="dentro d-flex flex-column  justify-content-center align-items-center">
			<div class="row text-center">
				<div class="col">
					<label  class="font-weight-bold">ID</label>
					<input class="form-control text-center bg-light" type="text" value="<%=t.getId_trabajo() %>" disabled>
				</div>
			</div>
			<div class="row text-center">
				<div class="col text-center">
					<label class="font-weight-bold ">Tipo de Trabajo</label>
					<input class="form-control text-center bg-light" type="text" value="<%=t.getTipo_trabajo() %>" disabled>
				</div>
			</div>
			<div class="row text-center">
				<div class="col">
					<label class="font-weight-bold ">Descripción</label>
					<input class="form-control text-center bg-light" type="text" value="<%=t.getDescripcion() %>" disabled>
				</div>
			</div>
			<div class="row text-center">
				<div class="col">
					<label class="font-weight-bold ">Costo Mano de Obra</label>
					<input class="form-control text-center bg-light" type="text" value="<%=t.getCosto_mdo()%>" disabled>
				</div>
			</div>
			<h4>Repuestos del trabajo:</h4>
			<div class="table-responsive">
				<table class="table">
					<thead>
						<tr>
	 						<th></th>
	 						<th>Descripcion</th>
	 						<th>Precio</th>
	 						<th>Stock</th>
	 						<th></th>
	 					</tr>
	 				</thead>
	 				<tbody>
	 					<%for (Repuesto r: t.getRepuestos()) { %>
	 						<tr>
	 							<td></td>
	 							<td><%=r.getDescripcion()%></td>
	 							<td><%=r.getPrecio()%></td>
	 							<td><%=r.getStock()%></td>
	 							<td></td>
	 						</tr>
	 					<% } %>
	 				</tbody>
				</table>
			</div>			
			<div class="botonn mb-3">
				<form action="ABMCTrabajo" method="post">
					<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
					<input type="hidden" class="custom-control-input" name="idTrabajo" value="<%=t.getId_trabajo()%>">
					<input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
					<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
				</form>
			</div>						
			<div class="botonn">
				<form action="ABMCUsuario" method="post">
					<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
					<input type="hidden" class="custom-control-input" name="idTrabajo" value="<%=t.getId_trabajo()%>">
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