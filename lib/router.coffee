# iron router cheatsheet! http://journal.gentlenode.com/meteor-11-iron-router-cheatsheet/

Router.configure
    #controller: 'LayoutController'
    loadingTemplate: 'loading'
    layoutTemplate: 'layout'
    fastRender: true

    load: ->
        $('html, body').animate({ scrollTop: 0 }, 400)
        $('.content').hide().fadeIn(500)

    # waitOn: -> [
    #     Meteor.subscribe 'markers'
    #     Meteor.subscribe 'sensortypes'
    #     ]

singleSubsManager = new SubsManager
    cacheLimit: 10 # maximum number of cache subscriptions
    expireIn: 30 # any subscription will be expire after 30 minutes, if it's not subscribed again

allSubsManager = new SubsManager
    cacheLimit: 2 # maximum number of cache subscriptions
    expireIn: 10 # any subscription will be expire after 30 minutes, if it's not subscribed again

# @LayoutController = RouteController.extend
#     layoutTemplate: 'appBody'
#     yieldTemplates:
#         'navbar': {to: 'navbar'}
#         'footer': {to: 'footer'}
#     where: 'client'


# http://iron-meteor.github.io/iron-router/#route-parameters

Router.map ->
    @route 'home',
        path: '/'
        waitOn: -> allSubsManager.subscribe "allRecords"
        template: 'map'

    @route 'map',
        path: '/map'
        waitOn: -> allSubsManager.subscribe "allRecords"

    @route 'list',
        path: '/list'
        waitOn: -> allSubsManager.subscribe "allRecords"

    @route 'recordNew',
        path: '/marker/new'
        action: ->
            AutoForm.resetForm "insertRecordForm" # clear validation errors
            @render()

    @route 'recordEdit',
        path: '/marker/:_id/edit'
        waitOn: -> singleSubsManager.subscribe 'singleRecord', @params._id
        data: ->
            @params.query.step or= 0
            # AutoForm.resetForm "editRecordForm" # clear validation errors
            Records.findOne _id: @params._id



# on page load show the loading spinner

Router.onBeforeAction 'loading'
