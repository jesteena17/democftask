<html>
    <head>
    </head>
    <body>
          <cfoutput>
               <p>           
                    Need to create a query data type variable manually with out using cfquery tag. Need to use neccesary query functions.
                    Query will have 3 columns
                    ID - Number 
                    Name - String
                    email	- String
                    This Query variable should have 3 rows of data.
               </p>
               <cfinvoke component="t15" method="t18querydb" returnvariable="result"></cfinvoke>
               <table border=1>
                    <tr>
                         <th>id</th>
                         <th>name</th>
                         <th>email</th>
                    </tr>
                    <cfloop Query="result">
                         <tr>
                              <td>#result.id#</td>
                              <td>#result.name#</td>
                              <td>#result.email#</td>
                         </tr>
                    </cfloop>
               </table>
          </cfoutput> 
    </body>
</html>