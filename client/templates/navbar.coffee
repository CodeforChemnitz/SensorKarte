Template.navbar.helpers
    types: () -> Sensortypes.find().fetch()
    emailLocalPart: () ->
        email = Meteor.user().emails[0].address
        email.substring 0, email.indexOf('@')


Template.navbar.events
    'keyup form .filter-name': (e) ->
        filter_name = $(e.target).val()
        if filter_name.length > 3
            console.log "suche nach ", filter_name

    'change form .filter-type': (e) ->
        filter_type = $(e.target).find('option:selected').val()
        console.log "suche nach typ ", filter_type
