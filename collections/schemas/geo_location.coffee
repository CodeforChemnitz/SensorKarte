@Schemas or= {}
@Schemas.geoLocation = new SimpleSchema

    type:
        type: String
        defaultValue: "Point"

    coordinates:
        type: [Object]
        autoValue: ->
            if !@isUpdate
                loc = Geolocation.latLng()
                [ loc.lat, loc.lng ] if loc
