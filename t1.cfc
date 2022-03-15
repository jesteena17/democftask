<cfcomponent displayname="task1" hint="Grad enumber using if else">
    <cffunction name="gradeNumber" output="false" access="public">
            <cfset var num = form.num/>
            <cfset var result = "" />
            <cfif num eq 5>
                <cfset var result = "Very Good" >
            <cfelseif num eq 4>
                <cfset var result = "Good" >
            <cfelseif num eq 3>
                <cfset var result = "Fair" >
            <cfelse>
                <cfset var result = "Ok" >
            </cfif>
        <cfreturn result>
    </cffunction>  
</cfcomponent>