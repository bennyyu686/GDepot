

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create User</title>         
    </head>
    <body>
        <div class="nav">
            
            <span class="menuButton"><g:link class="list" action="login"><g:message code="login"/></g:link></span>
        </div>
        <div class="body">
            <h1>Create User</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors model="${[user:user,cmd:cmd]}">
            <div class="errors">
                <g:renderErrors  model="${[user:user,cmd:cmd]}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="userName">${message( code:"userName" )}:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user ,field:'userName','errors')}">
                                    <input type="text" maxlength="10" id="userName" name="userName" value="${fieldValue(bean:user,field:'userName')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="password"/>:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user,field:'password','errors')}">
                                    <input type="password" maxlength="30" id="password" name="password" value="${fieldValue(bean:user,field:'password')}"/>
                                </td>
                            </tr> 
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password"><g:message code="password.again"/>:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:cmd,field:'passwordAgain','errors')}">
                                    <input type="password" maxlength="30" id="password" 
                                    	name="passwordAgain" value="${fieldValue(bean:cmd,field:'passwordAgain')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user,field:'email','errors')}">
                                    <input type="text" id="email" name="email" value="${fieldValue(bean:user,field:'email')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="phone">Phone:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user,field:'phone','errors')}">
                                    <input type="text" id="phone" name="phone" value="${fieldValue(bean:user,field:'phone')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="address">Address:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user, field:'address','errors')}">
                                	<textarea name="address" id="address">${fieldValue(bean:user,field:'address')}</textarea>
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
