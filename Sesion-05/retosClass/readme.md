## Sesión 5: Consultas en MongoDB


### General

- Los resultados en json obtenidos tras realizar las consultas se encuentran en los archivos ".json" de la parte inferior 
- También se incluyen algunas capturas de pantalla de los respectivos retos  


### RETO 1 :rocket:

1.1 Propiedades que no permitan fiestas.
   ```json 
         {
            house_rules: /No Parties/i
         }
   ```

1.2 Propiedades que admitan mascotas.
   ```json 
         {
            house_rules: /[^no] pets allowed/i
         }
   ```

1.3 Propiedades que no permitan fumadores.
   ```json 
         {
            house_rules: /no\sSmoking/i
         }	
   ```


1.4 Propiedades que no permitan fiestas ni fumadores.
   ```json 
         {
            house_rules: /(no smoking.*no parties)|(no parties.*no smoking)/i
         }
   ```


[Reto 1: link](https://github.com/aMurryFly/A1-Introduccion-a-Bases-de-Datos-Santander/tree/main/Sesion-05/retosClass/reto1.json)



### RETO 2 :rocket:

2.1 Usando la colección sample_airbnb.listingsAndReviews, agrega un filtro que permita obtener todas las publicaciones que tengan 50 o más comentarios, que la valoración sea mayor o igual a 80, que cuenten con conexión a Internet vía cable y estén ubicada en Brazil.

   ```json 
    {
        number_of_reviews: {$gte: 50}, 
        "review_scores.review_scores_rating": {$gte: 80}, 
        "amenities:" {$in: [/ethernet/i]}, 
        "address.country_code": "BR" 
    }
   ```

[Reto 2: link](https://github.com/aMurryFly/A1-Introduccion-a-Bases-de-Datos-Santander/tree/main/Sesion-05/retosClass/reto2.json)



### RETO 3 :rocket:

3.1 Usando la colección sample_airbnb.listingsAndReviews, mediante el uso de agregaciones, encontrar el número de publicaciones que tienen conexión a Internet, sea desde Wifi o desde cable (Ethernet).

 *Pendiente*

[Reto 3: link](https://github.com/aMurryFly/A1-Introduccion-a-Bases-de-Datos-Santander/tree/main/Sesion-05/retosClass/reto3.json)


