<cfcomponent>
        <cffunction name="displaydata" access="remote" returnType="query" output="false">
               <cfquery  name="getdata"     >
                    select * from t26 where length(allwords)>=3 group by wordcount,allwords order by wordcount desc,length(allwords) desc,allwords asc;
               </cfquery>
            <cfreturn getdata>    
        </cffunction>
        <cffunction name="insertData" access="remote" returnType="string" returnformat="plain" output="false">
                    <cfargument name="word" required="true">
                    <cfargument name="count" required="true">   
                    <cfset variables.returnStg = "">   
                    <cfquery  name="addUser"     result="addResult">
                         insert into t26 (allwords,wordcount) 
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
                    <cfset variables.thisPath = expandPath('.') & '/myUploads/'>
                    <cfset variables.f_dir = GetDirectoryFromPath(variables.thisPath)>
                    <cftry>
                        <cffile action="upload" filefield="FiletoUpload"
                        destination="#variables.f_dir#"
                        accept="text/plain"
                        strict="true"
                        result="uploadResult"
                        mode="777"
                        nameconflict="makeunique">
                         <cfcatch type="any">
                              <cfif FindNoCase( "No data was received in the uploaded", cfcatch.message )>
                                    <cfabort showerror="Zero length file">
                              <cfelseif FindNoCase( "The MIME type or the Extension of the uploaded file", cfcatch.message )>
                                    <cfabort showerror="Invalid file type">
                              <cfelseif FindNoCase( "did not contain a file.", cfcatch.message )>
                                    <cfabort showerror="Empty form field">
                              <cfelse>
                                    <cfabort showerror="Unhandled File Upload Error">
                               </cfif>
                         </cfcatch>
                    </cftry>
                    <cfif uploadResult.fileWasSaved>
                        <cfset myfile = FileRead("#f_dir#/#uploadResult.serverFile#")/>
                        <cfset variables.words=listToArray(REReplaceNoCase(#myfile#, "[^ A-Z]", "", "All")," ",false,false)/>
                        <cfset variables.wordCount = structNew("ordered")/>
                        <cfloop index="index" array="#variables.words#">
                              <cfif len(#index#) GTE 3>
                                        <cfif structKeyExists(variables.wordCount, index)>
                                                  <cfset variables.wordCount[index]++ />
                                        <cfelse>
                                                  <cfset variables.wordCount[index] = 1/>
                                        </cfif> 
                              </cfif>
                        </cfloop>
                    </cfif>
               <cfreturn  variables.wordCount> 
        </cffunction>
</cfcomponent>





