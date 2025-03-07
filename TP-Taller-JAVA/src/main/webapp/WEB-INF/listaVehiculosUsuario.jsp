<%@page import="java.util.LinkedList"%>
<%@page import="entities.Usuario"%>
<%@page import="entities.Vehiculo"%>
<%@page import="logic.VehiculoLogic"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista de Vehiculos</title>
<%
Usuario userLogin = (Usuario)session.getAttribute("usuarioLogin");
LinkedList<Vehiculo> carlist = userLogin.getVehiculos();
//VehiculoLogic vel = new VehiculoLogic();
%>
<!-- Bootstrap core CSS -->
<link href="style/bootstrap.css" rel="stylesheet">
<!-- Custom styles for this template -->
<style><%@include file="/WEB-INF/estilos/estilo.css"%></style>
</head>
<body>
<%@ include file="/WEB-INF/MenuContextualUsuario.jsp"%>
<div class="container-fluid mt-4 d-flex justify-content-center">
    <div class="card shadow-lg border-0 rounded w-75" style="min-height: 80vh;">
        <div class="card-header bg-primary text-white text-center">
            <h4 class="fs-4 text-wrap">
                Vehículos de <%= userLogin.getNombre() + " " + userLogin.getApellido() %>
            </h4>
        </div>
        <div class="card-body d-flex flex-column" style="flex-grow: 1;">
            <div class="table-responsive" style="flex-grow: 1; max-height: 65vh; overflow-y: auto;">
                <table class="table table-striped table-bordered text-center align-middle">
                    <thead class="table-dark">
                        <tr>
                            <th>Patente</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Año</th>
                            <th>Color</th>
                            <th>Info Adicional</th>
                            <th>Listado de Trabajos</th>
                        </tr>
                    </thead>
                    <tbody class="table-hover">
                        <% for (Vehiculo v : carlist) { %>
                            <tr>
                                <td><strong><%= v.getPatente() %></strong></td>
                                <td><%= v.getMarca() %></td>
                                <td><%= v.getModelo() %></td>
                                <td><%= v.getAño() %></td>
                                <td><%= v.getColor() %></td>
                                <td><%= v.getInfoAdicional() == null || v.getInfoAdicional().equals("") ? "No hay información adicional" : v.getInfoAdicional() %></td>
                                <td>
                                <!-- Listado de trabajos -->
									<div>
										<form action="ListadoComplejo" method="post">
											<input type="hidden" class="custom-control-input" name="bandera" value="preguntar">
											<input type="hidden" class="custom-control-input" name="idVehiculo" value="<%=v.getId_vehiculo()%>">
											<button type="submit" class="btn btn-primary text-center" name="opcion" value="opcion">Ver</button>
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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>