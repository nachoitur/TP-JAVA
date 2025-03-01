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
        		<img class="card-img-top border-0" width=1280 height=auto src="https://static.vecteezy.com/system/resources/previews/019/879/186/non_2x/user-icon-on-transparent-background-free-png.png" alt="imagen-card-usuarios">
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
        		<img class="card-img-top border-0" src="https://media.istockphoto.com/id/1347150429/photo/professional-mechanic-working-on-the-engine-of-the-car-in-the-garage.jpg?s=612x612&w=0&k=20&c=5zlDGgLNNaWsp_jq_L1AsGT85wrzpdl3kVH-75S-zTU=" alt="imagen-card-trabajos">
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
        		<img class="card-img-top border-0" src="https://day.io/wp-content/uploads/2021/07/software-control-horarios-e1625395372832.png" alt="imagen-card-turnos">
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
        		<img class="card-img-top border-0" src="https://www.megautos.com/wp-content/uploads/2019/01/Toyota-Supra-2020-dinamica.jpg" alt="imagen-card-vehiculos">
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
        		<img class="card-img-top border-0" src="https://media.istockphoto.com/id/478107962/es/foto/auto-parts.jpg?s=612x612&w=0&k=20&c=fH2_LD5qLZHEagkxoc1jSZD-wPH8xr6jG4fWTh_E7zQ=" alt="imagen-card-repuestos">
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
        			<img class="card-img-top border-0" src="https://atpsoftware.vn/wp-content/uploads/2020/02/Nh%E1%BA%ADn-bi%E1%BA%BFt-Register-l%C3%A0-g%C3%AC.jpg" alt="img-registrar-vehiculo">
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
        			<img class="card-img-top border-0" src="https://day.io/wp-content/uploads/2021/07/software-control-horarios-e1625395372832.png" alt="img-sacar-turno">
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
        			<img class="card-img-top border-0" src="https://resizer.glanacion.com/resizer/v2/estos-son-los-autos-0-km-mas-baratos-de-OJF47OAOVFCJDAPXBLPG65RUEA.jpg?auth=9c4f5360107c0d371028a6729fa96499f0eb3e9a73b2f9f3932a1d28ad14030b&width=1200&quality=70&smart=false&height=800" alt="img-mis-vehiculos">
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