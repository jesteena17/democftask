<cfcomponent displayname="task2" hint="Grade number using switch case">
    <cffunction name="gradeNumber" output="false" access="public">
            <cfset var num = form.num/>
            <cfset var result = "" />
            <cfdump var="#num#">
            <cfif #num# LE 5>
                <cfswitch expression="#num#">
                    <cfcase value="5">very good</cfcase>
                    <cfcase value="4">good</cfcase>
                    <cfcase value="3">fair</cfcase>
                    <cfdefaultcase>ok</cfdefaultcase>
                </cfswitch>
            <cfelse>
                 enter number less than or equal to 5
            </cfif>
        <cfreturn result>
    </cffunction>  
</cfcomponent>