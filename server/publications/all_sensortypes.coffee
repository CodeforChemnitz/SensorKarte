Meteor.publish "allSensortypes", ->
  Sensortypes.find()
