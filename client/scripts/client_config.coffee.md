# Client Config
This file includes some configurations and settings, mostly for other
packages used in the client.

## Spinner
Responsible for the wait-animation

    Meteor.Spinner.options =
      color: '#000'
      shadow: false
      top: '200px'
      radius: 30
      length: 25
      lines: 26

## Accounts-Entry
A app-like login mask instead of the default dropdown menu from accounts-ui. [Accounts-Entry](https://github.com/Differential/accounts-entry)

    Meteor.startup ->
    #   AccountsEntry.config
    #     # logo: '/img/splash-sm.png'
    #     homeRoute: '/'
    #     dashboardRoute: '/map'
    #     # profileRoute: 'profile'
    #     passwordSignupFields: 'EMAIL_ONLY'
    #     # showSignupCode: true
    #     showOtherLoginServices: false
    #     language: 'german'
        T9n.setLanguage 'de'

## Moment js
The swiss army knife for time manipulation!

    moment.locale 'de',
      relativeTime:
        future: "in %s"
        past:   "vor %s"
        s:  "Sekunden"
        m:  "einer Minute"
        mm: "%d Minuten"
        h:  "einem Stunde"
        hh: "%d Stunden"
        d:  "einem Tag"
        dd: "%d Tage"
        M:  "einem Monat"
        MM: "%d Monaten"
        y:  "einem Jahr"
        yy: "%d Jahren"

## Fontawesome
For famous icons - especially for map marker!

    L.AwesomeMarkers.Icon.prototype.options.prefix = 'fa';

## Alerts
We use [Bootstrap Alerts](https://github.com/asktomsk/bootstrap-alerts) with autoHide


    Alerts.defaultOptions.autoHide = true
