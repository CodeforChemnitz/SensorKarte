# Sensortypes

On startup fill our sensortypes collection.
For easy maintenance on production check on each startup if new types are defined

Oh, we don't remove the old one, even if they are not longer listed here, because there could be sensors which use them.
And we want to search and filter for them, right?

    Meteor.startup ->

        data =
            air_humidity: "Luftfeuchtigkeit"
            temperature_ground: "Bodentemperatur"
            temperature_air: "Lufttemperatur"
            temperature_water: "Wassertemperatur"
            wind_speed: "Windgeschwindigkeit"
            wind_direction: "Windrichtung"

        _.each _.keys(data), (key) ->
            if Sensortypes.find({key: key}).count() == 0
                Sensortypes.insert {key: key, name: data[key]}
