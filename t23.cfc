<cfcomponent  displayname="EmployeesData">
     <cffunction name = "storeemployeeinfo">
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
            <cfquery name = "addemployee" datasource = "#request.dsn#" username = "#request.un#" password = "#request.pw#" result="myaddResult">
                      insert into employeeinfo(firstname,lastname,email,contact,joindate,jobpost,portfolio,uploadedresume,salary,relocate) 
                      values (    
                                      <cfqueryparam value = "#cfname#" cfsqltype = "cf_sql_varchar"/>,
                                      <cfqueryparam value = "#clname#" cfsqltype = "cf_sql_varchar"/>,
                                        <cfqueryparam value = "#cemail#" cfsqltype = "cf_sql_varchar"/>,
                                        <cfqueryparam value = "#phone#" cfsqltype = "cf_sql_varchar"/>,
                                        <cfqueryparam value = "#joindate#" cfsqltype = "cf_sql_date"/>,
                                          <cfqueryparam value = "#jobposition#" cfsqltype = "cf_sql_varchar"/>,
                                          <cfqueryparam value = "#site#" cfsqltype = "cf_sql_varchar"/>,
                                            <cfqueryparam value = "#resumefile#" cfsqltype = "cf_sql_varchar"/>,
                                              <cfqueryparam value = "#salary#" cfsqltype = "cf_sql_decimal"/>,
                                                <cfqueryparam value = "#relocate#" cfsqltype = "cf_sql_varchar"/>
                            )  
              </cfquery>
          <cfset getNumberOfRecords = listLen(#myaddResult.generated_key#)> 
          <cfreturn getNumberOfRecords >
     </cffunction>
</cfcomponent>