     <cfset  request.dsn="mysqldsn"/>
        <cfset  request.un="root"/>
        <cfset  request.pw="Password@123"/>
  
  <form action="" method="post">
    <textarea  name="stringdata" rows="5" cols="55">India is huge country. India has 29 states. Indians are nice. It has a nice climate.</textarea>
    <input type="submit" value="submit" name="store"/>
</form>



<cfif structKeyExists(form,"store") and (cgi.request_method is "post")>

<cfset  myArray=listToArray(REReplaceNoCase(#form.stringdata#, "[^ A-Z]", "", "All")," ",false,true)/>

<cfloop array="#myArray#" item="item" index="index">

<cfquery  datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="res">
     
INSERT INTO t25(allwords) VALUES("#item#");

</cfquery>
</cfloop>
 
<cfdump var="#res.SQL#">
<!--
<cfoutput >
#item#[#index#]<br>
</cfoutput>
-->

</cfif>
  