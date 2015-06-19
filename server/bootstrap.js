// if the database is empty on server start, create some sample data.
Meteor.startup(function () {
  if (Sensortypes.find().count() === 0) {
    var data = [
        "Luftfeuchtigkeit",
        "Temperatur",
        "Windgeschwindigkeit",
        "Windrichtung"
    ];

    _.each(data, function(type) {
      Sensortypes.insert({name: type});
    });
  }
});
