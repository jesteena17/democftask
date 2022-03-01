<!-- 

Show below details in a page
Today's date, 
current Month in numeric, 
current month in word, 
Last friday date,
 Last day of month. 
 
 Show Last 5 days date & day like below. 
Sunday should be red, 
Monday - green, 
Tuesday - orange, 
Wednesday - yellow, 
Thursday - bold black, 
Friday - blue, 
Saturday - bold red

02-Dec-2010 - Thursday
01-Dec-2010 - Wednesday
30-Nov-2010 - Tuesday
29-Dec-2010 - Monday
28-Dec-2010 - Sunday

 -->

<cfscript>




    writeOutput("Today's date : "&dateFormat(now(),"dd-mm-yyyy")&"<br>");
    
    writeOutput("current Month in numeric : "&DateFormat(now(),"mm")&"<br>");
    writeOutput("current month in word : "&dateFormat(now(),"mmmm")&"<br>");
    writeOutput("Last day of month : "&DaysInMonth(now())&"<br>");
  
  
    writeOutput("Today's date : "&dateFormat(now(),"dd-mm-yyyy")&"<br>");
    writeOutput("Today's date : "&dateFormat(now(),"dd-mm-yyyy")&"<br>");
    writeOutput("Today's date : "&dateFormat(now(),"dd-mm-yyyy"));
    writeOutput("Today's date : "&dateFormat(now(),"dd-mm-yyyy"));
    writeOutput("Today's date : "&dateFormat(now(),"dd-mm-yyyy"));


</cfscript>

<cfset today = Now()/> 
<cfset week_number_of_today = dayOfWeek(today)>
<!--- <!-- <cfdump var="#week_number_of_today#"> --> --->
<!--- 1-sun,2-mon,3-tue,4-wed,5-thu,6-friday,7-sat --->
<cfset fridayOffset = (6-week_number_of_today)-7>

<cfset mostRecentFriday = dateAdd("d", fridayOffset, today)><br>
<cfoutput>Last friday date : #dateFormat(mostRecentFriday,"dd-mm-yyyy")#</cfoutput>

<!--- or --->
<br>
<cfset today=dayofweek(now())>
<cfoutput>
Last Friday is:
<cfif today EQ 7>
    #dateFormat(dateAdd("d",-1,now()))#
<cfelse>
    #dateFormat(dateAdd ("d",-(1+today),now()))#
</cfif>
</cfoutput>

<br><br>
<cfoutput>
    with out weekdays next 5 days<br>
</cfoutput>
<!---

	Get the current DATE. Fix()'ing the date will chop
	off the time portion of the date/time stamp.
	Caution: This will result in a NUMERIC date, not
	a standard date.
--->
<cfset dtNow = Fix( Now() ) />

<!---
	Now, let's loop over the past 10 WEEKDAYS. This is
	different from days. Weekday math does not include
	weekends in its calculations.
--->
<cfloop
	index="intOffset"
	from="0"
	to="6"
	step="1">
<cfdump var = "#intOffset#" >
	<!--- Get the WEEKDAY that we want to show. --->
	<cfset dtDay = DateAdd( "w", +intOffset, dtNow ) />

	<!---
		Output the full date so we can see BOTH the day
		of the week and the day-date.
	--->
   <cfswitch expression="#DateFormat( dtDay,"dddd" )#">
	<cfcase value="Monday">
<cfset style="color:green;font-weight:100">
		</cfcase>
	<cfcase value="Tuesday">
    <cfset style="color:orange;font-weight:100">
	</cfcase>
	<cfcase value="Wednesday">
    <cfset style="color:yellow;background-color:gray;font-weight:100">
	</cfcase>
    <cfcase value="Thursday">
    <cfset style="color:black;font-weight:900">
	</cfcase>
    <cfcase value="Friday">
    <cfset style="color:blue;font-weight:100">
  	</cfcase>
    <cfcase value="Saturday">
    <cfset style="color:red;font-weight:900">
   	</cfcase>
    <cfcase value="Sunday">
    <cfset style="color:red;font-weight:100">
</cfcase>
</cfswitch>

<cfoutput>


        	#DateFormat( dtDay,"dd-mm-yyyy" )# - <span style="#style#"> #DateFormat( dtDay,"full" )# </span><br />
    </cfoutput>


</cfloop>



<br><br>
<cfoutput>
    with weekdays last 5 days<br>
</cfoutput>
<!---
	Get the current DATE. Fix()'ing the date will chop
	off the time portion of the date/time stamp.
	Caution: This will result in a NUMERIC date, not
	a standard date.
--->
<cfset dtNow = Fix( Now() ) />

<!---
	Now, let's loop over the past 10 WEEKDAYS. This is
	different from days. Weekday math does not include
	weekends in its calculations.
--->
<cfloop
	index="index"
	from="0"
	to="6"
	step="1">
<!-- <cfdump var = "#index#" > -->
	<!--- Get the WEEKDAY that we want to show. --->
	<cfset dtDay = DateAdd( "d", -index, dtNow ) />

	<!---
		Output the full date so we can see BOTH the day
		of the week and the day-date.
	--->
  

  
<!--- Figure out which style sheet to generate. --->
<cfswitch expression="#DateFormat( dtDay,"dddd" )#">
	<cfcase value="Monday">
<cfset style="color:green;font-weight:100">
		</cfcase>
	<cfcase value="Tuesday">
    <cfset style="color:orange;font-weight:100">
	</cfcase>
	<cfcase value="Wednesday">
    <cfset style="color:yellow;background-color:gray;font-weight:100">
	</cfcase>
    <cfcase value="Thursday">
    <cfset style="color:black;font-weight:900">
	</cfcase>
    <cfcase value="Friday">
    <cfset style="color:blue;font-weight:100">
  	</cfcase>
    <cfcase value="Saturday">
    <cfset style="color:red;font-weight:900">
   	</cfcase>
    <cfcase value="Sunday">
    <cfset style="color:red;font-weight:100">
</cfcase>
</cfswitch>

<cfoutput>


        	#DateFormat( dtDay,"dd-mm-yyyy" )# - <span style="#style#"> #DateFormat( dtDay,"dddd" )# </span><br />
    </cfoutput>


</cfloop>