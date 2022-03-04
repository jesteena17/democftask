
<!--
Show the below json info in table format.
Json:
[{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}] 
Table format:
Name 		Age 		Location
Saravanan	27		Dubai
Ram		26		Kovilpatti
-->


<cfscript>




</cfscript>


<cfset data = [{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}] />

<cfoutput>
<table border="1">
<tr><th>name</th><th>age</th><th>location</th></tr>
<cfloop array=#data# item="item">

  <tr>
  <td>#item.name#</td>
  <td>#item.age#</td>
  <td>#item.location#</td>
  </tr>
</cfloop>
</table>
</cfoutput>