<cfcomponent displayname="task3" hint="Display only mutiples of 3">
    <cffunction name="multiplesof3" output="false" access="public">
            <cfset var num = form.num/>
            <cfset var result = "" />
            <cfdump var="#num#">
            <cfloop list = "#form.num#" index = "itm">
                     <cfif itm mod 3 EQ 0>
                            <cfdump var = "#itm#">
                     <cfelse>
                            <cfcontinue>
                     </cfif>
              </cfloop>
        <cfreturn result>
    </cffunction>  
</cfcomponent>