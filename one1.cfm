<!--- // Create a page with text box & submit button. Input for the text box is any number   
//  between 1 to 5. Based upon the user input, you should show the corresponding string.
//  5 is Very good. 4 is good.
//   3 is fair. 
//   1 & 2 is Ok. 
//   Use cfif, cfelseif,cfelse to do this functionality. --->



<form action="" method="post">
    <input type="text" name="num"/>
    <input type="submit" value="submit" name="check"/>
</form>



<cfif structKeyExists(form,"check") and (cgi.request_method is "post")>
<cfdump var = "#form.num#" >
<cfset getnum ="#form.num#"  >
<cfoutput >
<cfif getnum EQ 5>
    very good
        
   
<cfelseif getnum EQ 4>
    good
      
<cfelseif getnum EQ 3>
    fair 
       
<cfelseif getnum EQ 1 or getnum EQ 2>
    ok
    <cfelse>
    enter number less than or equal to 5
</cfif>

 </cfoutput>
</cfif>