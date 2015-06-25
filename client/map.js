
Template.map.helpers({
   yourloc: function() {
       var geo = Geolocation.latLng();
       if (geo) {
           return geo.lat + ' / ' + geo.lng;
       } else {
           return ".. suche ..";
       }
   }
});

Template.map.rendered = function () {
    L.Icon.Default.imagePath = 'packages/bevanhunt_leaflet/images';

    var map = L.map('map', {
        doubleClickZoom: false
    });
    // Stamen.Watercolor | Thunderforest.Outdoors
    // more providers: http://leaflet-extras.github.io/leaflet-providers/preview/
    L.tileLayer.provider('OpenStreetMap.DE').addTo(map);


    var yourloc;
    Tracker.autorun(function(c) {
        var curr = Geolocation.latLng();
        console.log("geoloc", curr);
        if (c.firstRun) {
            if (!curr) {
                curr = { lat: 50.8323, lng: 12.9282 };
            }
            var icon = L.AwesomeMarkers.icon({
                icon: 'coffee',
                markerColor: 'red'
            });
            console.log("icon", icon);
            yourloc = L.marker(curr, { icon: icon});
        } else if (curr) {
            yourloc.lat = curr.lat;
            yourloc.lng = curr.lng;
            map.setView([curr.lat, curr.lng], 13);
        }
    });

    map.on('dblclick', function (event) {
        title.set('');
        id.set('');
        latlng.set(event.latlng);
        Modal.show('markerModal');
    });

    var query = Markers.find();
    query.observe({
        added: function (document) {
            var marker = L.marker(document.latlng)
                .addTo(map)
                // Klick = entfernen
                .on('click', function (event) {
                    console.log("marker-daten aus mongo", document);
                    id.set(document._id);
                    latlng.set(document.latlng);
                    title.set(document.title || '');
                    type.set(document.type || '');
                    //map.removeLayer(marker);
                    //Markers.remove({_id: document._id});
                    Modal.show('markerModal');
                });
            //console.log("der neue marker", marker);
        },
        changed: function (oldDocument, newDocument) {
            console.warn("TODO marker onclick finden und ReactVars aktualisieren", oldDocument, newDocument);
        },
        removed: function (oldDocument) {
            layers = map._layers;
            var key, val;
            for (key in layers) {
                val = layers[key];
                if (val._latlng) {
                    if (val._latlng.lat === oldDocument.latlng.lat && val._latlng.lng === oldDocument.latlng.lng) {
                        map.removeLayer(val);
                    }
                }
            }
        }
    });
};
