# Session 1

#### PRevio para empezar

#show databases;
use Tienda;

##### RETO 1
#1) ¿Qué artículos incluyen la palabra Pasta en su nombre?
select * from articulo where nombre like '%PASTA%';

#2) ¿Qué artículos incluyen la palabra Cannelloni en su nombre?
select * from articulo where nombre like '%Cannelloni%';

#3) ¿Qué nombres están separados por un guión (-) por ejemplo Puree - Kiwi?
select * from articulo where nombre like '% - %';#Espacios considerados

#4) ¿Qué puestos incluyen la palabra Designer?
select * from puesto where nombre like "%Designer%";

#5) ¿Qué puestos incluyen la palabra Developer?
select * from puesto where nombre like "%Developer%";


##### RETO 2

# 1) ¿Cuál es el promedio de salario de los puestos?
select avg(salario) from puesto;

# 2) ¿Cuántos artículos incluyen la palabra Pasta en su nombre?
select count(*) from articulo where  nombre like '%pasta%';

# 3) ¿Cuál es el salario mínimo y máximo?
select min(salario), max(salario) from  puesto;

# 4) ¿Cuál es la suma del salario de los últimos cinco puestos agregados?
# La solución dada en su github está mal :/ , considera un caso más

select sum(salario) from (
    select salario
    from puesto
    order by id_puesto desc
    limit 5
) salarios;


##### RETO 3

# ¿Cuántos registros hay por cada uno de los puestos?
select nombre, count(*) from puesto
group by nombre;

# ¿Cuánto dinero se paga en total por puesto?
select nombre, sum(salario) as pago
from puesto group by nombre;


# ¿Cuál es el número total de ventas por vendedor?
select id_empleado, count(clave) AS ventas
from venta
group by id_empleado;

# ¿Cuál es el número total de ventas por artículo?
select id_articulo, count(*)
from venta group by id_articulo;





