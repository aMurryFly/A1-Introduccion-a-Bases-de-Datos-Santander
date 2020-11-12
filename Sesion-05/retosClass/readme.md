## Sesión 5: Consultas en MongoDB


### General

- Los resultados en json obtenidos tras realizar las consultas se encuentran en los archivos ".json" de la parte inferior 
- También se incluyen algunas capturas de pantalla de los respectivos retos  



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

[Reto 1: link](https://github.com/aMurryFly/A1-Introduccion-a-Bases-de-Datos-Santander/tree/main/Sesion-05/retosClass/reto2.json)





