<%@page import="java.util.LinkedList" %>
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
    <title>Registro Turno</title>
    <link rel="stylesheet" href="style/styles.css">
    <link href="style/bootstrap.css" rel="stylesheet">
    
    <% Usuario userLogin = (Usuario) session.getAttribute("usuarioLogin"); %>
    <% LinkedList<Vehiculo> vehiculos = userLogin.getVehiculos(); %>
    <% LinkedList<Trabajo> trabajos = (LinkedList<Trabajo>)request.getAttribute("trabajos"); %>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualUsuario.jsp" %>
    <div class="container">
        <h1 class="text-center mt-2">Registro Turno</h1>

        <form action="ConexionUsuario" method="post" class="form-registro">
            <input type="hidden" name="optionBM" value="sacarTurno">
            <input type="hidden" class="custom-control-input" name="bandera" value="agregado">
            <input type="hidden" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">

            <!-- Selección de Fecha -->
            <div class="form-group">
                <label for="fecha">Fecha del Turno: </label>
                <input type="date" id="fecha" name="fecha" class="form-control" required>
            </div>
            
            <!-- Selección de Hora -->
            <div class="form-group">
                <label for="hora">Hora del Turno: </label>
                <select id="hora" name="hora" class="form-select" required></select>
            </div>

            <!-- Selección de Vehículo -->
            <div class="form-group">
                <label for="vehiculo">Vehiculo: </label>
                <input list="vehiculos" name="vehiculo" id="vehiculo" class="form-control" required>
                <datalist id="vehiculos">
                    <% for (Vehiculo v : vehiculos) { %>
                        <option value="<%= v.getPatente() %>">
                    <% } %>
                </datalist>
                <span id="vehiculoError" class="text-danger" style="display:none;">Debe seleccionar uno de sus vehículos.</span>
            </div>

            <!-- Selección de Trabajos -->
            <div class="form-group">
                <label for="trabajo">Trabajos a realizar: </label>
                <select id="trabajo" class="form-select">
                    <% for (Trabajo t : trabajos) { %>
                        <option value="<%= t.getId_trabajo() %>" data-precio="<%= t.getCosto_mdo() %>" data-repuestos="<%= t.getTotalRepuestos() %>"><%= t.getDescripcion() %></option>
                    <% } %>
                </select>
                <button type="button" id="agregarTrabajo" class="btn btn-primary mt-2">Agregar Trabajo</button>
                <input type="hidden" id="trabajosSeleccionados" name="trabajosSeleccionados">
                <ul id="listaTrabajos" class="mt-2"></ul>
            </div>
            
            <!-- Kilometros actuales -->
            <div class="form-group">
                <label for="kmact">Kilómetros actuales: </label>
                <input id="kmact" name="kmact" class="form-control col-8"  type="number" step="any" min="0" required>
            </div>
            
            <!-- Medio de Pago -->
            <div class="form-group">
                <label for="medioPago">Medio de Pago: </label>
                <select id="medioPago" name="medioPago" class="form-select">
                    <option value="Efectivo">Efectivo</option>
                    <option value="Transferencia">Transferencia</option>
                    <option value="Débito">Débito</option>
                    <option value="Crédito">Crédito</option>
                </select>
            </div>
            
            <!-- Total -->
            <div class="form-group">
                <label for="total">Total: </label>
                <input type="text" id="total" name="total" class="form-control" value="0" readonly>
            </div>
            
            <button id="submitBtn" type="submit" class="btn btn-success">Registrar Turno</button>
        </form>
    </div>

    <script>
document.addEventListener("DOMContentLoaded", function () {
    // Obtener elementos del DOM
    const fechaInput = document.getElementById("fecha");
    const horaSelect = document.getElementById("hora");
    const trabajosSelect = document.getElementById("trabajo");
    const vehiculoSelect = document.getElementById("vehiculo");
    const vehiculoDatalist = document.getElementById("vehiculos");
    const agregarTrabajoBtn = document.getElementById("agregarTrabajo");
    const listaTrabajos = document.getElementById("listaTrabajos");
    const totalInput = document.getElementById("total");
    const submitBtn = document.getElementById("submitBtn");

    // Verificar que los elementos existen
    let elementosNoEncontrados = [];
    if (!fechaInput) elementosNoEncontrados.push("fecha");
    if (!horaSelect) elementosNoEncontrados.push("hora");
    if (!trabajosSelect) elementosNoEncontrados.push("trabajo");
    if (!vehiculoSelect) elementosNoEncontrados.push("vehiculo");
    if (!agregarTrabajoBtn) elementosNoEncontrados.push("agregarTrabajo");
    if (!listaTrabajos) elementosNoEncontrados.push("listaTrabajos");
    if (!totalInput) elementosNoEncontrados.push("total");
    if (!submitBtn) elementosNoEncontrados.push("submitBtn");

    if (elementosNoEncontrados.length > 0) {
        console.error("Error: Los siguientes elementos no fueron encontrados en el DOM:", elementosNoEncontrados);
        return;
    } else {
        console.log("Todos los elementos fueron encontrados correctamente");
    }

    // Deshabilitar select de horarios hasta que se seleccione una fecha válida
    horaSelect.disabled = true;
    
 	// Establecer la fecha mínima como la actual
    let today = new Date();
    let todayStr = today.toISOString().split("T")[0];
    fechaInput.setAttribute("min", todayStr);

    // Bloquear domingos en la selección de fecha
    fechaInput.addEventListener("change", function () {
    	if (!this.value) return;
    	
        let date = new Date(this.value + "T00:00:00"); //Forzar zona horaria local
        
        if (date < today) {
            alert("No puedes seleccionar la fecha de hoy o anterior.");
            this.value = todayStr; // Restablecer a la fecha mínima permitida
            return;
        }

        if (date.getDay() === 0) { // 0 es Domingo
            alert("Los domingos no trabajamos :)");
            this.value = ""; // Limpiar la selección
            horaSelect.disabled = true;
        } else {
            horaSelect.disabled = false;
            actualizarHorarios(date.getDay());
        }
    });

    // Lista de horarios disponibles
    function actualizarHorarios(dia) {
        horaSelect.innerHTML = ""; // Limpiar opciones previas
        const horarios = (dia === 6) // 6 es Sábado (Los sábados se trabaja media jornada)
        ? ["08:00", "08:30", "09:00", "09:30", "10:00", "10:30", 
           "11:00", "11:30", "12:00", "12:30"] 
        : ["08:00", "08:30", "09:00", "09:30", "10:00", "10:30",
           "11:00", "11:30", "12:00", "12:30", "16:00", "16:30",
           "17:00", "17:30", "18:00", "18:30", "19:00", "19:30",
           "20:00", "20:30"];

        horarios.forEach(hora => {
            let option = document.createElement("option");
            option.value = hora;
            option.textContent = hora;
            horaSelect.appendChild(option);
        });
        
        horaSelect.disabled = false; // Habilitar el select de horarios
    }

    // Agregar trabajo a la lista
    agregarTrabajoBtn.addEventListener("click", function () {
        let selectedIndex = trabajosSelect.selectedIndex;
        
     // Verificar si se seleccionó una opción válida
        if (selectedIndex === -1) {
            alert("Por favor, seleccione un trabajo antes de agregarlo.");
            return;
        }
     
        let selectedOption = trabajosSelect.options[trabajosSelect.selectedIndex];
        
        if (!selectedOption || !selectedOption.textContent.trim()) {
            alert("Error: No se pudo obtener la descripción del trabajo.");
            return;
        }

        let descripcion = selectedOption.innerText.trim();        
        let precio = parseFloat(selectedOption.getAttribute("data-precio")) || 0;
        
        let repuestoPrecio = parseFloat(selectedOption.getAttribute("data-repuestos")) || 0;
        let totalTrabajo = precio + repuestoPrecio;

        // Crear elemento <li> con contenido visible
        let li = document.createElement("li");
        li.textContent = descripcion + " || Costo mano de obra: $" + precio.toFixed(2) + " + Costo repuestos: " + repuestoPrecio.toFixed(2) + " || TOTAL: $" + totalTrabajo.toFixed(2) + " ";

        let eliminarBtn = document.createElement("button");
        eliminarBtn.textContent = "X";
        eliminarBtn.classList.add("btn", "btn-danger", "btn-sm", "ms-2");

        li.appendChild(eliminarBtn);
        listaTrabajos.appendChild(li);
        
     	// Agregar la descripción al input oculto
        let trabajosInput = document.getElementById("trabajosSeleccionados");
        let trabajosArray = trabajosInput.value ? trabajosInput.value.split(",") : [];
        trabajosArray.push(descripcion);
        trabajosInput.value = trabajosArray.join(",");

        // Actualizar el total
        totalInput.value = (parseFloat(totalInput.value) || 0) + totalTrabajo;

        // Evento para eliminar trabajo agregado
        eliminarBtn.addEventListener("click", function () {
            totalInput.value = (parseFloat(totalInput.value) || 0) - totalTrabajo;
            li.remove();
        });
    });

    // Manejo del botón de envío
    submitBtn.addEventListener("click", function (e) {
        const vehiculosDisponibles = Array.from(vehiculoDatalist.options).map(option => option.value);
        const vehiculoSeleccionado = vehiculoSelect.value;
        
        if (!fechaInput.value || !horaSelect.value || !vehiculoSelect.value || listaTrabajos.children.length === 0) {
            alert("Debe completar todos los campos y agregar al menos un trabajo.");
            e.preventDefault();
            return;
        }
        
		// Revisa que el vehiculo ingresado esté registrado
        if (!vehiculosDisponibles.includes(vehiculoSeleccionado)) {
            alert("Debes elegir uno de tus vehículos registrado, el vehículo ingresado no está registrado.");
            e.preventDefault(); // Evita que se envíe el formulario
            return;
        }
    });
});
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
