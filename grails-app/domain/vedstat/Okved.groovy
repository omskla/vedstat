package vedstat

class Okved {
    String name
    String code
    String descryption

    static constraints = {
        name nullable: false
        code nullable: true
        descryption nullable: true
    }

    String toString() {
        name
    }
}
