package vedstat

//@Resource(uri='/status', formats=['json', 'xml'])
class Status implements Serializable {
    String code
    String description
    static constraints = {
        code(nullable: false)
        description(nullable: false)
    }
    String toString(){
        description
    }
}
