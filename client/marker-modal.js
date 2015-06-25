
Template.markerModal.helpers({
    update: function() {
        var _id = id.get();
        console.log(_id);
        return _id ? true : false;
    }
});

Template.markerModalForm.helpers({
    lat: function() {
        return latlng.get().lat;
    },
    lng: function() {
        return latlng.get().lng;
    },
    title: function() {
        return title.get();
    },
    type: function() {
        return type.get();
    },
    types: function() {
        var types = Sensortypes.find().fetch();
        var currtype = type.get();
        _.each(types, function(n) { n.selected = n._id == currtype; });
        console.log("types", types);
        return types;
    }
});


Template.markerModal.events({
    'click .js-save': function() {
        var title = $('#marker-title').val();
        var type = $('#marker-type').find('option:selected').val();
        if (id.get()) {
            console.log("update", id.get(), "title", title, "type", type);
            Markers.update(id.get(), {$set: { title: title, type: type}});
        } else {
            console.log("insert", latlng.get(), "title", title, "type", type);
            Markers.insert({latlng: latlng.get(), title: title, type: type});
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

