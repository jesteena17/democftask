<cfparam name="form.num" default="3,27,4,8,9,1,84" type="string">
<html>
    <head>
    </head>
    <body>
        <cfoutput>            
            <form action="" method="post">
                <input type="text" name="num" value="#form.num#"/>
                <input type="submit" value="submit" name="check"/>
            </form>
            <cfif structKeyExists(form,"check")>
                 <cfinvoke component="t3" method="multiplesof3" returnvariable="result"></cfinvoke>
                 #result#
            </cfif>
        </cfoutput>   
    </body>
</html>

