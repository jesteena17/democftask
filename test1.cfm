<cfscript> 
/*
employee=StructNew(); 
if (IsDefined("Form.submit")) { 

if ((Form.key1 NEQ "") AND (Form.val1 NEQ ""))
 { 

employee[Form.key1]=Form.val1; 


} 

}
*/
</cfscript>




<form action="" method="post">
    <input type="text" name="key" placeholder="enter key"/>
    <input type="text" name="val" placeholder="enter val"/>
    <input type="submit" name="submit" value="getdata"/>
 </form>


<cfset full = "#form.key#"&'.'&"#form.val#">
<cfdump var="#full#"/>

<cfif full GT 1>
    <script>
    alert("success");
    </script>
<cfelse>
    
</cfif>


  
  myArray=listToArray(myList,";",false,true); // Using includeEmptyFields=false
       // Display array elements
       WriteDump(myArray);



<cfquery  datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
INSERT INTO t25(allwords)
VALUES (<cfqueryparam cfsqltype="cf_sql_varchar" value="#item#">)
</cfquery>