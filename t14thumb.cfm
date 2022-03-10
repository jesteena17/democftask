<cfset thisDir = expandPath(".")>
<cfif structKeyExists(form,"image") and len(trim(form.image))>
    <cffile action="upload" fileField="image" destination="#thisDir#" result="fileUpload" mode="777"
    nameconflict="overwrite">
    <cfif fileUpload.fileWasSaved>
            <cfif IsImageFile("#fileUpload.serverfile#")>
                    <cfimage action="read" source="#fileUpload.serverfile#" name="myImage">
                        <cfif ImageGetHeight(myImage) gt 900 or ImageGetWidth(myImage) gt 900>
                                            <cffile action="delete"
                                            file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
                                            <cfoutput>
                                            <p>
                                            The image  uploaded was too large. It must be less than 900 px width
                                            and 900 px height. uploaded image is of #imageGetWidth(myImage)# pixels width
                                            and #imageGetHeight(myImage)# pixels hight.
                                            </p>
                                            </cfoutput>
                        <cfelse>
                                            <cfset ImageScaleToFit(myImage,20,20,"bilinear")>
                                            <cfset newImageName = fileUpload.serverDirectory & "/" &fileUpload.serverFilename & "_thumbnail." &fileUpload.serverFileExt>
                                            <cfimage source="#myImage#" action="write"
                                            destination="#newImageName#" overwrite="yes">
                                            <cfoutput>
                                            <p>
                                            Thumbnail of uploaded img is created
                                            </p>
                                            <p>
                                            <img src="#getFileFromPath(newImageName)#"><br>
                                            <a href="t14details.cfm?in=#form.imagenm#&ids=#form.imgdesc#&im=#fileUpload.serverFile#">#fileUpload.serverFilename & "_thumbnail." &
                                            fileUpload.serverFileExt#</a>
                                            </p>
                                            </cfoutput>
                        </cfif>
            <cfelse>
                    <cffile action="delete" file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
                    <cfoutput>
                    <p>
                    The file you uploaded, #fileUpload.clientFile#, was not a valid image.
                    </p>
                    </cfoutput>
            </cfif>
    </cfif>
</cfif>










