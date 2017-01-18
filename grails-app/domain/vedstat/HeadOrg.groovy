package vedstat

class HeadOrg implements Serializable {

    String descryption
    String code
    static constraints = {
        code nullable: false
        descryption nullable: true
    }

    String toString(){
        descryption
    }
}
