<cfcomponent displayname="task1" hint="Grad enumber using if else">
    <cffunction name="gradeNumber" output="false" access="public">
          <cfset variables.num = form.num/>
          <cfset variables.result = "" />
          <cfif variables.num eq 5>
               <cfset   variables.result = "Very Good" >
          <cfelseif variables.num eq 4>
               <cfset   variables.result = "Good" >
          <cfelseif variables.num eq 3>
               <cfset variables.result = "Fair" >
          <cfelse>
               <cfset variables.result = "Ok" >
          </cfif>
        <cfreturn variables.result>
    </cffunction>  
</cfcomponent>