@Schemas or= {}
@Schemas.sensorData = new SimpleSchema

    uuid:
        type: Number
        decimal: true
        optional: false
        min: 1
        max: 256
        label: "UUID"

        custom: ->
            if Meteor.isClient
                seen = [@value]
                for idx in [0..255]
                    continue if "sensorData.#{ idx }.uuid" == @key
                    other = @field "sensorData.#{ idx }.uuid"
                    break if _.isUndefined other.value # last element or empty or string = other error
                    continue if !_.isNumber other.value
                    return "uniqueInRecord" if _.indexOf(seen, other.value) != -1
                    seen.push other.value

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
          afFieldInput:
            firstOption: "(Bitte einen Typ wählen)"
          options: ->
              Sensortypes.find {},{key:1,name:1,_id:0}
                .map (n) ->
                    value: n.key
                    label: n.name
