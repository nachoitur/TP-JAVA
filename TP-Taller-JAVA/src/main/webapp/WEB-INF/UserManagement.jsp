<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
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
 %>  
   
<title>Menu</title>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>

</head>
<body>

	<!-- MENÚ PARA ADMINISTRADORES/MECÁNICOS -->

	<%if(userLogin.getRol() == 1){ %>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
		<h1 class="text-center">¡Bienvenid@ <%=userLogin.getNombre()%>!</h1>
    <div class="grande container-fluid d-flex justify-content-center flex-wrap align-content-center">
		
		<form action="Conexion" method="post">
		
			<div class="card box1 ">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="cuadros btn  text-center p-0" type="submit" name="optionBM" value="usuarios">
        		<img class="card-img-top border-0" width=1280 height=auto src="images/usuarios.jpg" alt="imagen-card-usuarios">
       			<div class="card-body">	
          			<h5>Usuarios</h5>
        		</div>	
        	</button>	
    		</div>
			
		</form>
      

	<form action="Conexion" method="post">
		
			<div class="card box1 ">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn cuadros text-center p-0" type="submit" name="optionBM" value="trabajos"> 
        		<img class="card-img-top border-0" src="images/trabajo.jpg" alt="imagen-card-trabajos">
       			<div class="card-body">
          			<h5>Trabajos</h5>
        		</div>	
        		</button>	
    		</div>
			
	</form>
	
	<form action="Conexion" method="post">
		
			<div class="card box1 ">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="turnos">
        		<img class="card-img-top border-0" src="images/turnos.jpg" alt="imagen-card-turnos">
       			<div class="card-body">
          			<h5>Turnos</h5>
        		</div>	
        		</button>	
    		</div>
			
	</form>
		
     <form action="Conexion" method="post">
		
			<div class="card box1 ">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn cuadros text-center p-0" type="submit" name="optionBM" value="vehiculos">
        		<img class="card-img-top border-0" src="images/vehiculos.jpg" alt="imagen-card-vehiculos">
       			<div class="card-body">
          			<h5>Vehiculos</h5>
        		</div>	
        		</button>	
    		</div>
			
	</form> 

     <form action="Conexion" method="post">
		
			<div class="card box1 ">
				<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
				<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="repuestos">
        		<img class="card-img-top border-0" src="images/repuestos.jpg" alt="imagen-card-repuestos">
       			<div class="card-body">
          			<h5>Repuestos</h5>
        		</div>	
        		</button>	
    		</div>
	</form>
   </div>
   
   <!-- MENÚ PARA USUARIOS -->>
   
   <%}else if(userLogin.getRol() == 2){ %>
  		<%@ include file="/WEB-INF/MenuContextualUsuario.jsp"%>
  		<h1 class="text-center">¡Bienvenid@: <%=userLogin.getNombre() %>!</h1>
  			<div class="grande container-fluid d-flex justify-content-center flex-wrap align-content-center">
  				<form action="ConexionUsuario" method="post">
				<div class="card box1 ">
					<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
					<input type="hidden" class="custom-control-input" name="bandera" value="agregar">
					<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="registrarVehiculo">
        			<img class="card-img-top border-0" src="images/registrar.jpg" alt="img-registrar-vehiculo">
       				<div class="card-body">
       					<h5>Registrar Vehículo</h5>
        			</div>	
        			</button>	
    			</div>	
				</form> 
				<form action="ConexionUsuario" method="post">
				<div class="card box1 ">
					<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
					<input type="hidden" class="custom-control-input" name="bandera" value="agregar">
					<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="sacarTurno">
        			<img class="card-img-top border-0" src="images/turnos.jpg" alt="img-sacar-turno">
       				<div class="card-body">
       					<h5>Sacar Turno</h5>
        			</div>	
        			</button>	
    			</div>	
				</form> 
				<form action="ConexionUsuario" method="post">
				<div class="card box1 ">
					<input type="hidden" class="custom-control-input"  name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
					<button class="btn cuadros  text-center p-0" type="submit" name="optionBM" value="misVehiculos">
        			<img class="card-img-top border-0" src="images/misvehiculos.jpg" alt="img-mis-vehiculos">
       				<div class="card-body">
       					<h5>Mis vehículos</h5>
        			</div>	
        			</button>	
    			</div>	
				</form> 
  			</div>
  <%} %>
  
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  

</body>
</html>