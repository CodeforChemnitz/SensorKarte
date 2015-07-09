@Schemas or= {}
@Schemas.sensorData = new SimpleSchema

    _id:
        type: String
        autoValue: -> Meteor.uuid()

    name:
        type: String
        label: "Bezeichnung"

    type:
        type: String
        # validate against @Schemas.sensorType.key
        allowedValues: ['air_humidity','temperature','wind_speed','wind_direction'] # Sensortyp.find({$fields: 'key'}).fetch()
        label: "Sensortyp"
