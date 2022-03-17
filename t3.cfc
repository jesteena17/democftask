<cfcomponent displayname="task3" hint="Display only mutiples of 3">
    <cffunction name="multiplesof3" output="false" access="public">
              <cfset variables.num = form.num/>
              <cfset variables.result = "" />
            <cfloop list = "#variables.num#" index = "itm">
                     <cfif itm mod 3 EQ 0>
                            <cfset variables.result&=itm&"<br>"/>
                     <cfelse>
                            <cfcontinue>
                     </cfif>
              </cfloop>
        <cfreturn variables.result>
    </cffunction>  
</cfcomponent>