# Repaso tema 1


## PREWORK 

- Dato 
Un dato es considerado la unidad mínima de información. 
Por sí mismo no provee un significado particular, simplemente es un ente que requiere de una interpretación para dar lugar a la información.


- Información 
Es un conjunto de datos que a través del procesamiento adecuado adquieren un significado


- Base de datos 
Es un conjunto de datos con alguna característica en común
Las bases de datos relacionales se basan en el Modelo relacional, propuesto por Edgar F. Codd en los años setenta. 


- Tabla 
Una tabla o relación es una entidad con atributos, campos o columnas y tuplas, registros o renglones. 
Una tabla representa a un número indefinido de elementos descritos con características en común, cada uno en un diferente renglón.

- Registros 
Los registros, también llamados tuplas o renglones, se refieren a la descripción de cada ente de la tabla. Son instancias particulares, por ejemplo, si tenemos una tabla Persona, un registro contendrá los datos particulares de una persona.

- Campo 
Los campos o atributos se refieren a las columnas de las tablas y representan una característica particular de cada entidad.



- Dominio 
El dominio se refiere al número de valores que puede obtener una columna, por ejemplo si tuviéramos un campo para almacenar el estado civil, su dominio sería 2 en el caso de tener los valores soltero o casado.

- Cardinalidad (ESTA DEFINICIÓN ESTA MAL XD )
Es el número de registros que tiene una tabla.
=> Número de entidades con la cual otra entidad se puede relacionar 

- Grado 
Es el número de campos que tiene una tabla.

- SGBD / Sistema Gestor de Bases de Bases de Datos
Permite diseñar, crear y administrar en general bases de datos relacionales


- Ejemplos de SGDB  - Relacionales
    Oracle Database
    MySQL
    MariaDB
    PostgreSQL
    Microsoft SQL Server


### Conexión a BD 

A los servidores que almacenan bases de datos se les llama Servidores de Bases de Datos (duh!). Para conectarnos a un servidor, necesitamos de cuatro cosas esenciales:

1. La dirección del servidor, también llamada host.
2. El usuario con el cual nos vamos a conectar.
3. Una contraseña de acceso.
4. Y el puerto a través del cual realizaremos la conexión.

Puerto MYSQL - 3306


## WORK

- ¿Qué ventas incluyen los artículo 135 o 963 y fueron hechas por los empleados 835 o 369?

```sql 
    SELECT *
    FROM venta
    WHERE id_articulo IN (135,963)
    AND id_empleado IN (835,369);
```

- Para contestar a esta pregunta, basta con ordenar las calificaciones del alumno en orden descendente y limitar el número de registros a 5.

```sql 
    SELECT *
    FROM tienda
    ORDER BY salario DESC
    LIMIT 5;
```





