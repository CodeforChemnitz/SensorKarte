Meteor.publish "allRecords", ->
  Records.find()
