<cfcomponent displayname="task2" hint="Grade number using switch case">
    <cffunction name="gradeNumber" output="false" access="public">
          <cfset variables.num = form.num/>
          <cfset variables.result = "" />
          <cfdump var="#num#">
          <cfif num LE 5>
               <cfswitch expression="#variables.num#">
                    <cfcase value="5"><cfset variables.result = "Very Good"></cfcase>
                    <cfcase value="4"> <cfset variables.result = "Good"></cfcase> 
                    <cfcase value="3"><cfset variables.result = "Fair"></cfcase>
                    <cfdefaultcase><cfset variables.result = "Ok"></cfdefaultcase> 
               </cfswitch>
          <cfelse>
               <cfset variables.result="enter number less than or equal to 5"/>
          </cfif>
        <cfreturn variables.result>
    </cffunction>  
</cfcomponent>