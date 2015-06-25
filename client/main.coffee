$ () ->
    $(window).resize () ->
        $('#map').css 'height', window.innerHeight - 82 - 45

    $(window).resize() # trigger resize event
