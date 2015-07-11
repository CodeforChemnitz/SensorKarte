
Template.recordEdit.events
    'click .record-delete': ->
        if confirm "Wirklich löschen?"
            Records.remove _id: @_id
            Alerts.set("Station gelöscht", 'success')
            Modal.hide 'recordEdit'



AutoForm.addHooks 'editRecordForm',

    onError: (formType, error) ->
        # console.log "error", formType, error
        Alerts.set('Fehler beim Ändern')

    onSuccess: (formType, result) ->
        # console.log "success", formType, result
        Alerts.set('Station erfolgreich geändert', 'success')
        Modal.hide 'recordEdit'

# AutoForm.debug()
