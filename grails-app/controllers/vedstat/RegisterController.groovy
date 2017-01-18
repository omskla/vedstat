package vedstat

class RegisterController {

    def transient sessionFactory
    def index() {
        redirect(action: "registerOrg")
    }

    def registerOrgFlow = {
        entryPoint{
            action{
                flow.org = new Org()
                [org: flow.org]
            }
            on("success").to "name"
        }

        name{
            println("!!")
        }

    }
}
