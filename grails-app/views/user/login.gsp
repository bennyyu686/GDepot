

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create User</title>         
    </head>
    <body>
        <div class="nav">
            
            <span class="menuButton"><g:link class="list" action="register"><g:message code="register"/></g:link></span>
        </div>
        <div class="body">
            <h1>Login</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
           
            <g:form action="loginCheck" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="email">Email:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user,field:'userName','errors')}">
                                    <input type="text" id="email" name="email" />
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="password">Password:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:user,field:'password','errors')}">
                                    <input type="password" maxlength="30" id="password" name="password" />
                                </td>
                            </tr> 
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Login" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
