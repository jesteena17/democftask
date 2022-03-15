<cfcomponent>
    <cffunction name="dateFunctions" output="true" access="public">
            <cfset var result=StructNew()/>
            <cfset StructInsert(result, "DtToday", dateFormat(now(),"dd-mm-yyyy"))/>
            <cfset StructInsert(result, "CurrMonthNum", DateFormat(now(),"mm"))/>
            <cfset StructInsert(result, "CurrMonthWord", dateFormat(now(),"mmmm"))/>
            <cfset StructInsert(result, "NumDaysInMonth", DaysInMonth(now()))/>
            <cfset var today=Now() />
            <cfset var week_number_of_today=dayOfWeek(today)>
            <!--- 1-sun,2-mon,3-tue,4-wed,5-thu,6-friday,7-sat --->
            <cfset var fridayOffset=(6-week_number_of_today)-7>
            <cfset var mostRecentFriday=dateAdd("d", fridayOffset, today)>
          <cfset StructInsert(result, "LastFridayDate", dateFormat(mostRecentFriday,"dd-mm-yyyy"))/>
            <cfset var today=dayofweek(now())>
            <cfif today EQ 7>
                <cfset StructInsert(result, "LastFriDay", dateFormat(dateAdd("d",-1,now())))/>
            <cfelse>
                <cfset StructInsert(result, "LastFriDay", dateFormat(dateAdd ("d",-(1+today),now())))/>
            </cfif>    
            <cfset var dtNow=Fix( Now() ) />
            <cfset var prevdays=StructNew()/>
				<cfloop index="index" from="0" to="6" step="1">
						<cfset dtDay=DateAdd( "d" , -index, dtNow ) />
									
					<cfset structinsert(prevdays,"key"&index, DateFormat(dtDay,"dd-mm-yyyy" )&'-'&DateFormat( dtDay,"dddd" ) )/>
                    
				</cfloop>

					<cfset StructAppend(result, prevdays,false)/>
        <cfreturn result>
    </cffunction>  
</cfcomponent>