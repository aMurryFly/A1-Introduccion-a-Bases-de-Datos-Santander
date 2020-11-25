# Requires the PyMongo package.
# https://api.mongodb.com/python/current

result = client['Reto8']['starbucks'].aggregate([
    {
        '$addFields': {
            'lat_home': 19.2730747, 
            'lon_home': -99.1615048
        }
    }, {
        '$addFields': {
            'distance_from_home': {
                '$sqrt': {
                    '$sum': [
                        {
                            '$pow': [
                                {
                                    '$subtract': [
                                        '$lat_home', '$Latitude'
                                    ]
                                }, 2
                            ]
                        }, {
                            '$pow': [
                                {
                                    '$subtract': [
                                        '$lon_home', '$Longitude'
                                    ]
                                }, 2
                            ]
                        }
                    ]
                }
            }
        }
    }, {
        '$sort': {
            'distance_from_home': 1
        }
    }, {
        '$project': {
            'Store Name': 1, 
            'Street Address': 1, 
            'City': 1, 
            'Country': 1, 
            'Postcode': 1, 
            '_id': 0
        }
    }, {
        '$limit': 1
    }
])