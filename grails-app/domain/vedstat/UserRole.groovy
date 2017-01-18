package vedstat

import grails.plugin.springsecurity.annotation.Secured
import org.apache.commons.lang.builder.HashCodeBuilder
@Secured("ROLE_ADMIN")
class UserRole implements Serializable {

    User users
    Role role

    boolean equals(other) {
        if (!(other instanceof UserRole)) {
            return false
        }

        other.users?.id == users?.id &&
                other.role?.id == role?.id
    }

    int hashCode() {
        def builder = new HashCodeBuilder()
        if (users) builder.append(users.id)
        if (role) builder.append(role.id)
        builder.toHashCode()
    }

    static UserRole get(long usersId, long roleId) {
        find 'from UserRole where users.id=:usersId and role.id=:roleId',
                [usersId: usersId, roleId: roleId]
    }

    static UserRole create(User users, Role role, boolean flush = false) {
        new UserRole(users: users, role: role).save(flush: flush, insert: true)
    }

    static boolean remove(User users, Role role, boolean flush = false) {
        UserRole instance = UserRole.findByUsersAndRole(users, role)
        if (!instance) {
            return false
        }

        instance.delete(flush: flush)
        true
    }

    static void removeAll(User users) {
        executeUpdate 'DELETE FROM UserRole WHERE users=:users', [users: users]
    }

    static void removeAll(Role role) {
        executeUpdate 'DELETE FROM UserRole WHERE role=:role', [role: role]
    }

    static mapping = {
        id composite: ['role', 'users']
        version false
    }
}
