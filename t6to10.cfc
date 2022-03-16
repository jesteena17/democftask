<cfcomponent displayname="task6to10" hint="Structexamples">
       <cffunction name="Structex1" output="false" access="public">
                       <cfset variables.d1 = form.key1/>
                       <cfset variables.d2 = form.val1/>
                       <cfset variables.result = StructNew() />
                       <cfset  StructInsert(variables.result, variables.d1, variables.d2) />
              <cfreturn variables.result>
       </cffunction>  
</cfcomponent>