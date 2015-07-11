@Schemas or= {}
@Schemas.contactData = new SimpleSchema

    owner:
        type: String
        label: "Eigentümer"
        defaultValue: -> Meteor.user().emails[0].address

    contact:
        type: String
        label: "Ansprechpartner"
        optional: true


    license:
        type: String
        label: "Lizenz"
        defaultValue: -> "CC-0"
