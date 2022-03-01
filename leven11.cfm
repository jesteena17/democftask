<cfscript> 

   function multiply() { 
var res=1;
      for (a in arguments)
             
             res=res*a;
      return res; 

   } 

</cfscript>

<cfset res = multiply(1,2)>
<cfdump var=#"inputs 1,2 "&res#><br>
<cfset res = multiply(1,2,3)>
<cfdump var=#res#><br>
<cfset res = multiply(1,2,3,4)>
<cfdump var=#res#>
