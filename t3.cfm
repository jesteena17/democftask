<!-- Create a page with text box & submit button. Input for the text box is "3,8,9,11,12"
While click on submit, result page should show numbers divided by 3. So the result      must be 3,9,12. Should use cfcontinue in the appropriate place.
 -->
<form action="" method="post">
    <input type="text" name="num"/>
    <input type="submit" value="submit" name="check"/>
</form>
<cfif cgi.request_method is "post">
 <cfparam name="form.num">
 <!-- <cfdump  var=#getnum#> -->
 
</cfif>

<cfparam name="form.num" default=[3,27,4,8,9,1,84] type="array">
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

