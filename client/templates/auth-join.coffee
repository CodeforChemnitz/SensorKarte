
ERRORS_KEY = 'joinErrors'

Template.join.created = () ->
    Session.set ERRORS_KEY, {}


Template.join.helpers
    errorMessages: () -> _.values Session.get(ERRORS_KEY)
    errorClass: (key) -> Session.get(ERRORS_KEY)[key] && 'error'


Template.join.events
    'submit': (event, template) ->
        event.preventDefault();
        email = template.$('[name=email]').val()
        password = template.$('[name=password]').val()
        confirm = template.$('[name=confirm]').val()

        errors = {}

        if !email
            errors.email = 'Email required'

        if !password
            errors.password = 'Password required'

        if confirm != password
            errors.confirm = 'Please confirm your password'

        Session.set ERRORS_KEY, errors
        if _.keys(errors).length
            return

        Accounts.createUser { email: email, password: password }, (error) ->
            if error
                return Session.set ERRORS_KEY, {'none': error.reason}

            Router.go 'home'
