## Sesión 8: *Query Competition*

### RETO 1 :rocket:

Usando la latitud y longitud de tu posición actual, encuenta el Starbucks más cercano a tu posición. Para conocer tu posición actual puedes usar Google Maps para, sólo debes copiar los datos de la URL.

   ```json 
        [{$addFields: 
        {
        lat_home: 19.2730747,
        lon_home: -99.1615048,
        }}, {$addFields: {
        distance_from_home:{
            $sqrt: {
            $sum: [ 
                {$pow: [{$subtract: ["$lat_home", "$Latitude"]}, 2]},
                {$pow: [{$subtract: ["$lon_home", "$Longitude"]}, 2]}
            ]
            }
        }
        }}, {$sort: {
        distance_from_home: 1
        }}, {$project: {
        "Store Name": 1,
        "Street Address": 1,
        "City": 1,
        "Country": 1,
        Postcode: 1,
        _id: 0
        }}, {$limit: 1}]
   ```

[Reto 1: Python code](https://github.com/aMurryFly/A1-Introduccion-a-Bases-de-Datos-Santander/blob/main/Sesion-08/retos/reto1.py)


### RETO 2 - Pandemia A (H1N1) :rocket:


- ¿Cuál fue el país con mayor número de muertes?
   ```json 
        [{$group: {
        _id: '$Country',
        muertes: {
            $max: '$Deaths'
        }
        }}, {$sort: {
        muertes: -1
        }}, {
            $limit: 1
        }]
   ```

- ¿Cuál fue el país con menor número de muertes?
   ```json 
        [{
            $group: {
                _id: '$Country',
                muertes: {
                    $min: '$Deaths'
                }
            }
        }, {
            $match: {
                muertes: {
                    $gte: 0
                }
            }
        }, {
            $sort: {
                muertes: 1
            }
        }, {
            $limit: 1
        }]
   ```

- ¿Cuál fue el país con el mayor número de casos?

   ```json 
        [{$group: {
        _id: '$Country',
        casos: {
            $max: '$Cases'
        }
        }}, {$sort: {
        casos: -1
        }}, {$match: {
        _id: {
            $in: [
            RegExp('[^(Grand Total)]')
            ]
        }
        }}, {$limit: 1}]        
   ```

- ¿Cuál fue el país con el menor número de casos?

   ```json 
        [{$group: {
        _id: '$Country',
        casos: {
            $min: '$Cases'
        }
        }}, {$sort: {
        casos: 1
        }}, {$limit: 1}]
   ```

- ¿Cuál fue el número de muertes promedio?
   ```json 
    [{$group: {
    _id: '$Country',
    muertes: {
        $max: '$Deaths'
    }
    }}, {$group: {
    _id: null,
    muertes_promedio: {
        $avg: '$muertes'
    }
    }}, {$project: {
    muertes_promedio: 1,
    _id: 0
    }}]
   ```

- ¿Cuál fue el número de casos promedio?
   ```json 
    [{$group: {
    _id: '$Country',
    casos: {
        $max: '$Cases'
    }
    }}, {$group: {
    _id: null,
    casos_promedio: {
        $avg: '$casos'
    }
    }}, {$project: {
    casos_promedio: 1,
    _id: 0
    }}]
   ```

- Top 5 de países con más muertes

   ```json 
    [{$group: {
    _id: '$Country',
    muertes: {
        $max: '$Deaths'
    }
    }}, {$sort: {
    muertes: -1
    }}, {$limit: 5}]
   ```

- Top 5 de países con menos muertes
   ```json 
    [{$group: {
    _id: '$Country',
    muertes: {
        $sum: '$Deaths'
    }
    }}, {$sort: {
    muertes: 1
    }}, {$limit: 5}]
   ```


### RETO 3 - Pandemia A (H1N1) :rocket:


- ¿Cuál es país con mayor número de muertes?
   ```json 
    [{$addFields: {
    place: {
        $concat: [
        '$Province',
        ',',
        '$Region'
        ]
    }
    }}, {$group: {
    _id: '$place',
    casos: {
        $max: '$Deaths'
    }
    }}, {$addFields: {
    place_Array: {
        $split: [
        '$_id',
        ','
        ]
    }
    }}, {$addFields: {
    country: {
        $arrayElemAt: [
        '$place_Array',
        1
        ]
    }
    }}, {$group: {
    _id: '$country',
    cases: {
        $sum: '$casos'
    }
    }}, {$sort: {
    cases: -1
    }}, {$limit: 1}]
   ```

- ¿Cuál es el país con mayor número de casos?
   ```json 
        [{$addFields: {
        place: {
            $concat: [
            '$Province',
            ',',
            '$Region'
            ]
        }
        }}, {$group: {
        _id: '$place',
        casos: {
            $max: '$Confirmed'
        }
        }}, {$addFields: {
        place_Array: {
            $split: [
            '$_id',
            ','
            ]
        }
        }}, {$addFields: {
        country: {
            $arrayElemAt: [
            '$place_Array',
            1
            ]
        }
        }}, {$group: {
        _id: '$country',
        cases: {
            $sum: '$casos'
        }
        }}, {$sort: {
        cases: -1
        }}, {$limit: 1}]
   ```

- Usando las coordenadas, encuentra el epicentro del virus.
   ```json 
        [{$addFields: {
        place: {
            $concat: [
            '$Province',
            ',',
            '$Region'
            ]
        }
        }}, {$group: {
        _id: '$place',
        casos: {
            $max: '$Confirmed'
        }
        }}, {$addFields: {
        array: {
            $split: [
            '$_id',
            ','
            ]
        }
        }}, {$addFields: {
        province: {
            $arrayElemAt: [
            '$array',
            0
            ]
        },
        region: {
            $arrayElemAt: [
            '$array',
            1
            ]
        }
        }}, {$sort: {
        casos: -1
        }}, {$limit: 1

        }, {$lookup: {
        from: '2019-nCoV-cases-JHU',
        localField: 'province',
        foreignField: 'Province',
        as: 'info'
        }}, {$addFields: {
        newField: {
            $arrayElemAt: [
            '$info',
            0
            ]
        }
        }}, {$addFields: {
        Lat: '$newField.Lat',
        Long: '$newField.Long'
        }}, {$project: {
        casos: 1,
        _id: 0,
        province: 1,
        region: 1,
        Lat: 1,
        Long: 1
        }}]     
   ```

- Usando el epicentro, encuentra las 5 regiones más cercanas a dicho epicentro.
   ```json 
    [{$match: {
    Lat: {
        $gt: 0
    }
    }}, {$addFields: {
    Lat_epi: 30.9756,
    Long_epi: 112.2707
    }}, {$addFields: {
    distancia_epi: {
        $sqrt: {
        $sum: [
            {
            $pow: [
                {
                $subtract: [
                    '$Lat',
                    '$Lat_epi'
                ]
                },
                2
            ]
            },
            {
            $pow: [
                {
                $subtract: [
                    '$Long',
                    '$Long_epi'
                ]
                },
                2
            ]
            }
        ]
        }
    }
    }}, {$match: {
    distancia_epi: {
        $gt: 0
    }
    }}, {$group: {
    _id: '$Region',
    distancia_minima_al_epicentro: {
        $min: '$distancia_epi'
    }
    }}, {$sort: {
    distancia_minima_al_epicentro: 1
    }}, {$limit: 5}]
   ```



