# Geolocation Struktur

Die Geolocation soll per MongoDBs `$near` benutzbar sein.
http://stackoverflow.com/questions/24492333/meteor-simple-schema-for-mongo-geo-location-data
http://docs.mongodb.org/manual/reference/operator/query/near/

    @Schemas or= {}
    @Schemas.geoLocation = new SimpleSchema

        type:
            type: String
            autoValue: -> "Point"

        coordinates:
            type: [Number]
            decimal: true
            # autoValue: ->
            #     if Meteor.isClient and !@isUpdate
            #         loc = Session.get 'latlng'
            #         if !loc
            #             console.log "keine loc?", loc
            #             return [0,0]
            #         #    throw new Meteor.Error('geoloc', "No geolocation found, so no insert allowed")
            #         return [loc.lat, loc.lng]
            #     console.log "hier? wieso?", Meteor.isClient, !@isUpdate, @
            #     return [1,1]


## verification
TODO Validation: Error if no geoloc is available

## create 2dsphere index
http://docs.mongodb.org/manual/tutorial/build-a-2dsphere-index/
db.stationen.createIndex( { location : "2dsphere" } )

## query 2dsphere
http://docs.mongodb.org/manual/reference/operator/query/near/
db.stationen.find({ location : { $near :  { $geometry : { type: "Point", coordinates: [ 50.8, 12.9 ], }, $maxDistance: 10000  } } })
