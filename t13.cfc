<cfcomponent  displayname="Search">
     <cffunction name="SearchData" access="public" returnType="string" output="false">
          <cfset variables.sword=form.serch/>
          <cfset variables.result=form.origdata/>
          <cfset  variables.result = (FindNoCase(variables.sword, variables.result))? 
                              ReplaceNoCase(variables.result, variables.sword, '<span class="search">' &
                              Mid(variables.result, FindNoCase(variables.sword, variables.result),
                              Len(variables.sword)) & '</span>', 'all') : variables.result  /> 
          <cfreturn variables.result>    
     </cffunction>
</cfcomponent>
