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

### objetos anidados

Existen documentos que pueden tener objetos anidados


```json 
{“contacto.telefono” = 1}
```















