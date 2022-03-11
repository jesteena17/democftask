<cfcomponent>
     <cffunction name="createcaptcha" returnType="string" output="false">
        <cfset var chars = "GHJKMNPQRS">
        <cfset var length = randRange(4,5)>
        <cfset var result = "">
        <cfset var i = "">
        <cfset var char = "">
        <cfloop index="i"  from = "1" to = "#length#" step = "1">
            <cfset char = mid(chars, randRange(1, len(chars)),1) />
            <cfset result&=char/>
        </cfloop>   
	<cfreturn result>
</cffunction>
</cfcomponent>
