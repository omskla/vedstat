package vedstat

class TrainingOrg {

    String code
    String name
    String description
    String tel
    String adr
    static constraints = {
        name(nullable: false)
        code(nullable: true)
        description nullable: true
        tel    nullable: true
        adr    nullable: true
    }
    String toString(){
        name
    }

}
