

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Search Goods</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${createLinkTo(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Goods List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Goods</g:link></span>
        </div>
        <div class="body">
            <h1>Search Goods</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${goods}">
            <div class="errors">
                <g:renderErrors bean="${goods}" as="list" />
            </div>
            </g:hasErrors>
            <g:form method="get" action="search" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="category">Category:</label>
                                </td>
                                <td valign="top">
                                    <g:select optionKey="categoryName"  from="${ Category1.list() }" name="categoryName"
                                    	noSelection="${['':'']}" ></g:select>
                                </td>
                            </tr>
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" >
                                    <input type="text" id="title" name="title" />
                                </td>
                            </tr>  
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="description">Description:</label>
                                </td>
                                <td valign="top" >
                                    <textarea id="description" name="description"></textarea>
                                </td>
                            </tr> 
                        
                            
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="price">Price:</label>
                                </td>
                                <td valign="top" >
                                    <input type="text" id="price1" name="price1" /> To:
                                    <input type="text" id="price2" name="price2" />
                                </td>
                            </tr> 
                        
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input type="submit" class="save" value="Search" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
