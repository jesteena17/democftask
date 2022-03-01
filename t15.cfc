<cfcomponent>
 <cffunction name="multiply"> 
   <cfset res = 1>   
    <cfloop collection="#Arguments#" item="argument">    
      <cfset res = res * Arguments[argument]>  
        </cfloop> 
           <cfreturn res> 
            </cffunction>   
         



</cfcomponent>