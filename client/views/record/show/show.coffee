
Template.recordShow.helpers
    canEdit: -> Meteor.user()._id == @userId
    hasContactData: -> @owner or @license

Template.recordShow.events
    'click .record-edit': (e,t) ->
        id = @_id
        $('.recordShow').on 'hidden.bs.modal', -> Modal.show 'recordEdit', Records.findOne(id)
        Modal.hide t

    'click .record-delete': (e,t) ->
        if confirm "Wirklich löschen?"
            Records.remove _id: @_id
            Alerts.set("Station gelöscht", 'success')
            Modal.hide t
