@Schemas or= {}
@Schemas.geoLocation = new SimpleSchema

    lat:
        type: Number
        label: "Latitude"
        autoValue: -> Geolocation.latLng().lat

    long:
        type: Number
        label: "Longitute"
        autoValue: -> Geolocation.latLng().lng
