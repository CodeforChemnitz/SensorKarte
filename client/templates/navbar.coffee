Template.navbar.helpers
    types: () -> Sensortypes.find().fetch()
    emailLocalPart: () ->
        email = Meteor.user().emails[0].address
        email.substring 0, email.indexOf('@')


Template.navbar.events
    'click input[name="filter_name"]': (e) ->
        filter_name = $(e.target).val()
        console.log "suche nach ", filter_name

    'change select[filter_type]': (e) ->
        filter_type = $(e.target).find('option:selected').val()
        console.log "typen ", filter_type

        
