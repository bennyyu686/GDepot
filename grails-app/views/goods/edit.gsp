

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'goods.label', default: 'Goods')}" />
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
            <g:hasErrors bean="${goodsInstance}">
            <div class="errors">
                <g:renderErrors bean="${goodsInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="post" >
                <g:hiddenField name="id" value="${goodsInstance?.id}" />
                <g:hiddenField name="version" value="${goodsInstance?.version}" />
                <div class="dialog">
                    <table>
                        <tbody>
                            <tr class="prop">
                            <td valign="top" class="name">
                                <label for="category">Category:</label>
                            </td>
                            <td valign="top" class="value ${hasErrors(bean:goodsInstance,field:'category','errors')}">
                                <g:select optionKey="id" optionValue="categoryName" from="${Category1.list()}" name="category.id" value="${goodsInstance?.category?.id}" ></g:select>
                            </td>
                           </tr>

                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="title"><g:message code="goods.title.label" default="Title" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: goodsInstance, field: 'title', 'errors')}">
                                    <g:textField name="title" value="${goodsInstance?.title}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="price"><g:message code="goods.price.label" default="Price" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: goodsInstance, field: 'price', 'errors')}">
                                    <g:textField name="price" value="${fieldValue(bean: goodsInstance, field: 'price')}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="description"><g:message code="goods.description.label" default="Description" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: goodsInstance, field: 'description', 'errors')}">
                                    <g:textArea name="description" value="${goodsInstance?.description}" />
                                </td>
                            </tr>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                  <label for="photoUrl"><g:message code="goods.photoUrl.label" default="Photo Url" /></label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean: goodsInstance, field: 'photoUrl', 'errors')}">
                                    <g:textField name="photoUrl" value="${goodsInstance?.photoUrl}" />
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
