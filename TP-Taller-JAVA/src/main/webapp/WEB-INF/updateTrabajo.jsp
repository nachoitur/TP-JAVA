<%@page import="java.util.LinkedList" %>
<%@page import="entities.Usuario"%>
<%@page import="entities.Trabajo"%>
<%@page import="entities.Repuesto"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Actualizar Trabajo</title>
	<link href="style/bootstrap.css" rel="stylesheet">
<%
 	Usuario userLogin =(Usuario)session.getAttribute("usuarioLogin");
	Trabajo t =(Trabajo)request.getAttribute("trabajo");
	LinkedList<Repuesto> repuestos = (LinkedList<Repuesto>)request.getAttribute("repuestos");
 %>
</head>
<body>
	<%@ include file="/WEB-INF/MenuContextualAdmin.jsp"%>
	<div class="container">
	
	<h1>Modificacion</h1>
	<h3>Trabajo a modificar: <%=t.getDescripcion()%></h3>
	
	<form action="ABMCTrabajo" method="post">
		<input type="hidden" name="optionBM" value="modificacion">
        <input type="hidden" class="custom-control-input" name="bandera" value="modificado">
        <input type="hidden" name="idUserLogin" value="<%=userLogin.getId_usuario()%>">
        <input type="hidden" class="custom-control-input"  name="idTrabajo" value="<%=t.getId_trabajo()%>">
	
			<div class="form-group">
				<label for="selectTipoTrabajo">Tipo Trabajo</label>
				<select class="form-select" name="selectTipoTrabajo">
					<option value="Mantenimiento" <%=t.getTipo_trabajo().equals("Mantenimiento") ? "selected" : ""%>>Mantenimiento</option>
					<option value="Reparaciones Menores" <%=t.getTipo_trabajo().equals("Reparaciones Menores") ? "selected" : ""%>>Reparaciones Menores</option>
					<option value="Trabajos Mayores" <%=t.getTipo_trabajo().equals("Trabajos Mayores") ? "selected" : ""%>>Trabajos Mayores</option>
					<option value="Tren Motriz" <%=t.getTipo_trabajo().equals("Tren Motriz") ? "selected" : ""%>>Tren Motriz</option>
					<option value="Trabajo Completo" <%=t.getTipo_trabajo().equals("Trabajo Completo") ? "selected" : ""%>>Trabajo Completo</option>
					<option value="Electrónica" <%=t.getTipo_trabajo().equals("Electrónica]") ? "selected" : ""%>>Electrónica</option>
				</select>
			</div>
			
			<div class="form-group row ">
				<label for="inputDescripcion" class="col-2"> Descripción</label>
				<input id="inputDescripcion" name="inputDescripcion" class="form-control col-8" placeholder="<%=t.getDescripcion()%>" value="<%=t.getDescripcion()%>" type="text" required>
			</div>
			
			<div class="form-group row ">
				<label for="inputPrecio" class="col-2">Costo Mano de Obra: </label>
				<input id="inputPrecio" name="inputPrecio" class="form-control col-8" placeholder="<%=t.getCosto_mdo()%>" value="<%=t.getCosto_mdo()%>" type="number" step="any" required>
			</div>
			
			<!-- Repuestos -->
            <div class="form-group">
                <label for="repuesto">Repuestos del trabajo: </label>
                <select id="repuesto" class="form-select">
                    <% for (Repuesto r : repuestos) { %>
                        <option value="<%= r.getId_repuesto() %>" data-precio="<%= r.getPrecio() %>" data-stock="<%= r.getStock() %>>"><%= r.getDescripcion() %></option>
                    <% } %>
                </select>
                <button type="button" id="agregarRepuesto" class="btn btn-primary mt-2">Agregar Repuesto</button>
                <input type="hidden" id="repuestosSeleccionados" name="repuestosSeleccionados">
            </div>
            
        <!-- Lista de repuestos seleccionados -->
			<ul id="listaRepuestos" class="list-group mt-3">
    			<% for (Repuesto r : t.getRepuestos()) { %>
        			<li class="list-group-item" data-repuesto-id="<%= r.getId_repuesto() %>" data-precio="<%= t.getCosto_mdo()%>" data-repuestos="<%= t.getTotalRepuestos()%>">
            			<span class="repuesto-descripcion"><%= r.getDescripcion()%> || Precio: $<%= r.getPrecio()%> || Stock: <%= r.getStock() %> </span>
            			<button type="button" class="btn btn-danger btn-sm float-end eliminarRepuesto">X</button>
            			<input type="hidden" name="repuestos[]" value="<%= r.getId_repuesto() %>">
        			</li>
    			<% } %>
			</ul>
	
	
		<div class="form-group">
			<button id="submitBtn" type="submit" class="btn btn-success">Guardar cambios</button>
	 	</div>
	 	
	 </form>
</div>
<script>
document.addEventListener("DOMContentLoaded", function () {
    const listaRepuestos = document.getElementById("listaRepuestos");
    const selectRepuesto = document.getElementById("repuesto");
    const btnAgregar = document.getElementById("agregarRepuesto");
    
    btnAgregar.addEventListener("click", function () {
        const selectedOption = selectRepuesto.options[selectRepuesto.selectedIndex];
        if (!selectedOption) return alert("Debe seleccionar un repuesto válido.");
        
        // Obtengo el id del repuesto
        const repuestoId = selectedOption.value;
        if ([...document.querySelectorAll("#listaRepuestos li")].some(li => li.getAttribute("data-repuesto-id") === repuestoId)) {
            return alert("Este repuesto ya está en la lista.");
        }

        // Creo el li
        const li = document.createElement("li");
        li.className = "list-group-item";
        li.setAttribute("data-repuesto-id", repuestoId);
        
        // Variables de precios y stock
        let precio = parseFloat(selectedOption.getAttribute("data-precio"));
        let stock = parseInt(selectedOption.getAttribute("data-stock"));
        
        li.setAttribute("data-precio", precio);
        li.setAttribute("data-stock", stock);
        
        // Lo que se muestra en pantalla cuando agrego un repuesto
        li.textContent = selectedOption.text + " || Precio: $" + precio.toFixed(2) + " || Stock: " + stock + " ";
        
        // Botón para eliminar los repuestos agregados
        const eliminarRepuesto = document.createElement("button");
        eliminarRepuesto.textContent = "X";
        eliminarRepuesto.classList.add("btn", "btn-danger", "btn-sm", "ms-2", "eliminarRepuesto");
        li.appendChild(eliminarRepuesto);
        
     	// Creo el input hidden para enviar los repuestos agregados al servidor
        const inputHidden = document.createElement("input");
        inputHidden.type = "hidden";
        inputHidden.name = "repuestos[]";
        inputHidden.value = repuestoId;
        li.appendChild(inputHidden);
        
        // Agrego el repuesto a la lista
        listaRepuestos.appendChild(li);
    });
    
    // Acción de botón eliminarRepuesto
    document.getElementById("listaRepuestos").addEventListener("click", function (event) {
        if (event.target.classList.contains("eliminarRepuesto")) {
            const li = event.target.closest("li");
            if (li) {
                li.remove();
            }
        }
    });
});
</script>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  
</body>
</html>