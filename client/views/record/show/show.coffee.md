# Show core record - a sensor station - in a modal dialog

After click on a station on the map a modal dialog shows all informations about the station.

## Helpers
Helpers are dedicated view functions and provide all the logic for the actual html templates.

    Template.recordShow.helpers

If the current user is the creator, more action buttons will appear.

        canEdit: -> Meteor.userId() == @userId
        hasContactData: -> @owner or @license


## Events
Every custom interaction of the user with this template is listed below.

    Template.recordShow.events

By click on edit the current modal will close an the edit modal will appear.
Because of the lacky support for multiple modals in Bootstrap, we just close the current
one and open the show modal right after it completly is removed.

        'click .record-edit': (e,t) ->
            id = @_id
            $('.recordShow').on 'hidden.bs.modal', -> Modal.show 'recordEdit', Records.findOne(id)
            Modal.hide t

On click on delete we want to confirm this action!
After delete, the Records observe in the maps template will remove it also from the map.

        'click .record-delete': (e,t) ->
            if confirm "Wirklich löschen?"
                Records.remove _id: @_id
                Alerts.set("Station gelöscht", 'success')
                Modal.hide t

## Event Helpers
Complex interactions that require more than 1-2 lines of code should be outsourced here.
