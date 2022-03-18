<cfcomponent>
    <cffunction name="dateFunctions" output="true" access="public">
            <cfset variables.result=StructNew()/>
            <cfset StructInsert(variables.result, "DtToday", dateFormat(now(),"dd-mm-yyyy"))/>
            <cfset StructInsert(variables.result, "CurrMonthNum", DateFormat(now(),"mm"))/>
            <cfset StructInsert(variables.result, "CurrMonthWord", dateFormat(now(),"mmmm"))/>
            <cfset StructInsert(variables.result, "NumDaysInMonth", DaysInMonth(now()))/>
            <cfset variables.today=Now() />
            <cfset variables.week_number_of_today=dayOfWeek(variables.today)>
            <!--- 1-sun,2-mon,3-tue,4-wed,5-thu,6-friday,7-sat --->
            <cfset variables.fridayOffset=(6-variables.week_number_of_today)-7>
            <cfset variables.mostRecentFriday=dateAdd("d", variables.fridayOffset, today)>
            <cfset StructInsert(variables.result, "LastFridayDate", dateFormat(variables.mostRecentFriday,"dd-mm-yyyy"))/>
            <cfset variables.today=dayofweek(now())>
            <cfif variables.today EQ 7>
                    <cfset StructInsert(variables.result, "LastFriDay", dateFormat(dateAdd("d",-1,now())))/>
            <cfelse>
                    <cfset StructInsert(variables.result, "LastFriDay", dateFormat(dateAdd ("d",-(1+variables.today),now())))/>
            </cfif>    
            <cfset variables.dtNow=Fix( Now() ) />
            <cfset variables.prevdays=StructNew()/>
            <cfloop index="index" from="0" to="6" step="1">
                    <cfset variables.dtDay=DateAdd( "d" , -index, variables.dtNow ) />								
                    <cfset structinsert(variables.prevdays,index, DateFormat(variables.dtDay,"dd-mm-yyyy" )&':'&DateFormat(variables.dtDay,"dddd" ) )/>                  
            </cfloop>
            <cfset StructAppend(variables.result, variables.prevdays,false)/>
        <cfreturn variables.result>
    </cffunction>  
</cfcomponent>