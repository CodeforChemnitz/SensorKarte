# List View Controller

## local Variables
Local application state and other variables dedicated to this view, also custom pure functions.

## Template Ready Event
Similar to the jQuery document.ready(), this is fired everytime this template gets (re-)rendered.

    Template.list.rendered = ->

## Helpers
Helpers are dedicated view functions and provide all the logic for the actual html templates.

    Template.list.helpers
      allRecords: -> Records.find()


## Events
Every custom interaction of the user with this template is listed below.

    Template.list.events
      'click .record-delete': (e,t)-> Records.remove _id: @_id if confirm "Wirklich löschen?"


## Event Helpers
Complex interactions that require more than 1-2 lines of code should be outsourced here.
