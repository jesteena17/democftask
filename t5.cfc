<cfcomponent displayname="task5" hint="age">
       <cffunction name="Age" output="false" access="public">
               <cfset variables.d1 = form.sdob/>
               <cfset variables.d2 = form.mdob/>
               <cfset variables.result = StructNew() />
               <cfset variables.sage = dateDiff("yyyy", variables.d1, now())>
               <cfset variables.mage = dateDiff("yyyy", variables.d2, now())>
               <cfset variables.mageatbirth = variables.mage-variables.sage>
               <cfset  StructInsert(variables.result, "sonage", variables.sage) />
               <cfset  StructInsert(variables.result, "momage", variables.mage) />
               <cfset  StructInsert(variables.result, "momageatbirth", variables.mageatbirth) />
              <cfreturn variables.result>
       </cffunction>  
</cfcomponent>