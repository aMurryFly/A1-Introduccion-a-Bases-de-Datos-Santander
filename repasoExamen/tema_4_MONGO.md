# Fundamentos de MONGO

## PREWORK - NO CHIDO 


Las bases de datos no relacionales están diseñadas para modelos específicos y no tienen un lenguaje de consulta en común, son llamadas en ocasiones, bases de datos NoSQL.

no existe una estructura común para el almacenamiento (tablas), la estructura de datos se va generando conforme se van insertando valores.

### Bases de datos orientada a documentos 

- Este tipo de base de datos se basan en la definición de lo que se conoce como Documento que sigue un formato específico.

- Los formatos más utilizados son JSON y BSON.

- Cada **documento** es similar a un registro en una base de datos relacional

- Al usar JSON se usa un modelo llave/valor. Esto es equivalente al valor de una columna en una base de datos relacional.

### Bases de datos orientadas a llave/valor

la diferencia respecto a la de documentos es que estos documentos se almacenan en una llave, con la cual puede recuperarse el documento.

### Bases de Datos Orientadas a Gráficas

Este tipo de bases de datos tratan los datos mediante lo que se conoce en matemáticas como gráfica y se manipulan según dicta la Teoría de Gráficas.

- Ejemplos y tipos de datos
    - Orientadas a documentos
        1. MongoDB
        2. CouchDB
        3. RavenDB

    - Orientadas a llave valor
        1. Apache Cassandra
        2. Riak
        3. Redis

    - Orientadas a gráficas
        1. NEO4J
        2. Dex
        3. Sones GraphDB


### Conexión a BD

1. La dirección del servidor, también llamada host.
2. El usuario con el cual nos vamos a conectar.
3. Una contraseña de acceso y el puerto a través del cual realizaremos la conexión.


## PREWORK - CHIDO


### MONGO DB 

- MongoDB 
Es un Gestor de Bases de Datos no relacionales orientado a documentos que también hace uso de la orientación llave/valor

Su nombre proviene del inglés humongous y usa el formato BSON (JSON compilador) para almacenar datos.

- JSON 
Es un formato compacto de representación de objetos. Es un formato de intercambio de información y su uso nació del lenguaje JavaScript.

- Documento

Es un conjunto de datos semiestructurados, que contienen parejas de la forma llave/valor, usando BSON como formato de almacenamiento.

- Colección
Es un conjunto de documentos.


Comparación de esta terminología con BD relacionales:

1. Tabla -> Colección

2. Registro -> Documento

3. Columna -> Llave

### JSON

Para representar documentos se hace uso de JSON.

- Objetos. 
Son conjuntos desordenados de pares llave/valor. 
Cada objeto inicia con una llave que abre { y finaliza con una llave que cierra }. 

- Valores. 
Pueden ser cadenas, números, booleanos, null, objetos o arreglos. 
Estos pueden anidarse.Cada par se separa con una coma.

- Arreglos. 
Son una colección de valores. 
Comienzan con un corchete izquierdo [ y finalizan con un corchete derecho ]. 
Cada valor se separa por una coma.

```json 
    {
    id: 1,
    nombre: “Bulbasaur”,
    tipo: [“Hierba”, “Venenoso”]
    }
```


## WORK 

- PUERTO 27017


[LINK GENERAL](https://github.com/beduExpert/A1-Introduccion-a-Bases-de-Datos-Santander/tree/main/Sesion-04)


- Select * from tabla;

1. Fecha, nombre y texto de cada comentario.

```json 
    {
        date:1, name:1, text:1
    }
```

2. Nombre y contraseña de cada usuario.
```json 
    {name:1, password:1}	
```


- Filtros 

1. ¿Qué comentarios ha hecho Greg Powell?

```json 
    {name: "Greg Powell"}	
```


2. ¿Qué comentarios han hecho Greg Powell o Mercedes Tyler?
```json
{$or: 
    [
        {name: "Greg Powell"}, 
        {name: "Mercedes Tyler"}
    ]
}
```

- Project 
Sirve para solo mostrar la información que se pide (Es mostrar sólo un atributo)

- Sort
Ordenar información 1 = ascendente 

- Limit 


[Ejemplos e imágenes ](https://github.com/beduExpert/A1-Introduccion-a-Bases-de-Datos-Santander/blob/main/Sesion-04/Reto-02/Readme.md)

