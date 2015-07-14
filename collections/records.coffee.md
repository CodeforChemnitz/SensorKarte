# Records
The core data collection of a sensor station.

    @Records = Records = new Meteor.Collection 'stations'

## Data Schema

The following Schema is used for documents of the collection. It describes the exact data fields and
additional metadata for displaying them in HTML forms.

## Story

Ein Nutzer kann kann an einer beliebigen Stelle einen Sensorstandpunkt (Station) erstellen. Dieser trägt auch die Geolocation.
Eine Station wird dem aktuellen Nutzer zugeordnet, KANN eine Beschreibung haben, KANN einen gesonderten Ansprechpartner haben.
Zu dieser Station können beliebig viele Sensoren hinterlegt werden, je Typ aber nur 1x.
Jeder Sensor hat einen Typ.

    Records.attachSchema new SimpleSchema

        userId:
            type: String
            autoValue: -> @userId if @userId
            autoform:
                omit: true

        createdAt:
            type: Date
            defaultValue: new Date()
            autoform:
                omit: true

        updatedAt:
            type: Date
            autoValue: -> new Date()
            autoform:
                omit: true

        name:
            type: String
            autoform:
                placeholder: "z.B. Vogelhaus"

        sensorData:
            type: [@Schemas.sensorData]
            defaultValue: []
            label: "Sensoren"
            minCount: 1

        location:
            # type: Object
            type: @Schemas.geoLocation
            autoform:
                # label: false
                omit: true
            # autoValue: ->
                # if Meteor.isClient and !@isUpdate
                #     loc = Session.get 'latlng'
                #     if !loc
                #         console.log "keine loc?", loc
                #         return {}
                #     #    throw new Meteor.Error('geoloc', "No geolocation found, so no insert allowed")
                #     return {type: 'Point', coordinates: [loc.lat, loc.lng]}
                # console.log "hier? wieso?", Meteor.isClient, !@isUpdate, @
                # return {}


        contactData:
            type: @Schemas.contactData
            #defaultvalue: {}
            label: "Kontaktdaten"



## Access Rules
Instead of heavy Meteor methods, just use lazy access rules to allow CRUD
operations directly. Users can only shoot in their own foot if they do
something "hacky" here, thus this approach is secure.

    Records.allow

      insert: (userId, doc) ->
        return !!userId

      update: (userId, doc, fields, modifier) ->
        return userId is doc.userId

      remove: (userId, doc) ->
        return userId is doc.userId

## Shorthand Helpers
These methods allow for DRY principles in the source code. Logic that is used
more than once on the collection should be defined here.

    Records.helpers

      germanCreatedAt: -> moment(@createdAt).fromNow()
      germanUpdatedAt: -> moment(@updatedAt).fromNow()
      germanCreatedAtPrecise: -> moment(@createdAt).format "DD.MM.YYYY"
      germanUpdatedAtPrecise: -> moment(@createdAt).format "DD.MM.YYYY"
