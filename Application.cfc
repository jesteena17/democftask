<cfcomponent>
<cfset this.name = "myApplication">
<cfset this.clientStorage="Cookie"/>
<cfset this.Sessionmanagement = TRUE>
<cfset this.clientManagement = true>
<cfset this.setClientCookies = true /> 



<cffunction name="onApplicationStart" returntype="boolean" >
		<cfset application.demostruct = StructNew("ordered") />
		
		<cfreturn true />
	</cffunction>
</cfcomponent>