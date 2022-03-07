<cfcomponent>
<cfset this.name = "myApplication">
<cfset this.clientStorage="Cookie"/>
<cfset this.Sessionmanagement = TRUE>
<cfset this.clientManagement = true>
<cfset this.setClientCookies = true /> 
<cfset this.Cookie.VisitsCounter = 0 />
<cfset this.Cookie.demostruct = StructNew()>


<cffunction name="onApplicationStart" returntype="boolean" >
		<cfset application.demostruct = StructNew("ordered") />
		
		<cfreturn true />
	</cffunction>
</cfcomponent>