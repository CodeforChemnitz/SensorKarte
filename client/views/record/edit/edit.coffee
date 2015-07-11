
AutoForm.addHooks 'editRecordForm',

    onError: (formType, error) ->
        # console.log "error", formType, error
        Alerts.set('Fehler beim Ändern')

    onSuccess: (formType, result) ->
        Alerts.set('Station erfolgreich geändert', 'success')
        id = @docId
        $('.recordEdit').on 'hidden.bs.modal', -> Modal.show 'recordShow', Records.findOne(id)
        Modal.hide 'recordEdit'  # @template dont work :(

# AutoForm.debug()
