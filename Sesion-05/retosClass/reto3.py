[
    {
        '$match': {
            'amenities': {
                '$in': [
                    'Wifi', 'Ethernet'
                ]
            }
        }
    }, {
        '$group': {
            '_id': None, 
            'total': {
                '$sum': 1
            }
        }
    }
]