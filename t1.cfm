<cfparam name="form.num" default=3 type="integer">
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
                 <cfinvoke component="t1" method="gradeNumber" returnvariable="result"></cfinvoke>
                 #result#
            </cfif>
        </cfoutput>   
    </body>
</html>
