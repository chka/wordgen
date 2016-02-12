<%@ page import="com.wordgen.GenFile" %>



<div class="fieldcontain ${hasErrors(bean: genFileInstance, field: 'username', 'error')} required">
	<label for="username">
		<g:message code="genFile.username.label" default="Username" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="username" maxlength="10" required="" value="${genFileInstance?.username}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: genFileInstance, field: 'listOfURLs', 'error')} required">
	<label for="listOfURLs">
		<g:message code="genFile.listOfURLs.label" default="List Of URL s" />
		<span class="required-indicator">*</span>
	</label>
	<g:textArea name="listOfURLs" cols="40" rows="5" maxlength="1000" required="" value="${genFileInstance?.listOfURLs}"/>

</div>

