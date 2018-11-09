

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="main" />
        <g:set var="entityName" value="${message(code: 'goods.label', default: 'Goods')}" />
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

                    </thead>
                    <tbody>
                    <g:each in="${goodsInstanceList}" status="i" var="goodsInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                            <td style="width:210px"><img src="${resource(dir:'images',file:fieldValue(bean:goodsInstance,field:'photoUrl'))}" style="width:200px"/></td>

                            <td style="width:500px">
                                <g:link action="show" id="${goodsInstance.id}">${fieldValue(bean:goodsInstance, field:'title')}</g:link><br/>
                                Category: ${goodsInstanceList.category.categoryName}<br/><br/>
                                ${fieldValue(bean:goodsInstance, field:'description')}<br/><br/>
                                Price: ${fieldValue(bean:goodsInstanceList, field:'price')}
                            </td>

                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${goodsInstanceList.totalCount}" params="${params}" />
            </div>
        </div>
    </body>
</html>
