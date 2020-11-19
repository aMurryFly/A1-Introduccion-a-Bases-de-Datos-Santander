## Sesión 5: Consultas en MongoDB


### General

- Los resultados en json obtenidos tras realizar las consultas se encuentran en los archivos ".json" de la parte inferior 
- También se incluyen algunas capturas de pantalla de los respectivos retos  


### RETO 1 :rocket:

1.1 Con base en el ejemplo 1, modifica el agrupamiento para que muestre el costo promedio por habitación por país de las propiedades de tipo casa.
   ```json 
        [{$match: {
        property_type: 'House',
        bedrooms: {$gte: 1}
        }}, {$addFields: {
        costo_recamara: {$divide: ["$price", "$bedrooms"]}
        }}, {$group: {
        _id: "$address.country",
        recamaras: {
            $sum: 1
        },
        total: {
            $sum: "$costo_recamara"
        }
        }}, {$addFields: {
        pais: "$_id",
        costo_promedio: {$divide: ["$total", "$recamaras"]}
        }}, {$project: {
        _id:0,
        pais:1,
        costo_promedio:1
        }}]
   ```

[Reto 1: Python code](https://github.com/aMurryFly/A1-Introduccion-a-Bases-de-Datos-Santander/blob/main/Sesion-06/retoClase/reto1.py)



### RETO 2 :rocket:

2.1 Usando las colecciones comments y users, se requiere conocer el correo y contraseña de cada persona que realizó un comentario. Construye un pipeline que genere como resultado estos datos.

   ```json 
        [{$lookup: {
        from: 'users',
        localField: 'name',
        foreignField: 'name',
        as: 'usuario'
        }}, {$addFields: {
        user_Aux: {
            $arrayElemAt: ["$usuario", 0]
        }
        }}, {$addFields: {
        user_Pass: "$user_Aux.password"
        }}, {$project: {
        _id:0,
        name:1,
        email:1,
        user_Pass:1
        }}]
   ```

[Reto 2: Python code](https://github.com/aMurryFly/A1-Introduccion-a-Bases-de-Datos-Santander/blob/main/Sesion-06/retoClase/reto2.py)



### RETO 3 :rocket:

3.1 El resultado de la viste se puede ver en la imagen adjunta
[Imagen here](https://github.com/aMurryFly/A1-Introduccion-a-Bases-de-Datos-Santander/tree/main/Sesion-06//retosClase/reto3.png)


