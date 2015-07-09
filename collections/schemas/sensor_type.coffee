@Schemas or= {}
@Schemas.sensorType = new SimpleSchema

    key:
        type: String
        label: "Technischer Schlüssel"
        max: 30

    name:
        type: String
        label: "Bezeichnung"
        max: 100
