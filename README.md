# TP Final JAVA: Taller Mecánico
Repositorio para el trabajo práctico integrador de la materia JAVA

## Integrante

|Alumno|Legajo
|:-|-:|
|Iturburu Ignacio|46100|



## Alcance
Desarrollaré un sistema/aplicación web cliente-servidor en Java para taller mecánico. En el mismo al momento que uno ingresa a la página principal el usuario podrá ver las diferentes opciones que ofrece. Los niveles de accesos son: Invitado, Usuario, Mecánico (Rol Administrador).


_<b>Invitado (no requiere login).<br>
Usuario (alguien que ya se registró para reservar un turno o que ha sido atendido).<br>
Mecánico (será alguien con rol de administrador que tendrá permisos completos en la aplicación).</b>_

Un usuario si es la primera vez que ingresa al sistema será como invitado que solo tiene acceso a la página principal y a aquellas que no requieran el login. En la página principal podrá visualizar los tipos de trabajo que se realizan y turnos disponibles del taller. En caso de tener una cuenta en el sistema, podrá loguearse en el mismo y, caso contrario, registrarse. Al registrarse deberá proporcionar sus datos. Una vez logueado tendrá acceso al menú de usuarios en el cual puede registrar su vehículo, sacar un turno y más.

El mecánico tendrá acceso al menú de administrador en el cual puede ver vehículos y clientes registrados, los trabajos que se estén realizando, valores de repuestos y más. También podrá Crear, Modificar o Eliminar Usuarios, Vehículos, Repuestos, Turnos y más. Podrá hacer consultas de cada entidad con sus respectivos listados. Puede realizar el listado de trabajos de un mismo tipo realizado a algún vehículo.



## Requerimientos

|Requerimiento|Cantidad|Detalle/Listado de casos incluidos|
|:-|-:|:-|
|ABMC|todos|Usuario<br>Vehículo<br>Turno<br>Trabajo<br>Repuesto
|CU "Complejo"(nivel resumen)|1|Realización del trabajo mecánico:<br>Sacar turno<br>Ingreso del vehículo<br>Realización del trabajo<br>Retiro del vehículo
|Listado complejo|1| Listado de todos los trabajos de un tipo realizados a un vehículo.
|Nivel de acceso|3| Invitado<br>Usuario<br>Mecánico (Admninistrador)
|Manejo de errores|obligatorio|||
|requerimiento extra obligatorio|1|Envío de emails|
|publicar el sitio|olbigatorio|||


