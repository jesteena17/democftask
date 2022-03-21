<cfcomponent>
    <cffunction name="checkEmail" access="remote" returnType="string" returnformat="plain" output="false">
          <cfargument name="username" required="true">
          <cfset variables.returnStg="">
          <cfquery name="validateUser"   result="tmpResult">
               SELECT email FROM t24 
               WHERE email=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar">;
          </cfquery>
          <cfif tmpResult.RecordCount GTE 1>
               <cfset variables.returnStg="true">
          <cfelse>
               <cfset variables.returnStg="false">
          </cfif>
          <cfreturn variables.returnStg>
    </cffunction>
    
    <cffunction name="insertData" access="remote" returnType="string" returnformat="plain" output="false">
          <cfargument name="fullname" required="true">
          <cfargument name="username" required="true">
          <cfset variables.returnStg="">
          <cfquery name="addUser"   result="addResult">
               insert into t24(firstname,email) 
               values(
                         <cfqueryparam value="#arguments.fullname#" cfsqltype="cf_sql_varchar" maxlength="255"> ,
                         <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" maxlength="255">
                    );
          </cfquery>
          <cfset variables.getNumberOfRecords=#addResult.recordCount#>
          <cfif variables.getNumberOfRecords GT 0>
               <cfset variables.returnStg="true">
          <cfelse>
               <cfset variables.returnStg="false">
          </cfif>
          <cfreturn variables.returnStg>
    </cffunction>
</cfcomponent>