# Map View Controller

## local Variables
Local application state and other variables dedicated to this view, also custom pure functions.

## Template Ready Event
Similar to the jQuery document.ready(), this is fired everytime this template gets (re-)rendered.

    Template.map.rendered = ->
        L.Icon.Default.imagePath = 'packages/bevanhunt_leaflet/images'

### Init the map

First init our Leaflet.

        map = L.map 'map', {
            doubleClickZoom: false
        };

We use OSM.DE-style, but we can even use `Stamen.Watercolor` or `Thunderforest.Outdoors` or [other providers](http://leaflet-extras.github.io/leaflet-providers/preview/)

        L.tileLayer.provider('OpenStreetMap.DE').addTo(map)

Place a marker to show our current location (reactive) by using [Tracker](https://www.meteor.com/tracker).

        ownLocMarker = false
        Session.set 'firstFixFound', false

        Tracker.autorun (c) ->
            curr = Geolocation.latLng()  # reactive! rerun if it changes

            if c.firstRun
                if !curr
                    curr = { lat: 50.8323, lng: 12.9282 }     # Chemnitz Fallback

                icon = L.AwesomeMarkers.icon
                    icon: 'plus'
                    markerColor: 'red'

                ownLocMarker = L.marker curr, { icon: icon}
                    .addTo map
                    .on 'click', clickOnMyOwnLocation

                map.setView [curr.lat, curr.lng], 13

If we move, change the own marker.

        Tracker.autorun (c) ->
            return if !ownLocMarker
            curr = Geolocation.latLng()
            return if !curr
            ownLocMarker.setLatLng curr
            #console.log("update ownLocMarker", curr.lat, curr.lng, ownLocMarker)

Only move the map to our position for the first fixture

            if ! Session.get 'firstFixFound'
                map.setView [curr.lat, curr.lng], 13
                Alerts.set('Position gefunden!', 'success')
                Session.set 'firstFixFound', true


On double-click on the map we create a new marker on that location and show a modal dialog for further details.

        map.on 'dblclick', (event) -> dblclickOnMap event


Place all the existing sensors (records) on the map and observe for update/change/delete.

        query = Records.find()
        query.observe
            added: (document) ->
                if document.location?.coordinates?
                    geoloc = {lat: document.location.coordinates[0], lng: document.location.coordinates[1]}
                    marker = L.marker geoloc
                        .addTo map
                    marker._id = document._id

On click on the marker show details in a modal dialog.

                    marker.on 'click', -> clickOnExistingMarker document

            changed: (oldDocument, newDocument) ->
                # console.warn "TODO marker onclick finden und ReactVars aktualisieren", oldDocument, newDocument
                # nothing todo since _id doesn't change
                # maybe later if we have separate icons per sensortype

If someone removes a sensor it will be removed instantly from the map.

            removed: (oldDocument) ->
                for val in map._layers
                    if val._id == oldDocument._id
                        map.removeLayer val


## Helpers
Helpers are dedicated view functions and provide all the logic for the actual html templates.

    Template.map.helpers

Track our own position, just for fun and clearness.

       yourloc: ->
           geo = Geolocation.latLng();
           if geo
               return math.round(geo.lat, 4) + ' / ' + math.round(geo.lng, 4)
           else
               return ".. suche .."


## Events
Every custom interaction of the user with this template is listed below.

    # Template.map.events


## Event Helpers
Complex interactions that require more than 1-2 lines of code should be outsourced here.

    dblclickOnMap = (e) ->
        if !Meteor.user()
            Alerts.set('Bitte anmelden', 'warning')
            return

        Session.set 'latlng', e.latlng
        Modal.show 'recordNew',

    clickOnExistingMarker = (document) ->
        console.log document._id, Records.findOne(document._id)
        Modal.show 'recordEdit', Records.findOne(document._id)

    clickOnMyOwnLocation = ->
        if !Meteor.user()
            Alerts.set('Bitte anmelden', 'warning')
            return

        if !Session.get 'firstFixFound'
            Alerts.set("Bitte warten bis aktuelle Position gefunden wurde.", 'warning')
            return

        Session.set 'latlng', Geolocation.latLng()
        Modal.show 'recordNew'
