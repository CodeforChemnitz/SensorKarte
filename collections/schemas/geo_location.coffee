@Schemas or= {}
@Schemas.geoLocation = new SimpleSchema

    type:
        type: String
        defaultValue: "Point"

    coordinates:
        type: [Number]
        decimal: true
        autoValue: ->
            if Meteor.isClient && !@isUpdate
                loc = Geolocation.latLng()
                [ loc.lat, loc.lng ] if loc
