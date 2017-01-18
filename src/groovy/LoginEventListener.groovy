package vedstat
import org.springframework.context.ApplicationListener;
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent
import org.springframework.web.context.request.RequestContextHolder as RCH
import vedstat.User

class LoginEventListener implements
        ApplicationListener<InteractiveAuthenticationSuccessEvent> {

    //deal with successful login    
    void onApplicationEvent(InteractiveAuthenticationSuccessEvent event) {
        User.withTransaction {
            def user = User.findByUsername(event.authentication.principal.username)
//            def adminRole = Role.findByAuthority('ROLE_ADMIN')
//            def userRole = Role.findByAuthority('ROLE_USER')
            def session = RCH.currentRequestAttributes().session      //get httpSession
            session.orgId=user?.org?.id
//            session.user = user
//            if(user.authorities.contains(adminRole)){
//                processAdminLogin()
//            }
//            else if(user.authorities.contains(userRole)){
//                processUserLogin()
//            }
        }
    }

    private void processAdminLogin(){    //move admin/processAdminLogin here
        println("ADMIN")
    }

    private void processUserLogin(){    //move admin/processUserLogin here
   println("USER")
    }
}