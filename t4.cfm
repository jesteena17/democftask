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
<html>
	<head>
		<link href="./css/commonstyle.css" rel="stylesheet" />
	</head>
	<body>
		<cfoutput>
			Today's date : #dateFormat(now(),"dd-mm-yyyy")#<br>
			current Month in numeric : #DateFormat(now(),"mm")#<br>
			current month in word : #dateFormat(now(),"mmmm")#<br>
			Last day of month : #DaysInMonth(now())#<br>
				<cfset today=Now() />
				<cfset week_number_of_today=dayOfWeek(today)>
				<!--- 1-sun,2-mon,3-tue,4-wed,5-thu,6-friday,7-sat --->
				<cfset fridayOffset=(6-week_number_of_today)-7>
				<cfset mostRecentFriday=dateAdd("d", fridayOffset, today)><br>
					Last friday date : #dateFormat(mostRecentFriday,"dd-mm-yyyy")# 
						<br>
				<cfset today=dayofweek(now())>
					Last Friday is:
				<cfif today EQ 7>
					#dateFormat(dateAdd("d",-1,now()))#
					<cfelse>
						#dateFormat(dateAdd ("d",-(1+today),now()))#
				</cfif>
		              <br><br>					
					with weekdays last 5 days<br>
				<cfset dtNow=Fix( Now() ) />
				<cfloop index="index" from="0" to="6" step="1">
						<cfset dtDay=DateAdd( "d" , -index, dtNow ) />
						<cfset stclass="monday"/>
						<cfswitch expression="#DateFormat( dtDay,"dddd" )#">
							<cfcase value="Monday">
								<cfset stclass="monday">
							</cfcase>
							<cfcase value="Tuesday">
								<cfset stclass="tuesday">
							</cfcase>
							<cfcase value="Wednesday">
								<cfset stclass="wed">
							</cfcase>
							<cfcase value="Thursday">
								<cfset stclass="thus">
							</cfcase>
							<cfcase value="Friday">
								<cfset stclass="fri">
							</cfcase>
							<cfcase value="Saturday">
								<cfset stclass="sat">
							</cfcase>
							<cfcase value="Sunday">
								<cfset stclass="sun">
							</cfcase>
						</cfswitch>								
					#DateFormat( dtDay,"dd-mm-yyyy" )# - <span class="#stclass#"> #DateFormat( dtDay,"dddd" )#
					</span><br />
				</cfloop>
				<br><br>	
			with out weekdays next 5 days<br>
			<cfset dtNow=Fix( Now() ) />
			<cfloop index="intOffset" from="0" to="6" step="1">
					<cfdump var="#intOffset#">
					<cfset dtDay=DateAdd( "w" , +intOffset, dtNow ) />
					<cfset stclass1="monday"/>
					<cfswitch expression="#DateFormat( dtDay," dddd" )#">
						<cfcase value="Monday">
							<cfset stclass1="monday">
						</cfcase>
						<cfcase value="Tuesday">
							<cfset stclass1="tuesday">
						</cfcase>
						<cfcase value="Wednesday">
							<cfset stclass1="wed">
						</cfcase>
						<cfcase value="Thursday">
							<cfset stclass1="thus">
						</cfcase>
						<cfcase value="Friday">
							<cfset stclass1="fri">
						</cfcase>
						<cfcase value="Saturday">
							<cfset stclass1="sat">
						</cfcase>
						<cfcase value="Sunday">
							<cfset stclass1="sun">
						</cfcase>
					</cfswitch>			
					#DateFormat( dtDay,"dd-mm-yyyy" )# - <span class="#stclass1#"> #DateFormat( dtDay,"full" )#
					</span><br />		
			</cfloop>
		</cfoutput> 
	</body>
</html>
