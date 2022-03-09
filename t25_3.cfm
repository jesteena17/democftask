<cfinvoke component="t25" method="displaydata" returnvariable="result">
</cfinvoke>
<cfdump var = "#result#" >   
<table border="1" width="400"> <tr> <th width="50%">Word</th> <th>Count</th> </tr>
<cfloop  query="#result#">
      <cfif #result.wordcount# GTE 3>
            <cfset style="color:green;font-size:25pt;" > 
         <cfelseif #result.wordcount#  GTE 2 and result.wordcount LTE 3 >
               <cfset style="color:orange;font-size:20pt;" > 
         <cfelse>
               <cfset style="color:red;font-size:16pt;" > 
      </cfif>
      <cfoutput>
      <tr> <td style="#style#">#result.allwords#</td> <td  style="#style#">#result.wordcount#</td> </tr> 
      </cfoutput> 
  </cfloop>
