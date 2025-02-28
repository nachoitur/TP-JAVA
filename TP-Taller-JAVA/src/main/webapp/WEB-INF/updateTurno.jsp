<%@page import="java.util.LinkedList" %>
<%@ page import="entities.Turno" %>
<%@page import="entities.Vehiculo" %>
<%@page import="entities.Trabajo" %>
<%@page import="entities.Usuario" %>
<%@page import="java.time.LocalDate" %>
<%@page import="java.time.LocalTime" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
    <title>Actualizar Turno</title>
    <link rel="stylesheet" href="style/styles.css">
    <link href="style/bootstrap.css" rel="stylesheet">
<%
	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Turno tur =(Turno)request.getAttribute("turno");
	LinkedList<Trabajo> trabajos = (LinkedList<Trabajo>)request.getAttribute("trabajos");
%>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<div class="container">
	
    <h1>Modificacion</h1>
    <h3>Vehículo a modificar el turno: <%=tur.getVehiculo().getPatente()%></h3>
    
    <form action="ABMCTurno" method="post" class="form-registro">
    	<input type="hidden" name="optionBM" value="modificacion">
        <input type="hidden" class="custom-control-input" name="bandera" value="modificado">
        <input type="hidden" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
        <input type="hidden" name="idVehiculo" value="<%=tur.getVehiculo().getId_vehiculo()%>">
            
        <div class="form-group row">
    		<label for="fechaTurno" class="col-2">Fecha del Turno: </label>
    		<input type="date" id="fechaTurno" name="fechaTurno" class="form-control col-8" placeholder="<%=tur.getFecha()%>>" value="<%= tur.getFecha() %>" readonly>
		</div>
		<div class="form-group row ">
			<label for="horaTurno" class="col-2">Hora del Turno: </label>
			<input id="horaTurno" name="horaTurno" class="form-control col-8" placeholder="<%=tur.getHora()%>" value="<%=tur.getHora()%>" type="text" readonly>
		</div>
		
		<!-- Trabajos -->
            <div class="form-group">
                <label for="trabajo">Trabajos a realizar: </label>
                <select id="trabajo" class="form-select">
                    <% for (Trabajo t : trabajos) { %>
                        <option value="<%= t.getId_trabajo() %>" data-precio="<%= t.getCosto_mdo() %>" data-repuestos="<%= t.getTotalRepuestos() %>"><%= t.getDescripcion() %></option>
                    <% } %>
                </select>
                <button type="button" id="agregarTrabajo" class="btn btn-primary mt-2">Agregar Trabajo</button>
                <input type="hidden" id="trabajosSeleccionados" name="trabajosSeleccionados">
            </div>
            
        <!-- Lista de trabajos seleccionados -->
			<ul id="listaTrabajos" class="list-group mt-3">
    			<% for (Trabajo t : tur.getTrabajos()) { %>
        			<li class="list-group-item" data-trabajo-id="<%= t.getId_trabajo() %>" data-precio="<%= t.getCosto_mdo()%>" data-repuestos="<%= t.getTotalRepuestos()%>">
            			<span class="trabajo-descripcion"><%= t.getDescripcion()%> || Costo mano de obra: $<%= t.getCosto_mdo()%> + Costo repuestos: $<%= t.getTotalRepuestos()%> || TOTAL: $<%= t.getTotal() %> </span>
            			<button type="button" class="btn btn-danger btn-sm float-end eliminarTrabajo">X</button>
            			<input type="hidden" name="trabajos[]" value="<%= t.getId_trabajo() %>">
        			</li>
    			<% } %>
			</ul>
		
			<!-- Kilometros actuales -->
            <div class="form-group">
                <label for="kmact">Kilómetros actuales: </label>
                <input id="kmact" name="kmact" class="form-control col-8" placeholder="<%=tur.getKm_actuales()%>" value="<%=tur.getKm_actuales()%>" type="number" step="any" min="0" required>
            </div>
            
            <!-- Medio de Pago -->
            <div class="form-group">
                <label for="medioPago">Medio de Pago: </label>
                <select id="medioPago" name="medioPago" class="form-select">
    				<option value="Efectivo" <%= tur.getMedio_pago().equals("Efectivo") ? "selected" : "" %>>Efectivo</option>
    				<option value="Transferencia" <%= tur.getMedio_pago().equals("Transferencia") ? "selected" : "" %>>Transferencia</option>
    				<option value="Débito" <%= tur.getMedio_pago().equals("Débito") ? "selected" : "" %>>Débito</option>
    				<option value="Crédito" <%= tur.getMedio_pago().equals("Crédito") ? "selected" : "" %>>Crédito</option>
				</select>
            </div>
            
            <!-- Estado -->
            <div class="form-group">
                <label for="estado">Estado: </label>
                <select id="estado" name="estado" class="form-select">
                    <option value="Reservado" <%= tur.getEstado().equals("Reservado") ? "selected" : "" %>>Reservado</option>
                    <option value="Iniciado" <%= tur.getEstado().equals("Iniciado") ? "selected" : "" %>>Iniciado</option>
                    <option value="A entregar" <%= tur.getEstado().equals("A entregar") ? "selected" : "" %>>A entregar</option>
                    <option value="Finalizado" <%= tur.getEstado().equals("Finalizado") ? "selected" : "" %>>Finalizado</option>
                </select>
            </div>
            
            <!-- Total -->
            <div class="form-group">
                <label for="total">Total: </label>
                <input type="text" id="total" name="total" class="form-control" value="0" readonly>
            </div>
            
            <div class="form-group">
            	<button id="submitBtn" type="submit" class="btn btn-success">Guardar cambios</button>
            </div>
    </form>
</div>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const listaTrabajos = document.getElementById("listaTrabajos");
    const selectTrabajo = document.getElementById("trabajo");
    const btnAgregar = document.getElementById("agregarTrabajo");
    const totalInput = document.getElementById("total");
    
    function actualizarTotal() {
        let total = 0;
        document.querySelectorAll("#listaTrabajos li").forEach(li => {
            total += parseFloat(li.getAttribute("data-precio")) || 0;
            total += parseFloat(li.getAttribute("data-repuestos")) || 0;
        });
        totalInput.value = total.toFixed(2);
    }
    
    btnAgregar.addEventListener("click", function () {
        const selectedOption = selectTrabajo.options[selectTrabajo.selectedIndex];
        if (!selectedOption) return alert("Debe seleccionar un trabajo válido.");
        
        // Obtengo el id del trabajo
        const trabajoId = selectedOption.value;
        if ([...document.querySelectorAll("#listaTrabajos li")].some(li => li.getAttribute("data-trabajo-id") === trabajoId)) {
            return alert("Este trabajo ya está en la lista.");
        }

        // Creo el li
        const li = document.createElement("li");
        li.className = "list-group-item";
        li.setAttribute("data-trabajo-id", trabajoId);
        
        // Variables de precios y repiuestos
        let precio = parseFloat(selectedOption.getAttribute("data-precio"));
        let repuesto = parseFloat(selectedOption.getAttribute("data-repuestos"));
        li.setAttribute("data-precio", precio);
        li.setAttribute("data-repuestos", repuesto);
        
        // Lo que se muestra en pantalla cuando agrego un trabajo
        li.textContent = selectedOption.text + " || Costo mano de obra: $" + precio.toFixed(2) + " + Costo repuestos: $" + repuesto.toFixed(2) + " || TOTAL: $" + (precio+repuesto).toFixed(2) + " ";
        
        // Botón para eliminar los trabajos agregados
        const eliminarTrabajo = document.createElement("button");
        eliminarTrabajo.textContent = "X";
        eliminarTrabajo.classList.add("btn", "btn-danger", "btn-sm", "ms-2", "eliminarTrabajo");
        li.appendChild(eliminarTrabajo);
        
     	// Creo el input hidden para enviar los trabajos agregados al servidor
        const inputHidden = document.createElement("input");
        inputHidden.type = "hidden";
        inputHidden.name = "trabajos[]";
        inputHidden.value = trabajoId;
        li.appendChild(inputHidden);
        
        // Agrego el trabajo a la lista y actualizo el total
        listaTrabajos.appendChild(li);
        actualizarTotal();
    });
    
    // Acción de botón eliminarTrabajo
    document.getElementById("listaTrabajos").addEventListener("click", function (event) {
        if (event.target.classList.contains("eliminarTrabajo")) {
            const li = event.target.closest("li");
            if (li) {
                li.remove();
                actualizarTotal();
            }
        }
    });

    // Calculo el total al cargar la página (para trabajos ya existentes)
    actualizarTotal();
});
</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>