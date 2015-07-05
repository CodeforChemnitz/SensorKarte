# Dashboard View Controller

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

        yourloc = {}
        Tracker.autorun (c) ->
            curr = Geolocation.latLng()  # reactive! rerun if it changes
            if c.firstRun
                curr = { lat: 50.8323, lng: 12.9282 } if !curr    # Chemnitz

                icon = L.AwesomeMarkers.icon
                    icon: 'coffee',
                    markerColor: 'red'

                #console.log "icon", icon;
                yourloc = L.marker curr, { icon: icon}

            else if curr
                yourloc.lat = curr.lat;
                yourloc.lng = curr.lng;
                map.setView [curr.lat, curr.lng], 13

On double-click on the map we create a new marker on that location and show a modal dialog for further details.

        map.on 'dblclick', (event) ->
            title.set ''
            id.set ''
            latlng.set event.latlng
            Modal.show 'recordNew' 

Place all the existing sensors (records) on the map and observe for update/change/delete.

        query = Records.find()
        query.observe
            added: (document) ->
                marker = L.marker document.sensorData.geoloc
                    .addTo map
                marker._id = document._id

On click on the marker show details in a modal dialog.

                    .on 'click', (event) ->
                        id.set document._id # ReactVar
                        # latlng.set document.latlng
                        # title.set document.title?
                        # type.set document.type?
                        #map.removeLayer marker
                        #Markers.remove {_id: document._id}
                        Modal.show 'markerModal'

            changed: (oldDocument, newDocument) ->
                # console.warn "TODO marker onclick finden und ReactVars aktualisieren", oldDocument, newDocument
                # nothing todo since _id doesn't change
                # maybe later if we have separate icons per sensortype

If someone removes a sensor it will be removed instantly from the map.

            removed: (oldDocument) ->
                map.removeLayer val for val in map._layers if val._id == oldDocument._id


## Helpers
Helpers are dedicated view functions and provide all the logic for the actual html templates.

    Template.map.helpers

Track our own position, just for fun and clearness.

       yourloc: () ->
           geo = Geolocation.latLng();
           if geo
               return math.round(geo.lat, 4) + ' / ' + math.round(geo.lng, 4)
           else
               return ".. suche .."


## Events
Every custom interaction of the user with this template is listed below.

    Template.map.events


## Event Helpers
Complex interactions that require more than 1-2 lines of code should be outsourced here.
