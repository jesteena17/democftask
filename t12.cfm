<form action="" method="post">
<input type="text" pattern="[1-5]{1}" title="Enter a number between 1-5" name="getnum" />
<input type="submit" name="sub" value="enter number"/>
</form>



<cfif (cgi.request_method is "post") and (structKeyExists(form,"sub"))>
    <cfset data =form.getnum>


</cfif>


<cfquery name = "singleemp" datasource = "mysqldsn" username = "root" password = "Password@123" >
 select * from task12 ; 
</cfquery>

<cfset edata = QueryGetRow(singleemp, #data#) >


 <cfoutput>
  Data of Entered number: <b> #edata.firstName#-#edata.lastName#</b><br>
</cfoutput> 


<cfquery name = "allemp" datasource = "mysqldsn" username = "root" password = "Password@123">
 select * from task12; 
</cfquery>
<table border="1">
<tr><th>firstname</th><th>lastname</th></tr>
 <cfoutput query="allemp" >
 <tr>  <td> #allemp.firstName#</td><td>#allemp.lastName#</td></tr>
</cfoutput> 
</table>