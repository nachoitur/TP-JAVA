<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="entities.Trabajo" %>
<%@ page import="logic.TrabajoLogic" %>
<%@ page import="java.util.LinkedList" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Trabajos</title>
    <link rel="stylesheet" href="style/styles.css">
    <link href="style/bootstrap.css" rel="stylesheet">
</head>
<body>
    <header class="p-3 bg-dark">
        <div class="container">
            <div class="d-flex flex-wrap align-items-center justify-content-between">
            	<a href="index.html" class="navbar-brand text-white">Taller Mecánico</a>
                <ul class="nav me-auto">
                    <li><a href="index.html" class="nav-link text-white">Inicio</a></li>
                    <li><a href="trabajos.jsp" class="nav-link text-secondary">Trabajos</a></li>
                    <li><a href="turnos.html" class="nav-link text-white">Turnos</a></li>
                    <li><a href="servicios.html" class="nav-link text-white">Servicios</a></li>
                </ul>
                <div class="text-end">
                    <a href="signin.jsp" class="btn btn-outline-light me-2">Iniciar Sesión</a>
                    <a href="registro.jsp" class="btn btn-warning">Registrarme</a>
                </div>
            </div>
        </div>
    </header>

    <main class="container mt-4">
        <h1 class="text-center">Lista de Trabajos que realizamos</h1>
        <p class="text-center">Aqui puedes visualizar todos los trabajos que nuestro taller mecánico se encarga de realizar</p>
        <hr>
        <div class="row">
            <%  
            	TrabajoLogic tl = new TrabajoLogic();
            	LinkedList<Trabajo> jobs = tl.getAll();
            	for (Trabajo t : jobs){
            %>
            <div class="col-md-4">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title"><%= t.getTipo_trabajo() %></h5>
                        <p class="card-text"><%=t.getDescripcion() %></p>
                    </div>
                </div>
            </div>
            <%  
				}
            %>
        </div>
    </main>
<footer class="bg-dark text-white text-center py-3">
    <p>&copy; 2025 Taller Mecánico. Todos los derechos reservados.</p>
</footer>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
