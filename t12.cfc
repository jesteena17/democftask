<cfcomponent  displayname="EmployeesData">
        <cffunction name="displaydata" access="remote" returnType="query" output="false">
                <cfquery  name="getdata">
                    select * from task12 ;
                </cfquery>
            <cfreturn getdata>    
        </cffunction>
</cfcomponent>
