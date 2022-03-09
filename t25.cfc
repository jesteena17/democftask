<cfcomponent>
        <cfset  request.dsn="mysqldsn"/>
        <cfset  request.un="root"/>
        <cfset  request.pw="Password@123"/>
        <cffunction name="displaydata" access="remote" returnType="query" output="false">
        <cfquery  name="getdata"  datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#">
                select * from t25 where length(allwords)>=3 group by 
                wordcount,allwords order by wordcount desc,length(allwords) desc,allwords asc;
        </cfquery>
        <cfreturn getdata>    
        </cffunction>
        <cffunction name="insertData" access="remote" returnType="string" returnformat="plain" output="false">
            <cfargument name="word" required="true">
            <cfargument name="count" required="true"> 
            <cfset var returnStg = "">
            <cfquery  name="addUser"  datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="addResult">
                        insert into t25 (allwords,wordcount)
                        values(
                    <cfqueryparam value="#arguments.word#" cfsqltype="cf_sql_varchar" > ,
                    <cfqueryparam value="#arguments.count#" cfsqltype="cf_sql_integer" > 
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





