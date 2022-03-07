

<form action="" method="post" enctype="multipart/form-data">

Please upload a txt file:<input type="file" name="FiletoUpload" size="45"><br>
<input type="submit" value="Send file" name="registerbtn">
</form>

<Cfset thisPath = expandPath('.') & '/myUploads/'>
   <cfset f_dir = GetDirectoryFromPath(thisPath)>



<cfif (cgi.request_method IS "post") AND (structKeyExists(form, "registerbtn"))> 


            <cftry>

            <cffile action="upload" filefield="FiletoUpload"
                        destination="#f_dir#"
                        accept="text/plain"
                        strict="true"
                        result="uploadResult"
                        mode="777"
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


            <cfif uploadResult.fileWasSaved>

                  <cfset myfile = FileRead("#f_dir#/#uploadResult.serverFile#")/>
                  <cfdump var="#myfile#"/>
                 
                  <cfset words=listToArray(REReplaceNoCase(#myfile#, "[^ A-Z]", "", "All")," ",false,true)/>
                  <cfset wordCount = structNew("ordered")>
                  <cfloop index="index" array="#words#">
                  <cfif structKeyExists(wordCount, index)>
                        <cfset wordCount[index]++>
                    <cfelse>
                        <cfset wordCount[index] = 1>
                  </cfif> 
                  </cfloop>
                  <!--      <cfdump var = "#wordCount#"> -->
                  <cfloop item="index" collection="#wordCount#">
                        <cfinvoke component="t26" method="insertData" returnvariable="result">
                        <cfinvokeargument name="word" value="#index#"/> 
                        <cfinvokeargument name="count" value="#wordCount[index]#"/> 
                        </cfinvoke>
                  </cfloop>
                  <cfif result GT 0>
                        <script>
                        alert("Data Addedd Successfully");
                        </script>
                        <cfelse>
                        <script>
                        alert("error adding dupliacte records");
                        </script>
                  </cfif>
            </cfif>
 

</cfif>