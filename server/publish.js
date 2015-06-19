// marker collection
Meteor.publish("markers", function () {
  return Markers.find();
});

Meteor.publish("sensortypes", function () {
    return Sensortypes.find();
});