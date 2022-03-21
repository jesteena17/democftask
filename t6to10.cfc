<cfcomponent displayname="task6to10" hint="Structexamples">
       <cffunction name="Structex6" output="false" access="public">
                       <cfset variables.d1 = form.key1/>
                       <cfset variables.d2 = form.val1/>
                       <cfset variables.result = StructNew() />
                       <cfset  StructInsert(variables.result, variables.d1, variables.d2) />
              <cfreturn variables.result>
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
                              <cfif  StructKeyExists(Session.mystruct,"#d1#")>
                                        <cfset structupdate(Session.mystruct, #d1#,#d2#)> 
                              <cfelse>
                                        <cfset structinsert(Session.mystruct, #d1#,#d2#)>        
                              </cfif>
                         </cfif>
              <cfreturn Session.mystruct>
       </cffunction>   
       <cffunction name="Structex9" output="false" access="public" returnType="struct">
                       <cfset variables.d1 = form.key1/>
                       <cfset variables.d2 = form.val1/>
                        <cfif NOT StructKeyExists(Session, "mystruct")>
                              <cflock timeout=20 scope="Session" type="Exclusive">
                                   <cfset Session.mystruct = StructNew()>
                              </cflock>
                         </cfif>
                         <cfif StructKeyExists(Session, "mystruct")>
                                   <cfif  StructKeyExists(Session.mystruct,"#d1#")>
                                        
                                   <cfif StructFindValue(Session.myStruct,#d2#,"one") [1].key EQ d1>
                                    <cfset structinsert(Session.mystruct, "error","data already present. Cannot add again",true)>
                                    <cfelse>
                                   <cfset myValue=StructFindValue(Session.myStruct,#d2#,"one")/>
                                    <cfset StructDelete(Session.mystruct, "error")/>
                                        <cfset StructUpdate(Session.mystruct, #myValue[1].key#,#d2#)> 
                                   <cfelse>
                                       
                                   </cfif>
                              </cfif>
              <cfreturn Session.mystruct>
       </cffunction>   


       <cfset StructDelete(Session.mystruct, "error")/>
                                        <cfset structinsert(Session.mystruct, #d1#,#d2#)> 
       <cffunction name="Structex10" output="false" access="public" returnType="struct">
                       <cfset variables.d1 = form.key1/>
                       <cfset variables.d2 = form.val1/>
                        <cfif NOT StructKeyExists(Session, "mystruct")>
                              <cflock timeout=20 scope="Session" type="Exclusive">
                                   <cfset Session.mystruct = StructNew()>
                              </cflock>
                         </cfif>
                         <cfif StructKeyExists(Session, "mystruct")>
                                   <cfif not StructKeyExists(Session.mystruct,"#d1#")>
                                             <cfset StructDelete(Session.mystruct, "error")/>
                                             <cfset structinsert(Session.mystruct, #d1#,#d2#)> 
                                   <cfelse>
                                        <cfset structinsert(Session.mystruct, "error","data already present. Cannot add again",true)>
                                   </cfif>
                              </cfif>
              <cfreturn Session.mystruct>
       </cffunction>   
</cfcomponent>