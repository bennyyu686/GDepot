

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'category1.label', default: 'Category1')}" />
        <title><g:message code="default.edit.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.edit.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${category1Instance}">
            <div class="errors">
                <g:renderErrors bean="${category1Instance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${category1Instance?.id}" />
                <g:hiddenField name="version" value="${category1Instance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="categoryName"><g:message code="category1.categoryName.label" default="Category Name" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: category1Instance, field: 'categoryName', 'errors')}">
                                    <g:textField name="categoryName" value="${category1Instance?.categoryName}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="goods"><g:message code="category1.goods.label" default="Goods" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: category1Instance, field: 'goods', 'errors')}">
                                    
<ul>
<g:each in="${category1Instance?.goods?}" var="g">
    <li><g:link controller="goods" action="show" id="${g.id}">${g?.encodeAsHTML()}</g:link></li>
</g:each>
</ul>
<g:link controller="goods" action="create" params="['category1.id': category1Instance?.id]">${message(code: 'default.add.label', args: [message(code: 'goods.label', default: 'Goods')])}</g:link>

                                </td>
                            </tr>
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
