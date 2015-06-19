
Template.map.rendered = function () {
    L.Icon.Default.imagePath = 'packages/bevanhunt_leaflet/images';

    var map = L.map('map', {
        doubleClickZoom: false
    }).setView([50.8323, 12.9282], 13);
    // TODO detect from device!

    L.tileLayer.provider('Thunderforest.Outdoors').addTo(map);


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
                    console.log(document);
                    id.set(document._id);
                    latlng.set(document.latlng);
                    title.set(document.title || '');
                    //map.removeLayer(marker);
                    //Markers.remove({_id: document._id});
                    Modal.show('markerModal');
                });
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
