<%@ page import="vedstat.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="user.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" required="" value="${userInstance?.username}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">
		<g:message code="user.password.label" default="Password" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="password" required="" value="${userInstance?.password}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'area', 'error')} ">
	<label for="area">
		<g:message code="area.org.label" default="Area" />
		
	</label>
	<g:select id="area" name="area.id" from="${vedstat.MunicArea.list()}" optionKey="id" value="${userInstance?.area?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>



%{--<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'org', 'error')} ">--}%
    %{--<label for="area">--}%
        %{--<g:message code="area.org.label" default="org" />--}%

    %{--</label>--}%
    %{--<g:select id="org" name="org.id" from="${vedstat.Org.list()}" optionKey="id" value="${userInstance?.org?.id}" class="many-to-one" noSelection="['null': '']"/>--}%
%{--</div>--}%




<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountExpired', 'error')} ">
	<label for="accountExpired">
		<g:message code="user.accountExpired.label" default="Account Expired" />
		
	</label>
	<g:checkBox name="accountExpired" value="${userInstance?.accountExpired}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'accountLocked', 'error')} ">
	<label for="accountLocked">
		<g:message code="user.accountLocked.label" default="Account Locked" />
		
	</label>
	<g:checkBox name="accountLocked" value="${userInstance?.accountLocked}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'enabled', 'error')} ">
	<label for="enabled">
		<g:message code="user.enabled.label" default="Enabled" />
		
	</label>
	<g:checkBox name="enabled" value="${userInstance?.enabled}" />
</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'passwordExpired', 'error')} ">
	<label for="passwordExpired">
		<g:message code="user.passwordExpired.label" default="Password Expired" />
		
	</label>
	<g:checkBox name="passwordExpired" value="${userInstance?.passwordExpired}" />
</div>



<style>
#test {
    width: 600px;
}
</style>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'org', 'error')} ">
    <label for="passwordExpired">
        <g:message code="user.org.label" default="org" />

    </label>

      <script>

          function clearFieldById(id){
              document.getElementById(id).value = "";
          }
          </script>
<g:autoCompletePrimary
        id="test"
        name="test.id"
                domain='vedstat.Org'
                searchField='description'
                collectField="id"
                hidden='hiddenOrg'
                value='${userInstance.org}' />
    <a onclick="clearFieldById('test');clearFieldById('hiddenOrg');"><img src="${resource(dir: 'images', file: 'error.png')}" /></a>

<input type=hidden id="hiddenOrg" name="org.id" value="${userInstance?.org?.id}"/>

</div>

