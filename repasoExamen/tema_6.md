# Agrupaciones, Lookups y vistas

## PREWOK

### Agrupamiento 

Nos permite aplicar una función a una columna en el caso de las tablas o al campo de una colección en el caso de los documentos. 

[Acomuladores u operadores sobre el group](https://docs.mongodb.com/manual/reference/operator/aggregation/group/)


### LOOKUP

En MongoDB no existe como tal la operación JOIN, sin embargo, podemos relacionar colecciones por sus campos usando un tipo de agregación llamado $lookup.

{
   from: <colección derecha>,
   localField: <campo de la colección izquierda>,
   foreignField: <campo de la colección derecha>,
   as: <arreglo de salida con los resultados>
}

## WORK 

### Funciones de agrupaciones 2 

- Group
```json 
{
  _id: null,
  costo_promedio: {$avg: "$costo_recamara"}
}
```

Para agrupar respecto a alguna propiedad o llave (RETO)


```json 
//Match
{
   property_type: "House",
   bedrooms: {$gte: 1}
}

//addfields
{
   costo_recamara: {
     $divide: ["$price", "$bedrooms"]
   }
}

//Group
{
  _id: "$address.country",
  costo_promedio: {$avg: "$costo_recamara"}
}
```

[Más ejemplos ](https://github.com/beduExpert/A1-Introduccion-a-Bases-de-Datos-Santander/blob/main/Sesion-06/Ejemplo-01/Readme.md)


### Lookups "JOINS"


1. Hacer el lookup

```json 
{
   from: <colección derecha>,
   localField: <campo de la colección izquierda>,
   foreignField: <campo de la colección derecha>,
   as: <arreglo de salida con los resultados>
}

{
  from: 'users',
  localField: 'name',
  foreignField: 'name',
  as: 'usuario'
}

```


2. Pasar a un objeto auxiliar (Extraer del arreglo)

```json 
{
  usuario_objeto: {$arrayElemAt: ["$usuario", 0]}
}
```


3. Extraer el dato en concreto

```json 
{
  usuario_password: "$usuario_objeto.password"
}
```

4. Ya lo que sea que te pida con agregraciones xd 

```json 
{
  _id:0,
  name:1,
  email:1,
  usuario_password:1 // columna auxiliar previa
}
```




