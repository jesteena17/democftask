<cfcomponent>
         <cfset  request.dsn="mysqldsn"/>
        <cfset  request.un="root"/>
        <cfset  request.pw="Password@123"/>
<cffunction name="checkEmail" access="remote" returnType="string" returnformat="plain" output="false">
     <cfargument name="username" required="true">
   
    <cfset var returnStg = "">
    
        <cfquery  name="validateUser"  datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="tmpResult">
            SELECT email FROM t24 WHERE email=<cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" maxlength="255"> 

        </cfquery>
         <!--  <cfdump var="#tmpResult.SQL#">
        <cfdump var="#tmpResult.SQLParameters#"> -->
        <cfif validateUser.RecordCount EQ 1>
       <cfset returnStg = true>
        <cfelse>
            <cfset returnStg = false>
        </cfif>
        
    <cfreturn returnStg>    
</cffunction>
    

<cffunction name="insertData" access="remote" returnType="string" returnformat="plain" output="false">
    <cfargument name="fullname" required="true">
     <cfargument name="username" required="true">
   
    <cfset var returnStg = "">
    
        <cfquery  name="addUser"  datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="addResult">
          
insert into t24(firstname,email) values(
    <cfqueryparam value="#arguments.fullname#" cfsqltype="cf_sql_varchar" maxlength="255"> ,
    <cfqueryparam value="#arguments.username#" cfsqltype="cf_sql_varchar" maxlength="255"> 
)
        </cfquery>
         <cfset getNumberOfRecords = #addResult.recordCount#> 
        <cfif getNumberOfRecords GT 0 >
       <cfset returnStg = true>
        <cfelse>
            <cfset returnStg = false>
        </cfif>
        
    <cfreturn returnStg>    
</cffunction>


</cfcomponent>