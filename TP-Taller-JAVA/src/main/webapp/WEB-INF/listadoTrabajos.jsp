<%@page import="java.util.LinkedList"%>
<%@page import="entities.Turno"%>
<%@page import="entities.Trabajo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Trabajos Finalizados</title>
<link href="style/bootstrap.css" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/MenuContextualUsuario.jsp"%>

<%
LinkedList<Turno> lista = (LinkedList<Turno>) request.getAttribute("lista");
int idVehiculo = Integer.parseInt(request.getAttribute("idVehiculo").toString());
String tipo = (String) request.getAttribute("tipo");
%>

<div class="container mt-5">
    <div class="card shadow-lg border-0 rounded">
        <div class="card-header bg-primary text-white text-center">
            <h4>Trabajos Finalizados</h4>
        </div>
        <div class="card-body">
            <% if (lista.isEmpty()) { %>
                <p class="text-center">No hay trabajos finalizados de este tipo para este vehículo.</p>
            <% } else { %>
                <table class="table table-striped text-center">
                    <thead class="table-dark">
                        <tr>
                            <th>Fecha</th>
                            <th>Trabajo Realizado</th>
                            <th>Kilómetros al momento del turno</th>
                            <th>Total</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Turno t : lista) { %>
                        	<%
                        		LinkedList<Trabajo> trabajos = t.getTrabajos();
                        		for (Trabajo tr : trabajos){
                        			if (tr.getTipo_trabajo().equals(tipo)){ %>
                        				<tr>
                                			<td><%= t.getFecha() %></td>
                                			<td><%= tr.getDescripcion() %></td>
                                			<td><%= t.getKm_actuales() %></td>
                                			<td><%= t.getTotal() %></td>
                            			</tr>
                        			<% } 
                        		}
                         } %>
                    </tbody>
                </table>
            <% } %>
            <button type="button" class="btn btn-secondary w-100 mt-3" onclick="window.history.back();">Atrás</button>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
