<html>
  <head>
  </head>
  <body>
    <form action="" method="post">
      <input type="text" pattern="[1-5]{1}" title="Enter a number between 1-5" name="getnum" />
      <input type="submit" name="sub" value="enter number"/>
    </form>
    <cfif (cgi.request_method is "post") and (structKeyExists(form,"sub"))>
      <cfset data =form.getnum>
      <cfinvoke component="t12" method="displaydata" returnvariable="result"></cfinvoke>
      <cfset edata = QueryGetRow(result, #data#) >
      <cfdump var="Data of Entered number:  #edata.firstName#  -  #edata.lastName#">
      <br>
      <table border="1">
        <tr>
          <th>firstname</th>
          <th>lastname</th>
        </tr>
        <cfoutput query="result" >
          <tr> 
            <td> #result.firstName#</td>
            <td>#result.lastName#</td>
          </tr>
        </cfoutput> 
      </table>
    </cfif>     
  </body>
</html>


