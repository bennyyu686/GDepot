

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'category1.label', default: 'Category1')}" />
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                            <g:sortableColumn property="id" title="${message(code: 'category1.id.label', default: 'Id')}" />
                        
                            <g:sortableColumn property="categoryName" title="${message(code: 'category1.categoryName.label', default: 'Category Name')}" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${category1InstanceList}" status="i" var="category1Instance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${category1Instance.id}">${fieldValue(bean: category1Instance, field: "id")}</g:link></td>
                        
                            <td>${fieldValue(bean: category1Instance, field: "categoryName")}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${category1InstanceTotal}" />
            </div>
        </div>
    </body>
</html>
