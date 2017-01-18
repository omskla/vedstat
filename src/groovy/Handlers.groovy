package vedstat
import org.springframework.context.ApplicationListener
import org.springframework.security.authentication.event. AuthenticationSuccessEvent
import org.springframework.security.web.context.HttpSessionSecurityContextRepository

import javax.servlet.http.HttpSession

class MySecurityEventListener

    implements ApplicationListener<AuthenticationSuccessEvent> {

    void onApplicationEvent(AuthenticationSuccessEvent event) {
        def auth = event.authentication.principal
        def user = User.get(auth.id)
        println  "!!!!!"+event.authentication.details.sessionId




    }
}