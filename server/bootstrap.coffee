# if the database is empty on server start, create some sample data.
Meteor.startup ->
    if Sensortypes.find().count() == 0
        data = [
            "Luftfeuchtigkeit"
            "Temperatur"
            "Windgeschwindigkeit"
            "Windrichtung"
        ]

        _.each data, (type) ->
            Sensortypes.insert {name: type}
