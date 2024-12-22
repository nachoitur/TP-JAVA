<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.LinkedList"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Registro</title>
<link rel="stylesheet" href="style/styles.css">
<link href="style/bootstrap.css" rel="stylesheet">
<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>
</head>
<body>
	
	<%
	Usuario userLogin=new Usuario();
	if(session.getAttribute("usuarioLogin")!=null){
	userLogin = (Usuario) session.getAttribute("usuarioLogin");
	}
	%>
	
	<div class="container  ">
		<div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-danger alert-dismissible">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
              <span>x</span>
            </button>
   		 </div>    
   		 
		<h1 class="text-center">Registro</h1>
		<form class="form-registro" action="registro" method="post" id="formulario">
		<% if(session.getAttribute("usuarioLogin")!=null){%>
			<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
		<%} %>
		
			<div class="form-group row ">
				<label for="inputNombre" class="col-2"> Nombre</label>
				<input id="inputNombre" name="nombre" class="form-control col-8"  type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputApellido" class="col-2"> Apellido</label>
				<input id="inputApellido" name="apellido" class="form-control col-8"  type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputTelefono" class="col-2"> Teléfono</label>
				<input id="inputTelefono" name="telefono" class="form-control col-8"  type="number" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputEmail" class="col-2"> Email</label>
				<input id="inputEmail" name="email" class="form-control col-8"  type="email">
			</div>
			
			<div class="form-group">
				<label for="selectTipo_doc"> Tipo Documento</label>
				<select class="form-select" name="selectTipo_doc">
					<option selected> Seleccione uno</option>
					<option value="dni">DNI</option>
					<option value="pasaporte">Pasaporte</option>
					<option value="libretaCivica">Libreta Civica</option>
				</select>
			</div>
			
			<div class="form-group row ">
				<label for="inputNumDoc" class="col-3"> Numero Documento</label>
				<input id="inputNumDoc" name="num_doc" class="form-control col-7"  type="number">
			</div>
			
			<div class="form-group row ">
				<label for="inputDireccion" class="col-2">Dirección</label>
				<input id="inputDireccion" name="direccion" class="form-control col-8"  type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputNombredeusuario" class="col-4"> Nombre de usuario</label>
				<input id="inputNombredeusuario" name="nombre_usuario" class="form-control col-6"  type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputContrasenia" class="col-3"> Contraseña</label>
				<input id="inputContrasenia" name="contraseña" class="form-control col-7"  type="password" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputContraseniaRepetida" class="col-3"> Repita Contraseña</label>
				<input id="inputContraseniaRepetida" name="contraseñaRepetida" class="form-control col-7"  type="password" required>
			</div>
			<div class="col-auto">
      			<button type="submit" class="btn btn-primary mb-2">Registrar</button>
    		</div>
			
		</form>
		
	</div>
</body>
</html>