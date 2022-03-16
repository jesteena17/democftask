<cfparam name="form.num" default=5 type="integer">
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
                 <cfinvoke component="t2" method="gradeNumber" returnvariable="result"></cfinvoke>
                 #result#
            </cfif>
        </cfoutput>   
    </body>
</html>
