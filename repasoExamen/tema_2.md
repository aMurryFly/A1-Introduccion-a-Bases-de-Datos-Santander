# agrupaciones y subconsultas

## PREWORK

- Expresiones regulares con LIKE

    % Caza con cualquier cadena, de cualquier longitud, incluso cadenas vacías.
    _ Caza con un único carácter.


- Funciones de agrupamiento 
    1. SUM suma todos los valores de una columna
    2. COUNT cuenta los valores de una columna
    3. MIN obtiene el valor mínimo de una columna
    4. MAX obtiene el valor máximo de una columna
    5. AVG obtiene el promedio de los valores de una columna

-  AS nos permite agregar un alias a la columna 
```sql 
    SELECT sum(salario) AS “Salario Total”
    FROM empleados
    WHERE salario > 5000;
```

(Link para funciones)[https://www.techonthenet.com/mysql/functions/] 


- GROUP BY 
indica los campos por los cuales se realizará el agrupamiento. Los campos por los cuales se agrupará, deben aparecer en la consulta y debe haber al menos una función de agrupamiento proyectada.

- Subconsulta
Una subconsulta consiste de consultas que incluyen otras consultas en su interior. Una subconsulta puede aparecer en la parte SELECT, en la parte FROM o en la parte WHERE de una consulta. 

```sql 
SELECT nombre, correo
FROM contactos
WHERE direccion IN 
       (SELECT direccion
        FROM ubicaciones
        WHERE codigo_postal = ‘01060’);
```

```sql 
SELECT (Calificacion / Alumnos) AS “Promedio”
FROM 
   (SELECT sum(calif) AS “Calificacion”, count(*) AS “Alumnos”
    FROM alumnos) AS subconsulta;
```

## WORK

(Ejercicios)[https://github.com/aMurryFly/A1-Introduccion-a-Bases-de-Datos-Santander/blob/main/Sesion-02/Ejercicios/retos.sql]

