<cfcomponent>
     <cffunction name="multiply" output="false" access="public"> 
          <cfset variables.res = 1>   
          <cfloop collection="#Arguments#" item="argument">    
               <cfset variables.res = variables.res * Arguments[argument]>  
          </cfloop> 
        <cfreturn variables.res> 
     </cffunction>  
     <cffunction name="matrix" output="false" access="public" returnType="array"> 
          <cfset variables.myarray=[1,4,7,2,5,8,3,6,9]/>
          <cfset variables.printinrow=ArrayNew(1)/>
          <cfset variables.outputarray=ArrayNew(2)/>
          <cfloop array="#variables.myarray#"  index = "i" item ="item">
               <cfif i mod 3 EQ 0>
                    <cfset ArrayAppend(variables.printinrow,item )/>
                    <cfset ArrayAppend(variables.outputarray, variables.printinrow)/>
                    <cfset variables.printinrow=ArrayNew(1)/>
               <cfelse>
                    <cfset ArrayAppend(variables.printinrow,item )/>
               </cfif>
          </cfloop>
        <cfreturn variables.outputarray> 
     </cffunction>  
     <cffunction name="EvenOdd" output="false" access="public" returnType="string">
          <cfargument name="numin" type="integer" > 
          <cfset variables.result=""/>
          <cfif arguments.numin mod 2 EQ 0>
               <cfset variables.result="even" />  
          <cfelse>
               <cfset variables.result= "odd" /> 
          </cfif>
          <cfreturn variables.result> 
     </cffunction> 
     <cffunction name="t18querydb" output="false" access="public" returnType="query">
          <cfset variables.result=QueryExecute(("SELECT id,name,email FROM task19" ),[])/> 
          <cfreturn variables.result> 
     </cffunction> 
     <cffunction name="t19Cookies" output="false" access="public" returnType="any">
          <cfif IsDefined("Cookie.VisitsCounter") is False>
               <cfcookie name="VisitsCounter" value=1 />
          <cfelse> 
               <cfset variables.currcount = cookie.VisitsCounter/>
               <cfset variables.nextcount = variables.currcount + 1/>
               <cfcookie name="VisitsCounter" value=#variables.nextcount# />
          </cfif>  
          <cfreturn Cookie.VisitsCounter> 
     </cffunction>
</cfcomponent>
