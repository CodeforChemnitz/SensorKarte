
@Sensortypes = Sensortypes = new Meteor.Collection 'sensortypes'

Sensortypes.attachSchema @Schemas.sensorType

#
# Sensortypes.allow
#
#     insert: (userId, doc) ->
#         return !!userId
#
#     update: (userId, docs, fields, modifier) ->
#         return !!userId
#
#     remove: (userId, doc) ->
#         return userId is doc.userId
