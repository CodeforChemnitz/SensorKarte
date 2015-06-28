# marker collection
Meteor.publish "markers", () -> Markers.find()

Meteor.publish "sensortypes", () -> Sensortypes.find()
