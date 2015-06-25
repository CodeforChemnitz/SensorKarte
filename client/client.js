// create marker collection
Meteor.subscribe('markers');

Meteor.subscribe('sensortypes');



latlng = new ReactiveVar({});
title = new ReactiveVar('');
id = new ReactiveVar('');
type = new ReactiveVar('');
