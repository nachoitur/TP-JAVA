<%@page import="java.util.LinkedList" %>
<%@page import="entities.Usuario"%>
<%@page import="entities.Trabajo"%>
<%@page import="entities.Repuesto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Registro Trabajo</title>
	<link rel="stylesheet" href="style/styles.css">
    <link href="style/bootstrap.css" rel="stylesheet">
 
<% Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin"); %>
<% LinkedList<Repuesto> repuestos = (LinkedList<Repuesto>)request.getAttribute("repuestos"); %>

</head>
<body>
		<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
		<div class="container  ">
		<div <%= request.getAttribute("mensaje")==null ? "hidden": ""%> class="alert alert-danger alert-dismissible">
            <p><%= request.getAttribute("mensaje") %></p>
            <button type="button" class="close" data-dismiss="alert">
              <span>x</span>
            </button>
   		 </div>      
		<h1 class="text-center mt-2">Registro Trabajo</h1>

		<form action="ABMCTrabajo" method="post" class="form-registro ">
		<input type="hidden" class="custom-control-input" name="optionBM" value="alta">
		<input type="hidden" class="custom-control-input" name="bandera" value="añadido">
		<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">

			<div class="form-group">
				<label for="selectTipoTrabajo">Tipo Trabajo</label>
				<select class="form-select" name="selectTipoTrabajo">
					<option selected> Seleccione uno</option>
					<option value="Mantenimiento">Mantenimiento</option>
					<option value="Reparaciones Menores">Reparaciones Menores</option>
					<option value="Trabajos Mayores">Trabajos Mayores</option>
					<option value="Tren Motriz">Tren Motriz</option>
					<option value="Trabajo Completo">Trabajo Completo</option>
					<option value="Electrónica">Electrónica</option>
				</select>
			</div>
			
			<div class="form-group row ">
				<label for="descripcion" class="col-2"> Descripción: </label>
				<input id="descripcion" name="descripcion" class="form-control col-8"  type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="cdo" class="col-2"> Costo mano de obra: </label>
				<input id="cdo" name="cdo" class="form-control col-8"  type="number" step="any" required>
			</div>
			
            <div class="form-group">
                <label for="repuesto">Repuestos que utiliza: </label>
                <select id="repuesto" class="form-select">
                    <% for (Repuesto r : repuestos) { %>
                        <option value="<%= r.getId_repuesto() %>" data-precio="<%= r.getPrecio() %>"><%= r.getDescripcion() %></option>
                    <% } %>
                </select>
                <button type="button" id="agregarRepuesto" class="btn btn-primary mt-2">Agregar Repuesto</button>
                <input type="hidden" id="repuestosSeleccionados" name="repuestosSeleccionados">
                <ul id="listaRepuestos" class="mt-2"></ul>
            </div>
			
			<div class="col-auto">
				<input type="hidden" class="custom-control-input" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
      			<button type="submit" class="btn btn-primary mb-2">Registrar</button>
    		</div>
		</form>
	</div>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const repuestoSelect = document.getElementById("repuesto");
    const agregarRepuestoBtn = document.getElementById("agregarRepuesto");
    const listaRepuestos = document.getElementById("listaRepuestos");
    const submitBtn = document.getElementById("submitBtn");

    // Agregar repuesto a la lista
    agregarRepuestoBtn.addEventListener("click", function () {
    	let selectedIndex = repuestoSelect.selectedIndex;
        
    	// Verificar si se seleccionó una opción válida
    	if (selectedIndex === -1) {
        	alert("Por favor, seleccione un repuesto antes de agregarlo.");
            return;
        }
     
        let selectedOption = repuestoSelect.options[repuestoSelect.selectedIndex];
        
        if (!selectedOption || !selectedOption.textContent.trim()) {
            alert("Error: No se pudo obtener la descripción del repuesto.");
            return;
        }

        let descripcion = selectedOption.innerText.trim();        
        let precio = parseFloat(selectedOption.getAttribute("data-precio")) || 0;

        // Crear elemento <li> con contenido visible
        let li = document.createElement("li");
        li.textContent = "Repuesto: " + descripcion + " || Precio repuesto: $" + precio.toFixed(2);

        let eliminarBtn = document.createElement("button");
        eliminarBtn.textContent = "X";
        eliminarBtn.classList.add("btn", "btn-danger", "btn-sm", "ms-2");

        li.appendChild(eliminarBtn);
        listaRepuestos.appendChild(li);
        
     	// Agregar la descripción al input oculto
        let repuestosInput = document.getElementById("repuestosSeleccionados");
        let repuestosArray = repuestosInput.value ? repuestosInput.value.split(",") : [];
        repuestosArray.push(descripcion);
        repuestosInput.value = repuestosArray.join(",");

        // Evento para eliminar trabajo agregado
        eliminarBtn.addEventListener("click", function () {
            li.remove();
        });
    });
});
</script>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  
</body>
</html>