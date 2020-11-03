#### EJERCICIOS SESIÓN 2 

#General instructions
show databases;
# use tienda;
use classicmodels;
show tables;

#### EJERCICIO 1
# Dentro de la tabla employees, obten el número de empleado, apellido y 
# nombre de todos los empleados cuyo nombre empiece con a.

select employeeNumber, lastName, firstName from employees where firstName like 'a%';


#### EJERCICIO 2
# Dentro de la tabla employees, obten el número de empleado, apellido y 
# nombre de todos los empleados cuyo nombre termina con on.

select employeeNumber, lastName, firstName from employees where firstName like '%on';


#### EJERCICIO 3
# Dentro de la tabla employees, obten el número de empleado, apellido y 
# nombre de todos los empleados cuyo nombre incluye la cadena on.

select employeeNumber, lastName, firstName from employees where firstName like '%on%';



#### EJERCICIO 4
# Dentro de la tabla employees, obten el número de empleado, apellido y 
# nombre de todos los empleados cuyos nombres tienen tres letras e inician 
# con T y finalizan con m.

select employeeNumber, lastName, firstName from employees where firstName like 't_m';



#### EJERCICIO 5
# Dentro de la tabla employees, obten el número de empleado, apellido y 
# nombre de todos los empleados cuyo nombre no inicia con B.

select employeeNumber, lastName, firstName from employees where firstName not like  'b%';


#### EJERCICIO 6
# Dentro de la tabla products, obten el código de producto y nombre de 
# los productos cuyo código incluye la cadena _20.

select productCode, productName  from products where productCode like '%\_20%'; #Escapamos el guiíon bajo


#### EJERCICIO 7
# Dentro de la tabla orderdetails, obten el total de cada orden.

select orderNumber, (priceEach * quantityOrdered) as total from orderdetails ;


#### EJERCICIO 8
# Dentro de la tabla orders obten el número de órdenes por año.

select year(orderDate) , count(*) from orders group by year(orderDate);


#### EJERCICIO 9
# Obten el apellido y nombre de los empleados cuya oficina está ubicada en USA.

select lastName, firstName from employees 
where officeCode IN (select officeCode from offices where country = 'USA');


#### EJERCICIO 10
# Obten el número de cliente, número de cheque y cantidad del cliente que ha realizado el pago más alto.

select customerNumber, checkNumber, amount from payments where  amount= (select  max(amount) from  payments);  



#### EJERCICIO 11
# Obten el número de cliente, número de cheque y cantidad de aquellos clientes cuyo pago es más alto que el promedio.

select customerNumber, checkNumber, amount from payments where  amount > (select  avg(amount) from  payments);  


#### EJERCICIO 12
# Obten el nombre de aquellos clientes que no han hecho ninguna orden.

select customerName from customers where customerNumber NOT IN (select customerNumber from orders );


#### EJERCICIO 13 <= cómo se conecta order con products? :/ o a qué se refiere ese ejercicio
# Obten el máximo, mínimo y promedio del número de productos en las órdenes de venta.

select max(quantityOrdered) as maximo, avg(quantityOrdered) as promedio, min(quantityOrdered)as minimo  from orderdetails;
 
 
# #### EJERCICIO 14
# Dentro de la tabla orders, obten el número de órdenes que hay por cada estado.

select status, count(*) from orders group by status ;


