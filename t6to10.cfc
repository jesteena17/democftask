<cfcomponent displayname="task6to10" hint="Structexamples">
     <cffunction name="Structex6" output="false" access="public">
          <cfset variables.d1 = form.key1/>
          <cfset variables.d2 = form.val1/>
          <cfset variables.result = StructNew() />
          <cfset  StructInsert(variables.result, variables.d1, variables.d2) />
          <cfreturn variables.result>
     </cffunction>

     <cffunction name="Structex7" output="false" access="public" returnType="struct">
          <cfset variables.d1 = form.key1/>
          <cfset variables.d2 = form.val1/>
          <cfif NOT StructKeyExists(Session, "mystruct")>
               <cflock timeout=20 scope="Session" type="Exclusive">
                    <cfset Session.mystruct = StructNew()>
               </cflock>
          </cfif>
          <cfif StructKeyExists(Session, "mystruct")>
               <cfif  StructKeyExists(Session.mystruct,variables.d1)>
                    <cfset structinsert(Session.mystruct, variables.d1,variables.d2,true)>        
               </cfif>
          </cfif>
          <cfreturn Session.mystruct>
     </cffunction>
     
     <cffunction name="Structex8" output="false" access="public" returnType="struct">
          <cfset variables.d1 = form.key1/>
          <cfset variables.d2 = form.val1/>
          <cfif NOT StructKeyExists(Session, "mystruct")>
               <cflock timeout=20 scope="Session" type="Exclusive">
                    <cfset Session.mystruct = StructNew()>
               </cflock>
          </cfif>
          <cfif StructKeyExists(Session, "mystruct")>
               <cfif  StructKeyExists(Session.mystruct,variables.d1)>
                    <cfset structupdate(Session.mystruct, variables.d1,variables.d2)> 
               <cfelse>
                    <cfset structinsert(Session.mystruct, variables.d1,variables.d2)>        
               </cfif>
          </cfif>
          <cfreturn Session.mystruct>
     </cffunction>

     <cffunction name="Structex9" output="true" access="public" returnType="struct">
          <cfset variables.d1 = form.key1/>
          <cfset variables.d2 = form.val1/>
          <cfif NOT StructKeyExists(Session, "mystruct")>
               <cflock timeout=20 scope="Session" type="Exclusive">
                    <cfset Session.mystruct = StructNew()>
               </cflock>
          </cfif>
          <cfif StructKeyExists(Session, "mystruct")>
               <cfif StructKeyExists(Session.mystruct,variables.d1)>
                    <cfif  StructFind(Session.mystruct,variables.d1) EQ variables.d2>
                         <cfset variables.result.msg=variables.d1&" already present. Cannot add again"/>
                         <cfset variables.result.output=session.mystruct/>
                    <cfelse>
                         <cfset structupdate(session.mystruct,variables.d1,variables.d2)/>
                         <cfset variables.result.output=session.mystruct/>
                         <cfset variables.result.msg="success"/>     
                    </cfif> 
               <cfelse>
                    <cfset structinsert(session.mystruct,variables.d1,variables.d2)/>  
                    <cfset variables.result.output=session.mystruct/>
                    <cfset variables.result.msg="success"/>
               </cfif>
               </cfif>
          <cfreturn variables.result>
     </cffunction>  

     <cffunction name="Structex10" output="false" access="public" returnType="struct">
          <cfif NOT StructKeyExists(Session, "mystruct")>
               <cflock timeout=20 scope="Session" type="Exclusive">
                    <cfset Session.mystruct = StructNew("ordered")>
               </cflock>
          </cfif>
          <cfset variables.d1 = form.key1/>
          <cfset variables.d2 = form.val1/>
          <cfif  StructKeyExists(Session.mystruct,variables.d1)>
               <cfset structupdate(Session.mystruct, variables.d1,variables.d2)> 
          <cfelse>
               <cfset structinsert(Session.mystruct, variables.d1,variables.d2)>        
          </cfif>
          <cfset variables.sorted = session.mystruct.ToSorted("text","asc",false)>
          <cfreturn variables.sorted>
     </cffunction>   
     
</cfcomponent>