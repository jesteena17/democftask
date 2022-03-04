<cfscript>
    variables.validMimeTypes =  {
        'application/pdf': {extension: 'pdf', application: 'Adobe Acrobat'}
        ,'application/vnd.ms-powerpoint': {extension: 'ppt', application: 'PowerPoint (97-2003)'}
        ,'application/vnd.openxmlformats-officedocument.presentationml.presentation': {extension: 'pptx', application: 'PowerPoint (2007)'}
        ,'image/jpeg': {extension: 'jpg'}
        ,'image/png': {extension: 'png'}
    };
</cfscript>
<Cfset thisPath = expandPath('.') & '/myMailattachments/'>
<cfset f_dir = GetDirectoryFromPath(thisPath)>
<cftry>
    <cffile action="upload" filefield="FiletoUpload"
            destination="#f_dir#" mode="600"
            accept="#StructKeyList(variables.validMimeTypes)#"
            strict="true"
            result="uploadResult"
            nameconflict="makeunique">
    <cfcatch type="any">
        <!--- file is not written to disk if error is thrown  --->
        <!--- prevent zero length files --->
        <cfif FindNoCase( "No data was received in the uploaded", cfcatch.message )>
            <cfabort showerror="Zero length file">

        <!--- prevent invalid file types --->
        <cfelseif FindNoCase( "The MIME type or the Extension of the uploaded file", cfcatch.message )>
            <cfabort showerror="Invalid file type">

        <!--- prevent empty form field --->
        <cfelseif FindNoCase( "did not contain a file.", cfcatch.message )>
            <cfabort showerror="Empty form field">

        <!---all other errors --->
        <cfelse>
            <cfabort showerror="Unhandled File Upload Error">

        </cfif>
    </cfcatch>
</cftry>
<cfif IsDefined("form.mailto") and StructKeyExists(form, "sub") and cgi.request_method is "post"> 
 <cfif form.mailto is not ""> 
    <cfmail to = "#form.mailto#" from = "#form.mailfrom#" subject = "#form.subject#" > 
         #form.body# dear #form.name#
         <cfmailparam file="./myMailattachments/#uploadResult.serverFile#"   disposition="attachment" type="text">
    </cfmail> 
        <p>Thank you, <cfoutput> your message, #subject#, has been sent to 
        #mailto#</cfoutput>.</p> 
        <p>
     	</p>
 </cfif> 
</cfif> 