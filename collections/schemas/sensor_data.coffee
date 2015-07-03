@Schemas or= {}
@Schemas.sensorData = new SimpleSchema

    type:
        type: @Schemas.Geolocation
        label: "Sensortyp"

    geoloc:
        type: @Schemas.Geolocation
        label: "Geo-Position"
