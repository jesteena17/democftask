<cfcomponent> 
     <cffunction name="displaydata" access="public" returnType="query" output="false">
               <cfquery  name="local.getdata">
                    select * from t25 where length(allwords)>=3 group by 
                    wordcount,allwords order by wordcount desc,length(allwords) desc,allwords asc;
               </cfquery>
          <cfreturn getdata>    
     </cffunction>

     <cffunction name="insertData" access="public" returnType="string" returnformat="plain" output="false">
          <cfargument name="word" required="true">
          <cfargument name="count" required="true"> 
          <cfset variables.returnStg = "">
          <cfquery  name="local.addUser"  result="addResult">
                    insert into t25 (allwords,wordcount)
                    values(
                              <cfqueryparam value="#arguments.word#" cfsqltype="cf_sql_varchar" > ,
                              <cfqueryparam value="#arguments.count#" cfsqltype="cf_sql_integer" > 
                         );
          </cfquery>
          <cfset variables.getNumberOfRecords = #addResult.recordCount#> 
          <cfif variables.getNumberOfRecords GT 0 >
               <cfset variables.returnStg = true>
          <cfelse>
               <cfset variables.returnStg = false>
          </cfif>   
          <cfreturn variables.returnStg>    
     </cffunction>
     
     <cffunction name = "addcount" returnType = "struct" access = "public" >
          <cfargument name="inputdata" required="true">
          <cfset words=listToArray(REReplaceNoCase(arguments.inputdata, "[^ A-Z]", "", "All")," ",false,false)/>
          <cfset variables.wordCount = structNew("ordered")/>
          <cfloop index="index" array=#variables.words#>
               <cfif len(index) GTE 3>
                    <cfif structKeyExists(variables.wordCount, index)>
                         <cfset variables.wordCount[index]++ />
                    <cfelse>
                         <cfset variables.wordCount[index] = 1/>
                    </cfif> 
               </cfif>
          </cfloop> 
          <cfreturn  variables.wordCount> 
     </cffunction>
</cfcomponent>





