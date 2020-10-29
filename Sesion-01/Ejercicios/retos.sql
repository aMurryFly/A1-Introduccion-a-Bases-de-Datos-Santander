# Retos de la clase:

show databases;

use Tienda;

########## RETO 1:  

#Ver que contienen las tablas y sus tipos de datos dentro de estas
show tables;
describe articulo;
describe empelado;
describe puesto;
describe venta;

# NOTA: Los tipos de datos principales son int, varchar y timestamp para fechas 

########## RETO 2:  

# 2.1) ¿Qué puestos tienen un salario mayor a $10,000?
select * from puesto where salario > 10000;

# 2.2 ¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los empleados 835 o 369?
select * from venta where id_empleado IN (835,369) and id_articulo IN (135,963);

# 2.3 ¿Cuál es el nombre de los empleados con el puesto 4?
select nombre from empleado where id_puesto = 4;

########## RETO 3:  

# Para contestar a esta pregunta, basta con ordenar las calificaciones del alumno en orden 
# descendente y limitar el número de registros a 5.
select * from puesto
order by salario desc limit 5;

# NOTA: Este reto no se dejó en clase pero igual comparto mi solución:
# NOTA2: La solución dada en el repo de Bedu está mal 
