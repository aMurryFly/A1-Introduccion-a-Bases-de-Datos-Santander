## Sesión 4: Fundamentos de Mongo DB


### 0. General

- Los resultados en json obtenidos tras realizar las consultas se encuentran en los archivos ".json" de la parte inferior 
- También se incluyen algunas capturas de pantalla de los respectivos retos 

### 1. RETO 1 :rocket:

1.1 Fecha, nombre y texto de cada comentario.

   ```json
   {date:1, name:1, text:1}
   ```

1.2 Título, elenco y año de cada película.

   ```json
   {title:1, cast:1, year:1}
   ```

1.3 Nombre y contraseña de cada usuario.

   ```json
   {name:1, password:1}	
   ```

Archivo JSON con resultados: [click here](https://github.com/aMurryFly/)

### 2. RETO 2 :rocket:

2.1 ¿Qué comentarios ha hecho Greg Powell?

   ```json
    {
        filter: {
        name: 'Greg Powell'
        }
    }
   ```

2.2 ¿Qué comentarios han hecho Greg Powell o Mercedes Tyler?

   ```json
   {
        filter: {
        $or: [
            {
                name: 'Greg Powell'
                },
                {
                    name: 'Mercedes Tyler'
            }
            ]
        }
    }
   ```

2.3 ¿Cuál es el máximo número de comentarios en una película?

   ```json
   {
        project: {
        num_mflix_comments: 1
        },
        sort: {
        num_mflix_comments: -1
        },
        limit: 1
    }
   ```

2.4 ¿Cuál es título de las cinco películas más comentadas?

   ```json
   {
        project: {
        title: 1,
        num_mflix_comments: 1
        },
        sort: {
        num_mflix_comments: -1
        },
        limit: 5
    }
   ```

Archivo JSON con resultados: [click here](https://github.com/aMurryFly/)

