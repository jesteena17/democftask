<!-- Create a page with text box & submit button. Input for the text box is any number between 1 to 5. Based upon the user input, you should show the corresponding string. 5 is Very good. 4 is good. 3 is fair. 1 & 2 is Ok. Use cfcase to do this functionality. -->



<form action="" method="post">
    <input type="text" name="num"/>
    <input type="submit" value="submit" name="check"/>
</form>


<cfif cgi.request_method is "post" and structKeyExists(form,"check")>
<cfset getnum="#form.num#">
<cfoutput>
    
<cfif #getnum# LE 5>
    <cfswitch expression="#getnum#">
    <cfcase value="5">very good</cfcase>
      <cfcase value="4">good</cfcase>
        <cfcase value="3">fair</cfcase>
    <cfdefaultcase>
    ok
    </cfdefaultcase>
</cfswitch>
<cfelse>
    enter number less than or equal to 5
</cfif>

</cfoutput>

    
</cfif>