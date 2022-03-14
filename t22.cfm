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
              <cfset data = '[{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}]' />
              <cfset desdata=DeserializeJSON(data)>
              <table border="1">
                  <tr>
                    <th>name</th>
                    <th>age</th>
                    <th>location</th>
                  </tr>
                  <cfloop array=#desdata# item="item">
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