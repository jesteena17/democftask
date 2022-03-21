<cfcomponent  displayname="EmployeesData">
     <cffunction name = "uploadfile" returnType = "any"  access = "public">
               <cfset variables.validMimeTypes =  {
                                             'application/pdf': {extension: 'pdf', application: 'Adobe Acrobat'}
                                             ,'application/msword': {extension: 'doc', application: 'Word (97-2003)'}
                                             ,'application/vnd.openxmlformats-officedocument.wordprocessingml.document': {extension: 'docx', application: 'Word (2007)'}
                                                  } />
               <cfset variables.thisPath=expandPath('.') & '/empResumes/'>
               <cfset variables.f_dir=GetDirectoryFromPath(variables.thisPath)>
               <cftry>
                    <cffile action="upload" filefield="FiletoUpload" destination="#variables.f_dir#" mode="777"
                         accept="#StructKeyList(variables.validMimeTypes)#" strict="true" result="uploadResult"
                         nameconflict="makeunique">
                    <cfcatch type="any">
                         <cfif FindNoCase( "No data was received in the uploaded" , cfcatch.message )>
                              <cfabort showerror="Zero length file">
                         <cfelseif FindNoCase( "The MIME type or the Extension of the uploaded file", cfcatch.message )>
                              <cfabort showerror="Invalid file type">
                         <cfelseif FindNoCase( "did not contain a file." , cfcatch.message )>
                              <cfabort showerror="Empty form field">
                         <cfelse>
                              <cfabort showerror="Unhandled File Upload Error">
                         </cfif>
                    </cfcatch>
               </cftry>
          <cfreturn uploadResult>
     </cffunction>     
     <cffunction name = "storeemployeeinfo" returnType = "numeric"  access = "public">
               <cfargument name="cfname" required="true" >
               <cfargument name="clname" required="true" >
               <cfargument name="cemail" required="true" >
               <cfargument name="phone" required="true" >
               <cfargument name="joindate" required="true" >
               <cfargument name="jobposition" required="true" >
               <cfargument name="site" required="true" >
               <cfargument name="resumefile" required="true" >
               <cfargument name="salary" required="true" >
               <cfargument name="relocate" required="true" >
               <cfquery name = "addemployee"  result="myaddResult">
                    insert into employeeinfo(firstname,lastname,email,contact,joindate,jobpost,portfolio,uploadedresume,salary,relocate) 
                    values (    
                              <cfqueryparam value = "#arguments.cfname#" cfsqltype = "cf_sql_varchar"/>,
                              <cfqueryparam value = "#arguments.clname#" cfsqltype = "cf_sql_varchar"/>,
                              <cfqueryparam value = "#arguments.cemail#" cfsqltype = "cf_sql_varchar"/>,
                              <cfqueryparam value = "#arguments.phone#" cfsqltype = "cf_sql_varchar"/>,
                              <cfqueryparam value = "#arguments.joindate#" cfsqltype = "cf_sql_date"/>,
                              <cfqueryparam value = "#arguments.jobposition#" cfsqltype = "cf_sql_varchar"/>,
                              <cfqueryparam value = "#arguments.site#" cfsqltype = "cf_sql_varchar"/>,
                              <cfqueryparam value = "#arguments.resumefile#" cfsqltype = "cf_sql_varchar"/>,
                              <cfqueryparam value = "#arguments.salary#" cfsqltype = "cf_sql_decimal"/>,
                              <cfqueryparam value = "#arguments.relocate#" cfsqltype = "cf_sql_varchar"/>
                         )  
               </cfquery>
               <cfset variables.getNumberOfRecords = listLen(myaddResult.generated_key)> 
          <cfreturn variables.getNumberOfRecords >
     </cffunction>
</cfcomponent>



    