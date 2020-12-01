# Consultas en Mongo



## PREWORK 


### Expresiones regulares

- Expresiones regulares
Una expresión regular es una cadena que describe un patrón de caracteres. Se basan en la técnica de búsqueda de patrones a partir de una cadena de texto, en este caso almacenada en un documento.


1. Dada una colección de usuarios, obtener todos los documentos que contienen el nombre “Pepito”, realizar la búsqueda ignorando mayúsculas y minúsculas.
```json 
{nombre: “/Pepito/i”}
```
**En este caso, se ignora si “Pepito” tiene mayúsculas o minúsculas**


2. Dada una colección de direcciones, obtener todos los documentos que finalizan con 06.
```json 
{cp: “06$”}
```
**El símbolo $ indica el final de una línea.**


3. Dada una colección de direcciones, obtener todos los documentos que inician con 06.
```json 
{cp: “^06”}
```
**El símbolo ^ indica el inicio de una línea.**


4. Dada una colección de direcciones, obtener todos los documentos que incluyen un 06 en alguna parte.
```json 
{cp: “.*06.*”}
```
**El símbolo .* indica que en ese espacio puede haber cualquier cadena.**


**El símbolo . indica cualquier cadena**

* = 0, 1 o muchos 
+ = 1 o muchos 

5. Palabra que comience con "P", termine con o  y que tenga 5 letras en total

```regex 
/\bP.{3}o\b/ 
```

```regex 
/\bP...o\b/
```

### Agregaciones


De la misma forma en que hacíamos subconsultas en SQL, es posible utilizar los resultados de otras consultas dentro de Mongo. 


Las agregaciones son divididas por lo que se conoce como capa. Cada capa puede ver las columnas de la capa anterior y en cada paso se genera una nueva colección con los resultados correspondientes.


### Objetos anidados

Existen documentos que pueden tener objetos anidados


```json 
{“contacto.telefono” = 1}
```



## WORK 



### Expresiones regulares

[Expresiones regulares](https://github.com/aMurryFly/A1-Introduccion-a-Bases-de-Datos-Santander/tree/main/Sesion-05/retosClass)


### Objetos (Notación punto)


Agrega un filtro que permita obtener todas las publicaciones que tengan 50 o más comentarios, que la valoración sea mayor o igual a 80, que cuenten con conexión a Internet vía cable y estén ubicada en Brazil.

{
    number_of_reviews: {$gte: 50}, 
    "review_scores.review_scores_rating": {$gte: 80}, 
    amenities: {$in: [/Ethernet/i]}, 
    "address.country_code": "BR" 
}


[Operadores en objetos](https://docs.mongodb.com/manual/reference/operator/query/in/)

[Agregaciones ejemplos](https://github.com/beduExpert/A1-Introduccion-a-Bases-de-Datos-Santander/blob/main/Sesion-05/Ejemplo-03/Readme.md)


[Ejercicio ](https://github.com/beduExpert/A1-Introduccion-a-Bases-de-Datos-Santander/blob/main/Sesion-05/Reto-03/Readme.md)

NOTAS:


- count (Sólo comillas al campo a contar)
```json 
"total"
```

- group (Siempre id nulo y hacer una columna nueva para realizar operación)
```json 
{
   _id: null,
   total: {
      $sum: 1
   }
}
```



