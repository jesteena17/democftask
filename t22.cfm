<html>
    <head>
    </head>
    <body>
          <cfoutput>
              <p>Qn.
                      Show the below json info in table format.Json:
                      [{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}] 
                      Table format:
                      Name 		Age 		Location
                      Saravanan	27		Dubai
                      Ram		26		Kovilpatti ? 
              </p>
              <cfinvoke component="t20" method="printjson" returnvariable="result"></cfinvoke>
              <table border="1">
                    <tr>
                         <th>name</th>
                         <th>age</th>
                         <th>location</th>
                    </tr>
                    <cfloop array=#result# item="item">
                              <tr>
                              <td>#item.name#</td>
                              <td>#item.age#</td>
                              <td>#item.location#</td>
                              </tr>
                    </cfloop>
              </table>
          </cfoutput>
    </body>
</html>