@Schemas or= {}
@Schemas.sensorData = new SimpleSchema

    _id:
        type: String
        autoValue: -> Meteor.uuid()
        autoform:
            omit: true

    name:
        type: String
        label: "Bezeichnung"

    type:
        type: String
        label: "Sensortyp"

        allowedValues: ->
            Sensortypes.find {}, {key:1,_id:0}
                .map (n) -> n.key

        autoform:
          type: "select"
          options: ->
              Sensortypes.find {},{key:1,name:1,_id:0}
                .map (n) ->
                    value: n.key
                    label: n.name
