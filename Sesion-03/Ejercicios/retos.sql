# Retos en clase 

#General
show databases;
use tienda;
show tables;

########### [ Reto 1: Subconsultas ] ###########

#1) ¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
select nombre, apellido_paterno from empleado
where id_puesto IN
(
	  select id_puesto from puesto
      where salario > 10000
);
#Nota, debería ser mayor a 10 mil a menos de que quieran como resultado 0



#2)  ¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
select id_empleado, min(total), max(total)
from
	(
    select  id_empleado, clave, count(*) as total
    from venta
    group by id_empleado, clave
    )as sq
group by id_empleado;     

#3)  ¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
select clave, id_articulo from venta
 where id_articulo IN (
	select id_articulo from
	articulo where precio > 5000);



########### [ Reto 2: Subconsultas ] ###########

#2.1) ¿Cuál es el nombre de los empleados que realizaron cada venta?
select clave, nombre, apellido_paterno from venta as v
join empleado as e
on v.id_empleado = e.id_empleado
order by clave;

#2.2)  ¿Cuál es el nombre de los artículos que se han vendido?
select clave, nombre from venta as v
join articulo as a
on v.id_articulo = a.id_articulo
order by clave;


#2.3) ¿Cuál es el total de cada venta?
select clave, sum(precio) as total
from venta as v
join articulo as a
on v.id_articulo = a.id_articulo
group by clave;


########### [ Reto 3:  Definición de vistas ] ###########

#3.1) Obtener el puesto de un empleado.
#drop view jobs;

create view jobs as
	select concat(e.nombre, ' ', e.apellido_paterno) as fullname , p.nombre as puesto
	from empleado e
	join puesto p
	on e.id_puesto = p.id_puesto;

select * from jobs;

#3.2) Saber qué artículos ha vendido cada empleado.
#NOTA: Ver esquema/diagrama Entidad relación para los joins
drop view emp_art;
create view emp_art as
	select v.clave, concat(e.nombre, ' ', e.apellido_paterno) as fullname, a.nombre as articulo
	from venta v
	join empleado e
	  on v.id_empleado = e.id_empleado
	join articulo a
	  on v.id_articulo = a.id_articulo;

select * from emp_art;

#3.3) Saber qué puesto ha tenido más ventas.

create view pst_vnt as
	select p.nombre, count(v.clave) total_ventas
	from venta v
	join empleado e
	  on v.id_empleado = e.id_empleado
	join puesto p
	  on e.id_puesto = p.id_puesto
	group by p.nombre;

select * from  pst_vnt;
#Para conocer a la persona con más ventas
select * from  pst_vnt order by total_ventas desc limit 1;

