<cfparam name="form.getnum" default=4 type="integer">
<html>
      <head>
      </head>
      <body>
          <cfoutput>
               <form action="" method="post">
                    <input type="text" pattern="[1-5]{1}" title="Enter a number between 1-5" value="#form.getnum#" name="getnum" />
                    <input type="submit" name="sub" value="enter number"/>
               </form>
               <cfif (structKeyExists(form,"sub"))>
                    <cfinvoke component="t12" method="displaydata" returnvariable="result"></cfinvoke>
                    <cfset edata = QueryGetRow(result, form.getnum) >
                    <cfdump var="Data of Entered number:  #edata.firstName#  -  #edata.lastName#">
                    <br>
                    <table border="1">
                        <tr>
                            <th>firstname</th>
                            <th>lastname</th>
                        </tr>
                        <cfloop query="result" >
                              <tr> 
                                   <td> #result.firstName#</td>
                                   <td>#result.lastName#</td>
                              </tr>
                        </cfloop> 
                    </table>
               </cfif> 
          </cfoutput>    
      </body>
</html>

