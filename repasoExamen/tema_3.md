# JOINS y vistas

## PREWORK 

- LLave primaria
Una llave primaria permite identificar de manera única cada uno de los registros de una tabla.


- LLave Foránea
Representan justamente la relación que pudiera haber entre dos tablas. 
Cuando una tabla almacena la llave primaria de otra tabla, llamamos a esta llave foránea.

- La forma en la que SQL evita esta duplicidad de datos, es justamente con el uso de llaves. 



### Tipos de relaciones

- Uno a muchos (Whut xd ?)

Esta forma de relacionar tablas da pie a distintas formas de relacionarlas


- Muchos a muchos

Este tipo de relación permite unir dos tablas que en un principio no tienen relación directa. 
=> Lo que se hace en este tipo de casos es crear una tabla intermedia que funciona como la unión de dos tablas.


- Uno a uno

Este es el tipo de relación que menos se utiliza, pues quiere decir que ninguna tabla puede repetir registros de la otra. De esta forma, ambas tablas podrían combinarse en una sola. 

Son creadas con fines muy específicos a partir del contexto en el que fueron creadas, pero son muy poco comunes. 

### JOINS

- JOIN 

Un join, relaciona dos tablas, trayendo todos los campos de éstas siempre y cuando se cumpla la condición 
de relación. Visualmente un join, luce así:


- Tipos de joins
    1. INNER JOIN (o simplemente JOIN)
    2. LEFT OUTER JOIN (o simplemente LEFT JOIN)
    3. RIGHT OUTER JOIN (o simplemente RIGHT JOIN)


### Vistas

- VISTAS
Una vista es la representación virtual de una consulta en formato de tabla o dicho de otro modo, es el resultado de guardar una consulta para poder tratarla como a cualquier otra tabla. 
Son útiles cuando el tiempo de procesamiento de una consulta es alto y por lo tanto no tenemos que ejecutarla una y otra vez pues estará disponible.

```sql 
CREATE VIEW duenios AS
   SELECT *
   FROM persona
   JOIN mascota
     ON persona.id = mascota.id_persona;
```



## WORK 

[Ejercicios](https://github.com/aMurryFly/A1-Introduccion-a-Bases-de-Datos-Santander/blob/main/Sesion-03/Ejercicios/retos.sql)










