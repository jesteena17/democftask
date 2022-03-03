<!--

Create a web page that will have one submit button.
 When submitted, the page will post to self. 
Create a cookie named 'VisitsCounter' and every time the submit button is clicked and the page is posted,
 the 'VisitsCounter' should be increased by 1
 and the increased value is shown on the page.

-->



<cfif cgi.REQUEST_METHOD is "post" and structKeyExists(form,"click")>

<cfset Cookie.VisitsCounter++/>

</cfif>





<form method="post" action="">
<input type="submit" name="click" value="click"/>
</form>


<CFOUTPUT>
 hi u hit the button :   #Cookie.VisitsCounter# times
</CFOUTPUT>


<!--
<cfif isDefined("nextpage")><cfset SESSION.currentPage += 1></cfif>

<cfif IsDefined("SESSION.MyCount")>
  <cfset SESSION.MyCount = #SESSION.MyCount# + 1>
  Current Count is: <cfoutput>#SESSION.MyCount#</cfoutput><BR>
  The current time is <cfoutput>#Now()#
  <br />
  Server: #CGI.SERVER_NAME#
  </cfoutput>
  <BR>
<cfelse>
  <cfset SESSION.MyCount = 1>
  <cfoutput>Count: #SESSION.MyCount#
  <br />
  Server: #CGI.SERVER_NAME#
  </cfoutput>
</cfif>
<A HREF="sessiontest.cfm">Test Session</A>
-->