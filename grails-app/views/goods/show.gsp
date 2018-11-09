

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'goods.label', default: 'Goods')}" />
        <title><g:message code="default.show.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLink(uri: '/')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
            <span class="menuButton"><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></span>
        </div>
        <div class="body">
            <h1><g:message code="default.show.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
            <table>

                    <tbody>


                        <tr style="width:500px" class="prop">
                        <td valign="top" class="name">Title:</td>

                        <td valign="top" class="value">

                            ${fieldValue(bean:goodsInstance, field:'title')}
                        </td>

                        </tr>



                    <tr class="prop">
                        <td valign="top" class="name">Photo:</td>

                        <td valign="top" class="value"><img src="${resource(dir:'images',file:fieldValue(bean:goodsInstance,field:'photoUrl'))}" style="width:200px"/></td>

                        </tr>

                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="goods.id.label" default="Id" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: goodsInstance, field: "id")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="goods.title.label" default="Title" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: goodsInstance, field: "title")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="goods.price.label" default="Price" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: goodsInstance, field: "price")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="goods.description.label" default="Description" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: goodsInstance, field: "description")}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name"><g:message code="goods.photoUrl.label" default="Photo Url" /></td>
                            
                            <td valign="top" class="value">${fieldValue(bean: goodsInstance, field: "photoUrl")}</td>
                            
                        </tr>
                    
                    </tbody>
            </table>

            </div>
            <div class="buttons">
                <g:form>
                    <g:hiddenField name="id" value="${goodsInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
                    <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
