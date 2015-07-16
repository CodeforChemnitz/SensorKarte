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
                # console.log "validate", this, "field", @field(), "siblingField", @siblingField()
                seen = [@value]
                for idx in [0..255]
                    console.log @key, "idx", idx
                    if "sensorData.#{ idx }.uuid" == @key
                        console.log @key, "self"
                        continue
                    other = @field "sensorData.#{ idx }.uuid"
                    console.log @key, other, other.value
                    if _.isUndefined other.value # last element
                        console.log @key, "undef"
                        break
                    if !_.isNumber other.value
                        console.log @key, "non numeric"
                        continue
                    if _.indexOf(seen, other.value) != -1
                        console.log @key, "err", seen, other, this
                        return "uniqueInRecord"
                    seen.push other.value
                # "uniqueInRecord"
                console.log @key, "val", seen, this

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
