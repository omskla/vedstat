package vedstat


class AttestationOrg {

    String code
    String name
    String descryption
    String tel
    String adr
    static constraints = {
        name(nullable: false)
        code(nullable: true)
        descryption nullable: true
        tel    nullable: true
        adr    nullable: true
    }
    String toString(){
        name
    }
    static mapping = {
        sort "code"
    }
}
