

<form action="" method="post">
    <input type="text" name="key1" placeholder="enter key"/>
    <input type="text" name="val1" placeholder="enter val"/>
    <input type="submit" name="getdata" value="getdata"/>
 </form>


 
<cfset emp= structNew()>

<cfif structKeyExists(form,"getdata") and (cgi.REQUEST_METHOD is "post")>
  

<cfset fArr = ArrayNew(1)>



<cfset  StructInsert(emp, #form.key1#, #form.val1# )> 
    
  <cfset cop= StructCopy(emp)>
      
<cfif StructIsEmpty(cop)>
<cfoutput>
  empty
</cfoutput>

<cfelse>
<cfoutput>
  not empty
</cfoutput>
  <cfset ArrayAppend(fArr,emp)>
  


 
<cfdump var = "#fArr#" >

</cfif>
</cfif>

  
