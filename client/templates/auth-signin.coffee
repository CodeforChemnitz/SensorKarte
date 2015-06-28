
ERRORS_KEY = 'signinErrors'

Template.signin.created = () -> Session.set ERRORS_KEY, {}

Template.signin.helpers
    errorMessages: () -> _.values Session.get(ERRORS_KEY)
    errorClass: (key) -> Session.get(ERRORS_KEY)[key] && 'error'

Template.signin.events
    'submit': (event, template) ->
        event.preventDefault()

        email = template.$('[name=email]').val()
        password = template.$('[name=password]').val()

        errors = {}

        if !email
          errors.email = 'Email is required'

        if !password
          errors.password = 'Password is required'

        Session.set ERRORS_KEY, errors
        if _.keys(errors).length
          return

        Meteor.loginWithPassword email, password, (error) ->
            if error
                return Session.set ERRORS_KEY, {'none': error.reason}

            Router.go 'home'
