<!-- Create a page with text box & submit button. Input for the text box is "3,8,9,11,12"
While click on submit, result page should show numbers divided by 3. So the result      must be 3,9,12. Should use cfcontinue in the appropriate place.
 -->




<form action="" method="post">
    <input type="text" name="num"/>
    <input type="submit" value="submit" name="check"/>
</form>


<cfif cgi.request_method is "post" and structKeyExists(form,"check")>
<cfset getnum="#form.num#">
 <!-- <cfdump  var=#getnum#> -->

    

<cfloop list = "#form.num#" index = "itm">
   <cfoutput>
       
   
    <cfif itm mod 3 EQ 0>
        <cfdump var = "#itm#">
    <cfelse>
          <cfcontinue>
    </cfif>
    </cfoutput>
</cfloop>


    
</cfif>