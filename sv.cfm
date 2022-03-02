<form id="theform" name="theform" action="" method="post">
First Name <input type="text" name="first name">
Last Name <input type="text" name="last name">
Address <input type="text" name="address">
Age <input type="text" name="age">
<input type="submit" value="submit"/>
</form>

<cfoutput>
<cfloop collection="#form#" item="item">
<cfif item is not "fieldNames">
    #item# = #form[item]#<br>
</cfif>
</cfloop>

<cfloop index="i" list="#Form.FieldNames#" delimiters=",">
    #i# = #Form[i]#<br>
</cfloop>
</cfoutput>