
<cfsavecontent variable="string"> India is huge country. India has  states. Indians are nice. It has a nice climate.i love india and its climate. climate is awesome </cfsavecontent>
<!-- <cfset words = reMatch("[[:word:]]+", string)> -->
<cfset words=listToArray(REReplaceNoCase(#string#, "[^ A-Z]", "", "All")," ",false,true)/>
<cfset wordCount = structNew()>
<cfloop index="index" array="#words#"> <cfif structKeyExists(wordCount, index)> <cfset wordCount[index]++> <cfelse> <cfset wordCount[index] = 1> </cfif> </cfloop>


<cfset sorted = structSort(wordCount, "numeric", "desc")>
<table border="1" width="400"> <tr> <th width="50%">Word</th> <th>Count</th> </tr>

<cfif #wordCount[index]# GTE 3>
       <cfset style="color:green;font-size:15pt;" > 
    <cfelseif #wordCount[index]#  GTE 2 and wordCount[index] LTE 3 >
         <cfset style="color:orange;font-size:15pt;" > 
         <cfelse>
          <cfset style="color:red;font-size:15pt;" > 
    </cfif>

<!--
    
<cfloop index="index" array="#sorted#">
 <cfoutput>
  <tr> <td style="#style#">#index#</td> <td  style="#style#">#wordCount[index]#</td> </tr> </cfoutput> </cfloop>

-->



<cfloop index="index" array="#sorted#">
  <cfinvoke component="t25_1" method="insertData" returnvariable="result">
   
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


<!--



    
<cfloop index="index" array="#sorted#">
 <cfoutput>
  <tr> <td style="#style#">#index#</td> <td  style="#style#">#wordCount[index]#</td> </tr> </cfoutput> </cfloop>


<table border="1" width="400"> <tr> <th width="50%">Word</th> <th>Count</th> </tr>

<cfif #wordCount[index]# GTE 3>
       <cfset style="color:green;font-size:15pt;" > 
    <cfelseif #wordCount[index]#  GTE 2 and wordCount[index] LTE 3 >
         <cfset style="color:orange;font-size:15pt;" > 
         <cfelse>
          <cfset style="color:red;font-size:15pt;" > 
    </cfif>

        <cfloop query = "getallwords" >
            <cfoutput>

    <cfif #getallwords.wordcount# GT 3>
       <cfset style="color:green;font-size:15pt;" > 
    <cfelseif #getallwords.wordcount# GT 2>
         <cfset style="color:green;font-size:15pt;" > 
         <cfelse>
          <cfset style="color:green;font-size:15pt;" > 
    </cfif>
<span  style="#style#"> 
  #getallwords.allwords#(#getallwords.wordcount#)</span><br>


             
            </cfoutput>
        </cfloop>



-->