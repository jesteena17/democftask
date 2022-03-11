
<cfcomponent>
       
        <cffunction name="displaydata" access="remote" returnType="query" output="false">
        <cfquery  name="getdata"  datasource = "mysqldsn" >
                select * from t25;
       
        </cfquery>
          <cfdump var="getdata">
        <cfreturn getdata>    
        </cffunction>



        <cffunction name="insertData" access="remote" returnType="string" returnformat="plain" output="false">
            <cfargument name="word" type="struct" required="true">
       <cfdump var="#word#">
            <cfset var returnStg = "">
          <cfquery  name="addUser"  datasource = "mysqldsn"  result="addResult">
                    <cfloop item="index" collection="#arguments.word#"> 
                        insert into t25 (allwords,wordcount)
                        values(
                    <cfqueryparam value="#index#" cfsqltype="cf_sql_varchar" > ,
                    <cfqueryparam value="#arguments.word[index]#" cfsqltype="cf_sql_integer" > 
                            )
                            </cfloop>
            </cfquery>
            <cfdump var="#addResult.SQL#">
            <cfset getNumberOfRecords = #addResult.recordCount#> 
            <cfif getNumberOfRecords GT 0 >
            <cfset returnStg = true>
            <cfelse>
                <cfset returnStg = false>
            </cfif>   
            <cfreturn returnStg>  
        </cffunction>
</cfcomponent>
