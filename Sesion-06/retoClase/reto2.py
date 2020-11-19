[
    {
        '$lookup': {
            'from': 'users', 
            'localField': 'name', 
            'foreignField': 'name', 
            'as': 'usuario'
        }
    }, {
        '$addFields': {
            'user_Aux': {
                '$arrayElemAt': [
                    '$usuario', 0
                ]
            }
        }
    }, {
        '$addFields': {
            'user_Pass': '$user_Aux.password'
        }
    }, {
        '$project': {
            '_id': 0, 
            'name': 1, 
            'email': 1, 
            'user_Pass': 1
        }
    }
]