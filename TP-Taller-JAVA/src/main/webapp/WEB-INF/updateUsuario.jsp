<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Actualizar Usuario</title>
<link href="style/bootstrap.css" rel="stylesheet">
<%
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Usuario u =(Usuario)request.getAttribute("usuario");
 %>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<h1>Modificacion</h1>
	<div class="container">
	
	<form action="ABMCUsuario" method="post">
	
		<div class="form-group  ">
				<label for="inputNombre" class="" > Nombre</label>
				<input id="inputNombre" name="nombre" class="form-control " value="<%=u.getNombre()%>" type="text" required>
			</div>
			
			<div class="form-group  ">
				<label for="inputApellido" class=""> Apellido</label>
				<input id="inputApellido" name="apellido" class="form-control " value="<%=u.getApellido() %>" type="text" required>
			</div>
			
			<div class="form-group ">
				<label for="inputTelefono" class=""> Telefono</label>
				<input id="inputTelefono" name="telefono" class="form-control" value="<%=u.getTelefono()%>"  type="text" required>
			</div>
			
			<div class="form-group">
				<label for="selectTipo_doc"> Tipo documento</label>
				<select class="form-select" name="selectTipo_doc" required>
					<option> Seleccione uno...</option>
					<option selected value="dni">DNI</option>
					<option value="pasaporte">Pasaporte</option>
					<option value="libretaCivica">Libreta Civica</option>
				</select>
			</div>
			
			<div class="form-group row ">
				<label for="inputNumDoc" class="col-3"> Numero Documento</label>
				<input id="inputNumDoc" name="num_doc" class="form-control col-7"  value="<%=u.getNum_doc() %>" type="number" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputEmail" class="col-2"> Email</label>
				<input id="inputEmail" name="email" class="form-control col-8" value="<%=u.getEmail() %>" type="email">
			</div>
			
			<div class="form-group row ">
				<label for="inputDireccion" class="col-2"> Direccion</label>
				<input id="inputDireccion" name="direccion" class="form-control col-8" value="<%=u.getDireccion() %>" type="text">
			</div>
			
			<div class="form-group row ">
				<label for="inputNombreU" class="col-4"> Nombre de usuario</label>
				<input id="inputNombreU" name="nombre_usuario" class="form-control col-6" value="<%=u.getNombre_usuario() %>" type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputContra" class="col-3"> Contraseña</label>
				<input id="inputContra" name="contraseña" class="form-control col-7" value="<%=u.getContraseña() %>" type="password" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputContraRep" class="col-3"> Repita Contraseña</label>
				<input id="inputContraRep" name="contraseñaRepetida" class="form-control col-7" value="<%=u.getContraseña() %>" type="password" required>
			</div>
	
	
		<div class="form-group">
	 		<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
	 		<input type="hidden" class="custom-control-input"  name="idUser" value="<%=u.getId_usuario()%>">
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