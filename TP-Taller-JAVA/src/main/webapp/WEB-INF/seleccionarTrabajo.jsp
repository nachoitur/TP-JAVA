<%@page import="java.util.HashSet"%>
<%@page import="java.util.LinkedList"%>
<%@page import="entities.Trabajo"%>
<%@page import="logic.TrabajoLogic"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seleccionar Tipo de Trabajo</title>
<link href="style/bootstrap.css" rel="stylesheet">
</head>
<body>
<%@ include file="/WEB-INF/MenuContextualUsuario.jsp"%>

<%
int idVehiculo = Integer.parseInt(request.getAttribute("idVehiculo").toString());
TrabajoLogic tipoTrabajoLogic = new TrabajoLogic();
LinkedList<Trabajo> trabajos = tipoTrabajoLogic.getAll();
HashSet<String> tiposUnicos = new HashSet<>();
%>

<div class="container mt-5">
    <div class="card shadow-lg border-0 rounded">
        <div class="card-header bg-primary text-white text-center">
            <h4>Seleccione un Tipo de Trabajo</h4>
        </div>
        <div class="card-body">
            <form action="ListadoComplejo" method="post">
                <input type="hidden" name="bandera" value="listar">
                <input type="hidden" name="idVehiculo" value="<%= idVehiculo %>">
                
                <div class="mb-3">
                    <label for="tipoTrabajo" class="form-label">Tipo de Trabajo:</label>
                    <select class="form-select" name="tipoTrabajo" required>
                        <% 
                        for (Trabajo t : trabajos) { 
                            if (tiposUnicos.add(t.getTipo_trabajo())) { // Solo se añade si no estaba antes
                        %>
                            <option value="<%=t.getTipo_trabajo()%>"><%= t.getTipo_trabajo() %></option>
                        <% 
                            } 
                        } 
                        %>
                    </select>
                </div>

                <button type="submit" class="btn btn-success w-100">Ver Trabajos Finalizados</button>
                <button type="button" class="btn btn-secondary w-100 mt-3" onclick="window.history.back();">Atrás</button>
            </form>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
