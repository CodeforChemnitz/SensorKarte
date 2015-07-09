@Schemas or= {}
@Schemas.sensorData = new SimpleSchema

    name:
        type: String
        label: "Bezeichnung"
        
    type:
        type: @Schemas.sensorTyp
        label: "Sensortyp"
