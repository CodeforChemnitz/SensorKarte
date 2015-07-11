# if the database is empty on server start, create some sample data.
Meteor.startup ->

    # for debugging purposes
    #Records.remove({});


    # schema testing: insert a point

    if Records.find().count() == 0 and Sensortypes.find().count() > 0
        Records.insert
          userId: 'aaaa'
          createdAt: new Date()
          sensorData: [{
              name: "Test"
              type: 'air_humidity'
            }, {
              name: "Test Wind"
              type: 'wind_speed'
            }]
          location:
            type: "Point"
            coordinates: [ 50.84, 12.91 ]
          contactData:
            owner: "Tester"
            contact: "am besten klingeln"
            license: "CC-0"


    # create 2dsphere index
    # http://docs.mongodb.org/manual/tutorial/build-a-2dsphere-index/
    # db.stationen.createIndex( { location : "2dsphere" } )

    # query 2dsphere
    # http://docs.mongodb.org/manual/reference/operator/query/near/
    # db.stationen.find({ location : { $near :  { $geometry : { type: "Point", coordinates: [ 50.8, 12.9 ], }, $maxDistance: 10000  } } })
