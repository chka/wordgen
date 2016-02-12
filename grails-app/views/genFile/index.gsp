
<%@ page import="com.wordgen.GenFile" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'genFile.label', default: 'GenFile')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-genFile" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-genFile" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'genFile.username.label', default: 'Username')}" />
					
						<g:sortableColumn property="listOfURLs" title="${message(code: 'genFile.listOfURLs.label', default: 'List Of URL s')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'genFile.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'genFile.lastUpdated.label', default: 'Last Updated')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${genFileInstanceList}" status="i" var="genFileInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${genFileInstance.id}">${fieldValue(bean: genFileInstance, field: "username")}</g:link></td>
					
						<td>${fieldValue(bean: genFileInstance, field: "listOfURLs")}</td>
					
						<td><g:formatDate date="${genFileInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${genFileInstance.lastUpdated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${genFileInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
