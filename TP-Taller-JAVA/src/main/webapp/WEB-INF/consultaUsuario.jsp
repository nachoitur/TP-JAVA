<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
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
	Usuario u =(Usuario)request.getAttribute("usuario");
 %>  
   
<title>Usuario <%=u.getNombre()%></title>

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
				<button class="btn btn-primary" type="submit" name="optionBM" value="usuarios">Volver</button>	

			</form>
	
		</div>
	<div class="container d-flex flex-column  justify-content-center align-items-center">
	
	<div class="dentro d-flex flex-column  justify-content-center align-items-center">
	
		<div class="row text-center">
			<div class="col">
				<label  class="font-weight-bold">ID</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getId_usuario() %>" disabled>
			</div>
				
		</div>
		
		<div class="row text-center">
			<div class="col text-center">
				<label class="font-weight-bold ">Usuario</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getNombre_usuario() %>" disabled>
			</div>
				
		</div>
	
		
		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">Nombre</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getNombre() %>" disabled>
			</div>
			
			<div class="col">
				<label class="font-weight-bold ">Apellido</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getApellido() %>" disabled>
			</div>
			
		</div>
		
		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">Telefono</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getTelefono() %>" disabled>
			</div>
			
			
			
		</div>
		
		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">Tipo Documento</label>
				<%
				String doc = u.getTipo_doc();
				String valor = "";
				switch(doc){
					case"dni":
						valor = "DNI";
						break;
					case"pas":
						valor = "Pasaporte";
						break;
					case"lic":
						valor = "Libreta Cívica";
						break;
				}
				%>
				<input class="form-control text-center bg-light" type="text" value="<%=valor%>" disabled>
			</div>
			
			<div class="col">
				<label class="font-weight-bold ">Numero Documento</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getNum_doc() %>" disabled>
			</div>	
		</div>
			
		
		
		<div class="row text-center">
			
				<label class="font-weight-bold ">E-Mail</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getEmail() %>" disabled>
			
			
			
			
		</div>
		
		<div class="row text-center">
			<div class="col">
				<label class="font-weight-bold ">Direccion</label>
				<input class="form-control text-center bg-light" type="text" value="<%=u.getDireccion() %>" disabled>
			</div>

		</div>
			
			
			<div class="botonn mb-3">
				<form action="ABMCUsuario" method="post">
						<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="idUser" value="<%=u.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
						<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
				</form>
			</div>
											
			<div class="botonn">
				<form action="ABMCUsuario" method="post">
						<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
						<input type="hidden" class="custom-control-input" name="idUser" value="<%=u.getId_usuario()%>">
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