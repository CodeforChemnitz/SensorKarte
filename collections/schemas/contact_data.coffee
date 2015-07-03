@Schemas or= {}
@Schemas.contactData = new SimpleSchema

    owner:
        type: String
        label: "Eigentümer"
        #optional: true

    contact:
        type: String
        label: "Ansprechpartner"
        optional: true

    license:
        type: String
        label: "Lizenz"
