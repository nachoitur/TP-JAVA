<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registro Mecanico</title>

<link rel="stylesheet" href="style/styles.css">
<link href="style/bootstrap.css" rel="stylesheet">
<%
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Usuario u =(Usuario)request.getAttribute("usuario");
 	
 %>

</head>
<body>
		<div class="container  ">
		<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
		<div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-danger alert-dismissible">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
              <span>x</span>
            </button>
   		 </div>      
		<h1 class="text-center mt-2">Registro Mecanico</h1>
		
		<form action="RegistroMecanico" method="post" class="form-registro ">
		
			<div class="form-group row ">
				<label for="inputNombre" class="col-2"> Nombre</label>
				<input id="inputNombre" name="nombre" class="form-control col-8"  type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputApellido" class="col-2"> Apellido</label>
				<input id="inputApellido" name="apellido" class="form-control col-8"  type="text">
			</div>
			
			<div class="form-group row ">
				<label for="inputTelefono" class="col-2"> Telefono</label>
				<input id="inputTelefono" name="telefono" class="form-control col-8"  type="number">
			</div>
			
			<div class="form-group">
				<label for="selectTipo_doc"> Tipo documento</label>
				<select class="form-select" name="selectTipo_doc">
					<option> Seleccione uno</option>
					<option selected value="dni">DNI</option>
					<option value="pas">Pasaporte</option>
					<option value="lic">Libreta Civica</option>
				</select>
			</div>
			
			<div class="form-group row ">
				<label for="inputNumDoc" class="col-3"> Numero Documento </label>
				<input id="inputNumDoc" name="num_doc" class="form-control col-7"  type="number">
			</div>
			
			<div class="form-group row ">
				<label for="inputEmail" class="col-2"> Email</label>
				<input id="inputEmail" name="email" class="form-control col-8"  type="email">
			</div>			
			
			<div class="form-group row ">
				<label for="inputDireccion" class="col-2">Direccion</label>
				<input id="inputDireccion" name="direccion" class="form-control col-8"  type="text" required>
			</div>			
			
			<div class="form-group row ">
				<label for="inputNombreU" class="col-4"> Nombre de usuario</label>
				<input id="inputNombreU" name="nombre_usuario" class="form-control col-6"  type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputContra" class="col-3"> Contraseña</label>
				<input id="inputContra" name="contraseña" class="form-control col-7"  type="password" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputContraRep" class="col-3"> Repita Contraseña</label>
				<input id="inputContraRep" name="contraseñaRepetida" class="form-control col-7"  type="password" required>
			</div>
			
			<div class="col-auto">
				<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
      			<button type="submit" class="btn btn-primary mb-2">Registrar</button>
    		</div>
			
		</form>
		
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  
</body>
</html>