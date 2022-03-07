







  
  <form action="" method="post">
    <textarea  name="stringdata" rows="5" cols="55">India is huge country. India has  states. Indians are nice. It has a nice climate.i love india and its climate. climate is awesome</textarea>
    <input type="submit" value="submit" name="store"/>
</form>



<cfif structKeyExists(form,"store") and (cgi.request_method is "post")>
<!--
<cfsavecontent variable="string"> India is huge country. India has  states. Indians are nice. It has a nice climate.i love india and its climate. climate is awesome </cfsavecontent>
 <cfset words = reMatch("[[:word:]]+", string)> -->
<cfset words=listToArray(REReplaceNoCase(#form.stringdata#, "[^ A-Z]", "", "All")," ",false,true)/>
<cfset wordCount = structNew("ordered")>
<cfloop index="index" array="#words#">
 <cfif structKeyExists(wordCount, index)>
  <cfset wordCount[index]++>
 <cfelse>
  <cfset wordCount[index] = 1>
   </cfif> 
</cfloop>
<!-- <cfset sorted = structSort(wordCount, "numeric", "desc")> -->


<cfdump var = "#wordCount#">



<cfloop item="index" collection="#wordCount#">
  <cfinvoke component="t25" method="insertData" returnvariable="result">
   
    <cfinvokeargument name="word" value="#index#"/> 
    <cfinvokeargument name="count" value="#wordCount[index]#"/> 
   
</cfinvoke>

</cfloop>


<cfif result GT 0>
    <script>
    alert("Data Addedd Successfully");
    </script>
    <cfelse>
     <script>
    alert("error adding dupliacte records");
    </script>
</cfif>





</cfif>