
    <form action="" method="post">
    <input type="text" name="key1" value="jame" placeholder="enter key"/>
    <input type="text" name="value1" value="it" placeholder="enter val"/>
    <input type="submit" name="submits" value="getdata"/>
 </form>
     

    <cfset   fArr = ArrayNew(1)/>
 
    <cfset fcount = 1>
<cfif StructKeyExists(form, "submits")>


     <cfset st=StructNew()/>
    <cfset StructInsert(#st#, #form.key1#, #form.value1# ,true)>

 <cfset fArr[fcount] = #st#>



    
    
</cfif>
<cfset fcount = fcount + 1>
<cfdump var="#fArr#">



<cfif >
      <cfset st=StructNew()/>
    <cfset StructInsert(#st#, #form.key1#, #form.value1# ,true)>

 <cfset fArr[fcount] = #st#>
 <cfset st=StructNew()/>
 <cfset StructInsert(#st#, #form.key1#, #form.value1# ,true)>

<cfset fArr[fcount] = #st#>
   <cfset st=StructNew()/>
    <cfset StructInsert(#st#, #form.key1#, #form.value1# ,true)>

 <cfset fArr[fcount] = #st#>
<cfelse>
   
</cfif>