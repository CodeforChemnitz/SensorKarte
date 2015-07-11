
# Template.recordNew.onCreate ->
#     AutoForm.resetForm "insertRecordForm" # clear validation errors

AutoForm.addHooks 'insertRecordForm',

    onError: (formType, error) ->
        # console.log "error", formType, error
        Alerts.set('Fehler beim Anlegen')

    onSuccess: (formType, result) ->
        # console.log "success", formType, result
        Alerts.set('Station erfolgreich angelegt', 'success')
        Modal.hide 'recordNew'

    before:
        insert: (doc) ->
            loc = Session.get 'latlng'
            if !loc
                Alerts.set('Keine Position gesetzt!');
                return false;

            doc.location = {type: "Point", coordinates: [loc.lat, loc.lng]}
            this.result doc


# AutoForm.debug()
