<cfcomponent>
     <cffunction name="createcaptcha" returnType="string" output="false">
          <cfset variables.  chars = "GHJKMNPQRS">
          <cfset variables.  length = randRange(4,5)>
          <cfset variables.  result = "">
          <cfset variables.  i = "">
          <cfset variables.  char = "">
          <cfloop index="i"  from = "1" to = "#length#" step = "1">
               <cfset char = mid(chars, randRange(1, len(chars)),1) />
               <cfset result&=char/>
          </cfloop>   
	<cfreturn result>
</cffunction>
<cffunction name="createcaptcha" returnType="struct" output="false">
          <cfset variables.result=StructNew()/>
          <cfset variables.errors = "">
          <cfif  NOT reFindNoCase("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$", form.Email)>
               <cfset variables.errors = variables.errors & "Enter A valid  emailID.<br />">
          </cfif>
          <cfif hash(ucase(form.captcha)) neq form.captchaHash>
               <cfset variables.errors = variables.errors & "Entered wrong captcha<br />">
          </cfif>
          <cfif variables.errors is "">
               <cfset variables.showForm = false>
          </cfif> 
          <cfset StructInsert(result, "emerror",variables.errors )/>
          <cfset StructInsert(result, "dispform",variables.showForm )/>
<cfreturn result>
</cffunction>

</cfcomponent>
