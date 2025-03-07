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

Un usuario si es la primera vez que ingresa al sistema será como invitado que solo tiene acceso a la página principal y a las pestañas del inicio que no requieran de un login. En la página principal podrá visualizar los tipos de trabajo que se realizan, cómo se trabajan con los turnos en el taller y servicios que se ofrecen. En caso de tener una cuenta en el sistema, podrá loguearse en el mismo y, caso contrario, registrarse. Al registrarse deberá proporcionar sus datos. Una vez logueado tendrá acceso al menú de usuarios en el cual puede registrar su vehículo, sacar un turno y ver los trabajos realizados a su vehiculo.

El mecánico tendrá acceso al menú de administrador en el cual puede ver vehículos y clientes registrados, los trabajos que se estén realizando, valores de repuestos y más. También podrá Crear, Modificar o Eliminar Usuarios, Vehículos, Repuestos, Turnos y Trabajos. Podrá hacer consultas de cada entidad con sus respectivos listados.



## Requerimientos

|Requerimiento|Cantidad|Detalle/Listado de casos incluidos|
|:-|-:|:-|
|ABMC|todos|Usuario<br>Vehículo<br>Turno<br>Trabajo<br>Repuesto
|CU "Complejo"(nivel resumen)|1|Realización del trabajo mecánico:<br>Sacar turno<br>Ingreso del vehículo<br>Realización del trabajo<br>Retiro del vehículo
|Listado complejo|1| Listado de todos los trabajos de un tipo realizados a un vehículo.
|Nivel de acceso|3| Invitado<br>Usuario<br>Mecánico (Administrador)
|Manejo de errores|obligatorio|||
|requerimiento extra obligatorio|1|Envío de emails|
|publicar el sitio|obligatorio (Suspendido)|||



## Notas adicionales / Críticas constructivas
Estas son notas para dejar constancia de cosas que fui dandome cuenta al programar, son más cuestiones de contrucción del modelo más que de otra cosa.
La clase Turno no debería tener como clave principal también al atributo "Hora" pues es indistinto si dos vehículos sacan turno a la misma hora y un vehículo, normalmente, un vehículo no va a sacar dos turnos para un mismo día.
La clase Vehículo podría no llevar un ID ya que el identificador más común es la patente. Raro sería el caso en el que dos vehículos tengan la misma patente.
