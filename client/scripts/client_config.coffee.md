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

## Autoform
We use [Autoform](https://github.com/aldeed/meteor-autoform) as easy form generator.
There are different templates: `plain`, `plain-fieldset`, `bootstrap3`, `bootstrap3-inline`, `bootstrap3-horizontal`

    # inline didn't work :()
    # AutoForm.setDefaultTemplate('bootstrap3-inline');
    #AutoForm.setDefaultTemplateForType('quickForm', 'plain');
    #AutoForm.setDefaultTemplateForType('afFormGroup', 'bootstrap3-inline');
    #AutoForm.setDefaultTemplateForType('afObjectField', 'plain');
    #AutoForm.setDefaultTemplateForType('afArrayField', 'plain');

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
We use [Bootstrap Alerts](https://github.com/asktomsk/bootstrap-alerts) with autoHide.
Poorly it's not configurable, but hey, the default behaviour is good!

    # Alerts.defaultOptions.autoHide = true

## Modals
Idea: Allow multiple modals, e.g. for recordEdit within recordShow.
Well Bootstrap don't support it, so there are side effects like not scrollabe modals.
So we don't use it. We close one modal and open the other by the hidden.bs.modal event.

    # Modal.allowMultiple = true
