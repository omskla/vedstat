package vedstat

class MunicArea implements Serializable {
    String code
    String description
    String declension
    String declension2
    String head
    String telHead
    String specOt
    String postSpecOt
    String telSpecOt
    Date dtSpecOt
    String educationSpecOt
    String specTrud
    String postSpecTrud
    String telSpecTrud
    Date dtSpecTrud
    String educationSpecTrud
    String preds
    String postPreds
    String telPreds


    static constraints = {
        description nullable: false
        code nullable: false
        declension nullable: true
        declension2 nullable: true
        head nullable: true
        telHead nullable: true
        specOt nullable: true
        postSpecOt nullable: true
        telSpecOt nullable: true
        dtSpecOt nullable: true
        educationSpecOt nullable: true
        specTrud nullable: true
        postSpecTrud nullable: true
        telSpecTrud nullable: true
        dtSpecTrud nullable: true
        educationSpecTrud nullable: true
        preds nullable: true
        postPreds nullable: true
        telPreds nullable: true

    }

    String toString() {
        description

    }
}







