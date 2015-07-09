# Records
The core data collection of a sensor marker.

    @Records = Records = new Meteor.Collection 'marker'

## Data Schema

The following Schema is used for documents of the collection. It describes the exact data fields and
additional metadata for displaying them in HTML forms.

## Story

Ein Nutzer kann kann an einer beliebigen Stelle einen Sensorstandpunkt (Station) erstellen. Dieser trägt auch die Geolocation.
Eine Station wird dem aktuellen Nutzer zugeordnet, KANN eine Beschreibung haben, KANN einen gesonderten Ansprechpartner haben.
Zu dieser Station können beliebig viele Sensoren hinterlegt werden, je Typ aber nur 1x.
Jeder Sensor hat einen Typ.

Die Geolocation soll per MongoDBs `$near` benutzbar sein.
http://stackoverflow.com/questions/24492333/meteor-simple-schema-for-mongo-geo-location-data
http://docs.mongodb.org/manual/reference/operator/query/near/

    Records.attachSchema new SimpleSchema

        userId:
            type: String
            autoValue: -> @userId

        createdAt:
            type: Date
            defaultValue: new Date()

        updatedAt:
            type: Date
            autoValue: -> new Date()

        sensorData:
            type: [@Schemas.sensorData]
            defaultValue: []

        location:
            type @Schemas.geoLocation

        contactData:
            type: @Schemas.contactData
            defaultvalue: {}



## Access Rules
Instead of heavy Meteor methods, just use lazy access rules to allow CRUD
operations directly. Users can only shoot in their own foot if they do
something "hacky" here, thus this approach is secure.

    Records.allow

      insert: (userId, doc) ->
        return !!userId

      update: (userId, docs, fields, modifier) ->
        return !!userId

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
