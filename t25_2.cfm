<cfinvoke component="t25" method="displaydata" returnvariable="result">
</cfinvoke>
<cfdump var = "#result#" >   
<table border="1" width="400"> <tr> <th width="50%">Word</th> <th>Count</th> </tr>
<cfloop  query="#result#">
     
      <cfoutput>
      <tr> <td >#result.allwords#</td> <td>#result.wordcount#</td> </tr> 
      </cfoutput> 
  </cfloop>
