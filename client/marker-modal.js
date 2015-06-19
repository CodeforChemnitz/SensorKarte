
Template.markerModal.helpers({
    lat: function() {
        return latlng.get().lat;
    },
    lng: function() {
        return latlng.get().lng;
    },
    title: function() {
        return title.get();
    },
    update: function() {
        var _id = id.get();
        console.log(_id);
        return _id ? true : false;
    },
    types: function() {
        return Sensortypes.find();
    }
});


Template.markerModal.events({
    'click .js-save': function() {
        var title = $('#marker-title').val();
        if (id.get()) {
            Markers.update(id.get(), {$set: { latlng: latlng.get(), title: title}});
        } else {
            Markers.insert({latlng: latlng.get(), title: title});
        }
        Modal.hide();
    },
    'click .js-delete': function() {
        var _id = id.get();
        console.log(_id);
        if (_id) {
            Markers.remove(_id);
        } else {
            alert("Woot?!");
        }
        Modal.hide();
    }
});

