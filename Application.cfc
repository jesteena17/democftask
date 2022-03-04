<cfcomponent>
<cfset this.name = "myApplication">
<cfset this.clientStorage="Cookie"/>
<cfset this.Sessionmanagement = TRUE>
<cfset this.clientManagement = true>
<cfset this.setClientCookies = true /> 
<cfset this.Cookie.VisitsCounter = 0 />
<cfset application.datasource = "mysqldsn">
</cfcomponent>