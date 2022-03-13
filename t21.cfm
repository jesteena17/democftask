<html>
    <head>
    </head>
    <body>
        <cfoutput>
              <p>Qn.Create a birthday wishes page which contains the following fields.
                  Birthday Baby Name: Text box
                  His Email Id :	Text box
                  Birthday Wishes: Text area
                  Greeting image : File upload field
                  While clicking on the submit, it should send greeting mail to the birthday guys mail id. 
                  Greeting images should be in attachment along with mail.? 
              </p>
              <form action="" method="POST" enctype="multipart/form-data">
                <table>
                  <tr>
                    <th>name </th>
                    <td><input type="Text" value="jinu" name="name"></td>
                  </tr>
                  <tr>
                    <th>email</th>
                    <td>
                      <input type="Text" value="jinutomy17@gmail.com" name="MailTo">
                      <input type="hidden" name="mailfrom" value="rishiba.pp.niitclt@gmail.com" />
                      <input type="hidden" name="subject" value="Birthday Greeting" />
                    </td>
                  </tr>
                  <tr>
                    <th>wishes</th>
                    <td><textarea name="body" cols="40" rows="5" wrap="virtual">Happy BIrthdayys</textarea> </td>
                  </tr>
                  <tr>
                    <th>photo</th>
                    <td><input type="file" name="FiletoUpload" /></td>
                  </tr>
                  <tr>
                    <td colspan="2"><input type="submit" name="sub" value="Send Greets" /></td>
                  </tr>
                </table>
              </form>
              <cfif   StructKeyExists(form, "sub") and cgi.request_method is "post">  
                    <cfset variables.validMimeTypes =  {
                            'application/pdf': {extension: 'pdf', application: 'Adobe Acrobat'}
                            ,'application/vnd.ms-powerpoint': {extension: 'ppt', application: 'PowerPoint (97-2003)'}
                            ,'application/vnd.openxmlformats-officedocument.presentationml.presentation': {extension: 'pptx', application: 'PowerPoint (2007)'}
                            ,'image/jpeg': {extension: 'jpg'}
                            ,'image/png': {extension: 'png'}
                        } />
                    <cfset thisPath = expandPath('.') & '/myMailattachments/'>
                    <cfset f_dir = GetDirectoryFromPath(thisPath)>
                    <cftry>
                        <cffile action="upload" filefield="FiletoUpload"
                                destination="#f_dir#" mode="600"
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
                    <cfif IsDefined("form.mailto")> 
                        <cfif form.mailto is not ""> 
                                <cfmail to = "#form.mailto#" from = "#form.mailfrom#" subject = "#form.subject#" > 
                                        #form.body# dear #form.name#
                                        <cfmailparam file="./myMailattachments/#uploadResult.serverFile#"   disposition="attachment" type="text">
                                </cfmail> 
                                <p>Thank you, <cfoutput> your message, #subject#, has been sent to #mailto#</cfoutput>.</p> 
                                <p></p>
                        </cfif> 
                    </cfif> 
                </cfif>  
         </cfoutput>
    </body>
</html>