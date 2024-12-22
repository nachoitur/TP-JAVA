<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista Usuarios</title>
<%
Usuario userLogin = (Usuario)session.getAttribute("usuarioLogin");
LinkedList<Usuario> userlist = (LinkedList<Usuario>)request.getAttribute("listaUsuarios");
%>

<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<div class="container">
    <ul class="nav nav-tabs my-3">
      <li class="nav-item">
        <a class="nav-link active"  data-toggle="tab" href="#opcion1" >Usuarios</a>
      </li>
      <li class="nav-item">
        <a class="nav-link"  data-toggle="tab" href="#opcion2">Mecánicos</a>
      </li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane fade show active" id="opcion1">
     	<div class="row">
	 		<h4 class="mx-3 mb-3">Usuarios</h4>
	 		<div class="">
	 			<form action="registro.jsp" method="post" >											
	 				<button type="submit" class="btn btn-success" name="optionBM" value="alta">Agregar</button>
	 			</form>
	 		</div>
	 			<div class="col-12 col-sm-12 col-lg-12">
	 				<div class="table-responsive">
	 					<table class="table">
	 						<thead>
	 							<tr>
	 								<th></th>
	 								<th>ID</th>
	 								<th>Nombre Usuario</th>
	 								<th>Nombre</th>
	 								<th>Apellido</th>
	 								<th>Email</th>
	 								<th>Número Documento</th>
	
	 								<th></th>
	 								<th></th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						
	 						<%
									for (Usuario usu : userlist) {
										if ((usu.getRol() == 2) && (usu.getId_usuario() != 2)) {
									%>
									<tr>
									
									<td>
											<!-- consulta -->
											<div>
												<form action="ABMCUsuario" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idUser" value="<%=usu.getId_usuario()%>">
													 <input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
													<button type="submit" class="btn btn-consulta btn-primary text-center " name="optionBM" value="consulta">!</button>
												</form>
											</div>
										</td>
										<td><%=usu.getId_usuario()%></td>
										<td><%=usu.getNombre_usuario()%></td>
										<td><%=usu.getNombre()%></td>
										<td><%=usu.getApellido()%></td>
										<td><%=usu.getEmail()%></td>
										<td><%=usu.getNum_doc()%></td>
										

										<td>
											<!-- editar users -->
											<div>
												<form action="ABMCUsuario" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idUser" value="<%=usu.getId_usuario()%>">
													 <input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
													<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
												</form>
											</div>
										</td>
										<td>
											<!-- borrar users -->
											<div>
												<form action="ABMCUsuario" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idUser" value="<%=usu.getId_usuario()%>">
													<button type="submit" class="btn btn-danger" name="optionBM" value="baja">Eliminar</button>
												</form>
											</div>
										</td>


									</tr>
									<%
									}
									}
									%>
								</tbody>

							</table>
						</div>
					</div>
				</div>
			</div>
     
      <div class="tab-pane fade" id="opcion2">
      		
      		<div class="row">
      		<h4 class="mx-3 mb-3">Administradores</h4>
	 		<div class="">
	 			<form action="ABMCUsuario" method="post" >				
	 				<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">						
	 				<button type="submit" class="btn btn-success" name="optionBM" value="alta">Agregar</button>
	 			</form>
	 		</div>
	 			<div class="col-12 col-sm-12 col-lg-12">
	 				<div class="table-responsive">
	 					<table class="table">
	 						<thead>
	 							<tr>
	 								<th>ID</th>
	 								<th>Nombre</th>
	 								<th>Apellido</th>
	 								<th>Telefono</th>
	 								<th>Numero Documento</th>
	 								<th>Email</th>
	 								<th>Nombre Usuario</th>
	 								<th>Direccion</th>
	 								<th></th>
	 								<th></th>
	 							</tr>
	 						</thead>
	 						<tbody>
	 						
	 						<%
									for (Usuario usu : userlist) {
										if (usu.getRol() == 1) {
									%>
									<tr>
										<td><%=usu.getId_usuario()%></td>
										<td><%=usu.getNombre()%></td>
										<td><%=usu.getApellido()%></td>
										<td><%=usu.getTelefono()%></td>
										<td><%=usu.getNum_doc()%></td>
										<td><%=usu.getEmail()%></td>
										<td><%=usu.getNombre_usuario()%></td>
										<td><%=usu.getDireccion()%></td>

										<td>
											<!-- editar users-->
											<div>
												<form action="ABMCUsuario" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idUser" value="<%=usu.getId_usuario()%>"> 
													<input type="hidden" class="custom-control-input" name="bandera" value="aModificar">
													<button type="submit" class="btn btn-warning" name="optionBM" value="modificacion">Modificar</button>
												</form>
											</div>
										</td>
										<td>
											<!-- borrar users-->
											<div>
												<form action="ABMCUsuario" method="post">
													<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
													<input type="hidden" class="custom-control-input" name="idUser" value="<%=usu.getId_usuario()%>">
													<button type="submit" class="btn btn-danger" name="optionBM" value="baja">Eliminar</button>
												</form>
											</div>
										</td>


									</tr>
									<%
									}
									}
									%>
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