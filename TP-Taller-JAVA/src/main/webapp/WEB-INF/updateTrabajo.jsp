<%@page import="entities.Usuario"%>
<%@page import="entities.Trabajo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Actualizar Trabajo</title>
<link href="style/bootstrap.css" rel="stylesheet">
<%
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Trabajo t =(Trabajo)request.getAttribute("trabajo");
 %>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<div class="container">
	
	<h1>Modificacion</h1>
	<h3>Trabajo a modificar: <%=t.getDescripcion()%></h3>
	
	<form action="ABMCTrabajo" method="post">
			<div class="form-group">
				<label for="selectTipoTrabajo">Tipo Trabajo</label>
				<select class="form-select" name="selectTipoTrabajo" selected="<%=t.getTipo_trabajo()%>">
					<option value="Mantenimiento">Mantenimiento</option>
					<option value="Reparaciones Menores">Reparaciones Menores</option>
					<option value="Trabajos Mayores">Trabajos Mayores</option>
					<option value="Tren Motriz">Tren Motriz</option>
					<option value="Trabajo Completo">Trabajo Completo</option>
					<option value="Electrónica">Electrónica</option>
				</select>
			</div>
			
			<div class="form-group row ">
				<label for="inputDescripcion" class="col-2"> Descripción</label>
				<input id="inputDescripcion" name="inputDescripcion" class="form-control col-8" placeholder="<%=t.getDescripcion()%>" value="<%=t.getDescripcion()%>" type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputPrecio" class="col-2">Costo Mano de Obra: </label>
				<input id="inputPrecio" name="inputPrecio" class="form-control col-8" placeholder="<%=t.getCosto_mdo()%>" value="<%=t.getCosto_mdo()%>" type="number" step="any" required>
			</div>
	
	
		<div class="form-group">
	 		<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 		<input type="hidden" class="custom-control-input"  name="idTrabajo" value="<%=t.getId_trabajo()%>">
	 		<input type="hidden" class="custom-control-input"  name="bandera" value="Modificado">
	 		<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
	 	</div>
	 	
	 </form>
	 
	 </div>
	   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  
	 
</body>
</html>