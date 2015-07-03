# if the database is empty on server start, create some sample data.
Meteor.startup ->
    if Sensortypes.find().count() == 0
        data =
            air_humidity: "Luftfeuchtigkeit"
            temperature: "Temperatur"
            wind_speed: "Windgeschwindigkeit"
            wind_direction: "Windrichtung"

        _.each _.keys(data), (key) ->
            Sensortypes.insert {key: key, name: data[key]}
