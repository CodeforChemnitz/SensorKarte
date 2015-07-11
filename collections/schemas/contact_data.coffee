@Schemas or= {}
@Schemas.contactData = new SimpleSchema

    owner:
        type: String
        label: "Eigentümer"
        #optional: true
        autoform:
            value: -> Meteor.user().emails[0].address

    contact:
        type: String
        label: "Ansprechpartner"
        optional: true


    license:
        type: String
        label: "Lizenz"
        autoform:
            value: "CC-0"
