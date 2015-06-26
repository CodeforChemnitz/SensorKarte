type = 0;

Template.markerModal.helpers
    update: () ->
        _id = id.get()
        console.log _id
        _id ? true : false;


Template.markerModalForm.helpers
    lat: () -> latlng.get().lat
    lng: () -> latlng.get().lng
    title: () -> title.get()
    type: () -> type.get()
    types: () ->
        types = Sensortypes.find().fetch()
        currtype = type.get()
        _.each types, (n) ->
            n.selected = n._id == currtype
        console.log "types", types
        types


Template.markerModal.events
    'click .js-save': () ->
        title = $('#marker-title').val();
        type = $('#marker-type').find('option:selected').val();
        if id.get()
            console.log "update", id.get(), "title", title, "type", type
            Markers.update id.get(), {$set: { title: title, type: type}}
        else
            console.log "insert", latlng.get(), "title", title, "type", type
            Markers.insert {latlng: latlng.get(), title: title, type: type}

        Modal.hide()

    'click .js-delete': () ->
        _id = id.get()
        console.log _id
        if _id
            Markers.remove(_id)
        else
            alert "Woot?!"

        Modal.hide()
