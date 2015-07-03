Meteor.publish "singleRecord", (id) ->
  Records.find _id: id
