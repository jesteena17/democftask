

<form action="" method="post">
    <input type="text" name="key1" placeholder="enter key"/>
    <input type="text" name="val1" placeholder="enter val"/>
    <input type="submit" name="getdata" value="getdata"/>
 </form>

<CFSET allemployee=ArrayNew(1)>

  <CFSET employee=StructNew()>
<cfif structKeyExists(form,"getdata") and (cgi.REQUEST_METHOD is "post")>
  
    
  
        <CFSET structInsert(employee, "#form.key1#", "#form.val1#",false)/>
   <CFSET ArrayAppend(allemployee,employee )/>

      <cfloop array="#allemployee#" item="item">
 <cfdump var="#allemployee#"/>
</cfloop>


</cfif>

