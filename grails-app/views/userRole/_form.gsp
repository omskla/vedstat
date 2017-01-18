<%@ page import="vedstat.UserRole" %>



<div class="fieldcontain ${hasErrors(bean: userRoleInstance, field: 'role', 'error')} required">
	<label for="role">
		<g:message code="userRole.role.label" default="Role" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="role" name="role.id" from="${vedstat.Role.list()}" optionKey="id" required="" value="${userRoleInstance?.role?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userRoleInstance, field: 'users', 'error')} required">
	<label for="users">
		<g:message code="userRole.users.label" default="Users" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="users" name="users.id" from="${vedstat.User.list()}" optionKey="id" required="" value="${userRoleInstance?.users?.id}" class="many-to-one"/>
</div>

