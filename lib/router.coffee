
Router.configure
    controller: 'LayoutController'
    loadingTemplate: 'appLoading'
    notFoundTemplate: 'appNotFound'

    load: ->
        $('html, body').animate({ scrollTop: 0 }, 400)
        $('.content').hide().fadeIn(1000)

    waitOn: -> [
        Meteor.subscribe 'markers'
        Meteor.subscribe 'sensortypes'
        ]

    onBeforeAction: ->
        console.log "action", @params
        @next()

@LayoutController = RouteController.extend
    layoutTemplate: 'appBody'
    yieldTemplates:
        'navbar': {to: 'navbar'}
        'footer': {to: 'footer'}
    where: 'client'

# routes

Router.route '/list', -> @render 'appList'
Router.route '/map', -> @render 'appMap'
Router.route '/', -> @render 'map'
