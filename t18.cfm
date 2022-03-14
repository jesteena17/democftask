
<html>
    <head>
    </head>
    <body>
        <cfscript>
        WriteOutput(" <p>Need to create a query data type variable manually with out using cfquery tag. Need to use neccesary query functions.
          Query will have 3 columns
          ID - Number 
          Name - String
          email	- String
          This Query variable should have 3 rows of data.
        </p>");
            qoptions = {  } ;
            myresults=QueryExecute(("SELECT id,name,email FROM task19" ),[],qoptions);
            //  WriteDump(myResult);
            writeOutput("<table border=1>
            <tr>
            <th>id</th>
            <th>name</th>
            <th>email</th>
            </tr>");
              for(myresult in myresults)
              {
              WriteOutput("<tr>
              <td>"&myresult.id&"</td>
              <td>"&myresult.name&"</td>
              <td>"&myresult.email&"</td>
              </tr>");
              }
            writeOutput("</table>");
          // QueryExecute return type default query 
          qoptions = {result="myresult",  } ;
          myquery = QueryExecute("select * from task19", [] ,qoptions); 
          for(r in myquery)
          {
              writeOutput(r.id &" ") ;
              writeOutput(r.name &" "); 
              writeOutput(r.email &"<br>") ;
          }
        </cfscript>
    </body>
</html>