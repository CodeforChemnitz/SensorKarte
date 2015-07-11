# Create a new core record - a sensor station - in a modal dialog

After a action by the map we show the user a modal where he/she can input all the necessary data.
We use [AutoForm](https://github.com/aldeed/meteor-autoform) which do the form rendering and update stuff.
To react on its feedback we add some [hooks](https://github.com/aldeed/meteor-autoform#callbackshooks).

    AutoForm.addHooks 'insertRecordForm',

Prefill the geolocation from our Session value.
Well, this should be done in SimpleSchema `geoLocation`.
I tried prefilling these values by `autoValue` and `defaultValue` but it doesn't work. -.-

        before:
            insert: (doc) ->
                loc = Session.get 'latlng'
                if !loc
                    Alerts.set('Keine Position gesetzt!');
                    return false;

                doc.location = {type: "Point", coordinates: [loc.lat, loc.lng]}
                this.result doc

On insert/validation error we want a dangerous notification!

        onError: (formType, error) ->
            # console.log "error", formType, error
            Alerts.set('Fehler beim Anlegen')

On success we want a good green notification and go back to the map which should show our new created station.

        onSuccess: (formType, result) ->
            # console.log "success", formType, result
            Alerts.set('Station erfolgreich angelegt', 'success')
            Modal.hide 'recordNew'



For debugging purposes you can enable AutoForm debugging.

    # AutoForm.debug()
