<cfcomponent>
     <cffunction name="createcaptcha" access="public" returnType="string" output="false">
               <cfset variables.chars = "GHJKMNPQRS">
               <cfset variables.length = randRange(4,5)>
               <cfset variables.result = "">
               <cfset variables.i = "">
               <cfset variables.char = "">
               <cfloop index="i"  from = "1" to = "#variables.length#" step = "1">
                    <cfset variables.char = mid(variables.chars, randRange(1, len(variables.chars)),1) />
                    <cfset variables.result&=variables.char/>
               </cfloop>   
          <cfreturn variables.result>
     </cffunction>
     <cffunction name="validateform"  access="public" returnType="struct"  output="false">
               <cfset variables.result=StructNew()/>
               <cfset variables.showForm = true>
               <cfset variables.email = form.Email>
               <cfset variables.captcha = form.captcha>
               <cfset variables.captchaHash = form.captchaHash>
               <cfset variables.errors = "">
               <cfif  NOT reFindNoCase("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$",variables.email )>
                    <cfset variables.errors = variables.errors & "Enter A valid  emailID.<br />">
               </cfif>
               <cfif hash(ucase(variables.captcha)) neq variables.captchaHash>
                    <cfset variables.errors = variables.errors & "Entered wrong captcha<br />">
               </cfif>
               <cfif variables.errors is "">
                    <cfset variables.showForm = false>
               </cfif> 
               <cfset StructInsert(variables.result, "errors",variables.errors )/>
               <cfset StructInsert(variables.result, "showForm",variables.showForm )/>
          <cfreturn variables.result>
     </cffunction>
     <cffunction name="sendgreetngs"  access="public" returnType="string"  output="false">
               <cfset variables.result=""/>
               <cfset variables.name = form.name>
               <cfset variables.MailTo = form.MailTo>
               <cfset variables.mailfrom = form.mailfrom>
               <cfset variables.subject = form.subject>
               <cfset variables.body = form.body>
               <cfset variables.FiletoUpload = form.FiletoUpload>
               <cfset variables.validMimeTypes =  {
                                                       'application/pdf': {extension: 'pdf', application: 'Adobe Acrobat'}
                                                       ,'application/vnd.ms-powerpoint': {extension: 'ppt', application: 'PowerPoint (97-2003)'}
                                                       ,'application/vnd.openxmlformats-officedocument.presentationml.presentation': {extension: 'pptx', application: 'PowerPoint (2007)'}
                                                       ,'image/jpeg': {extension: 'jpg'}
                                                       ,'image/png': {extension: 'png'}
                                                  } />
               <cfset variables.thisPath = expandPath('.') & '/myMailattachments/'>
               <cfset variables.f_dir = GetDirectoryFromPath(variables.thisPath)>
               <cftry>
                    <cffile action="upload" filefield="FiletoUpload"
                              destination="#variables.f_dir#" mode="600"
                              accept="#StructKeyList(variables.validMimeTypes)#"
                              strict="true"
                              result="uploadResult"
                              nameconflict="makeunique">
                    <cfcatch type="any">
                         <cfif FindNoCase( "No data was received in the uploaded", cfcatch.message )>
                              <cfabort showerror="Zero length file">
                         <cfelseif FindNoCase( "The MIME type or the Extension of the uploaded file", cfcatch.message )>
                              <cfabort showerror="Invalid file type">
                         <cfelseif FindNoCase( "did not contain a file.", cfcatch.message )>
                              <cfabort showerror="Empty form field">
                         <cfelse>
                              <cfabort showerror="Unhandled File Upload Error">
                         </cfif>
                    </cfcatch>
               </cftry>
               <cfif IsDefined("variables.MailTo")>  
                    <cfmail to = "#variables.MailTo#" from = "#variables.mailfrom#" subject = "#variables.subject#" > 
                         #variables.body# dear #variables.name#
                         <cfmailparam file="./myMailattachments/#uploadResult.serverFile#"   disposition="attachment" type="text">
                    </cfmail> 
                    <cfset variables.result="your message, "&variables.subject&", has been sent to "&variables.MailTo/>
               </cfif> 
          <cfreturn variables.result>
     </cffunction>
     <cffunction name="printjson" access="public" returnType="array" output="false">
               <cfset variables.data = '[{"Name":"saravanan","Age":27,"LOCATION":"dubai"},{"Name":"Ram","Age":26,"LOCATION":"Kovilpatti"}]' /> 
               <cfset variables.result=DeserializeJSON(data)>
          <cfreturn variables.result>
     </cffunction>
</cfcomponent>



