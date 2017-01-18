package vedstat

class OrgType implements Serializable  {
    String description
    String code
    static constraints = {
        description(nullable: false)
        code(nullable: true)
    }
    String toString(){
        description
    }
}
