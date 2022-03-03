<!-- 

Need to create a query data type variable manually with out using cfquery tag. Need to use neccesary query functions.
Query will have 3 columns
 ID - Number 
 Name - String
 email	- String
This Query variable should have 3 rows of data.

-->


<cfscript>
  qoptions = { datasource="mysqldsn"} 
       myresult=QueryExecute(("SELECT id,name,email FROM task19" ),[],qoptions);
       WriteDump(myResult);
</cfscript>
 <cfoutput>
<table border="1"><tr><th>id</th><th>name</th><th>email</th></tr>
<cfloop query = "#myresult#" >
<tr><td>#myresult.id#</td><td>#myresult.name#</td><td>#myresult.email#</td></tr>
</cfloop> 
</table>  
</cfoutput>  
<cfscript> 
  // QueryExecute return type default query 
  qoptions = {result="myresult", datasource="mysqldsn"} 
  myquery = QueryExecute("select * from task19", [] ,qoptions); 
 for(r in myquery){
  writeOutput(r.id &" ") 
  writeOutput(r.name &" ") 
  writeOutput(r.email &"<br>") 
 }
</cfscript>