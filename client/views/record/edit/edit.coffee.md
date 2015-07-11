# Edit a core record - a sensor station - in a modal dialog

From the show modal the user can edit its own station and all the sensors of it.
We use [AutoForm](https://github.com/aldeed/meteor-autoform) which do the form rendering and update stuff.
To react on its feedback we add some [hooks](https://github.com/aldeed/meteor-autoform#callbackshooks).

    AutoForm.addHooks 'editRecordForm',

On insert/validation error we want a dangerous notification!

        onError: (formType, error) ->
            # console.log "error", formType, error
            Alerts.set('Fehler beim Ändern')

On success we want a good green notification and go back to the show modal
which should show the updated values.

        onSuccess: (formType, result) ->
            Alerts.set('Station erfolgreich geändert', 'success')
            id = @docId
            $('.recordEdit').on 'hidden.bs.modal', -> Modal.show 'recordShow', Records.findOne(id)
            Modal.hide 'recordEdit'  # @template dont work :(



For debugging purposes you can enable AutoForm debugging.

    # AutoForm.debug()
