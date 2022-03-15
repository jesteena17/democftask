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
		  <cfinvoke component="t4" method="dateFunctions" returnvariable="result"></cfinvoke>
                 <cfdump var="#result#"/>
			Today's date : #result.DtToday#<br>
			current Month in numeric : #result.CurrMonthNum#<br>
			current month in word : #result.CurrMonthWord#<br>
			Last day of month : #result.NumDaysInMonth#<br>
				
					Last friday date : #result.LastFridayDate# <br>
				
					Last Friday is:#result.LastFriDay#
				
		              <br><br>					
					with weekdays last 5 days<br>
				
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
