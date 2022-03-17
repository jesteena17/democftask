<html>
	<head>
		<link href="css/commonstyle.css" rel="stylesheet" />
	</head>
	<body>
		<cfoutput>
			<cfinvoke component="t4" method="dateFunctions" returnvariable="result"></cfinvoke>
			Today's date : #result.DtToday#<br>
			current Month in numeric : #result.CurrMonthNum#<br>
			current month in word : #result.CurrMonthWord#<br>
			Last day of month : #result.NumDaysInMonth#<br>
			Last friday date : #result.LastFridayDate# <br>
			Last Friday is:#result.LastFriDay#<br>					
			with weekdays last 5 days<br>
			<cfloop from = 0 to = 6 index = "i" step = "1">
				<cfset stclass=trim(reReplacenocase(result[i], "[^a-z]", "", "ALL"))/>
				<p class="#stclass#">#result[i]#</p>	
			</cfloop>
		</cfoutput>
	</body>
</html>
