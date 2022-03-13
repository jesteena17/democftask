<html>
    <head>
    </head>
    <body>
        <cfoutput>
            <p>  
                Create a form with Image name text box , description text area & Image upload field.
                User can upload only small size jpg,png and gif files. Add validation to check uploaded file type & file size. User should not upload a image which is greater than 1 MB. Once user uploaded a image,create a thumbnail image (20*20 size) from uploaded images. In list page, show thumbnail image & image name. While clicking on the image name, 
                it should redirect the user to details page which will show image name, description & original uploaded image.
            </p>
            <form action="" method="post" enctype="multipart/form-data">
                image name <input type="text" name="imagenm" required="" /><br><br>
                description <textarea name="imgdesc" required=""></textarea><br><br>
                upload an image: <input type="file" required="" name="image"><br><br>
                <input type="submit" value="Send Image" name="Submit">
            </form>
            <cfset thisDir = expandPath(".")>
                    <cfif structKeyExists(form,"image") and len(trim(form.image))>
                        <cffile action="upload" fileField="image" destination="#thisDir#" result="fileUpload" mode="777" nameconflict="overwrite">
                        <cfif fileUpload.fileWasSaved>
                            <cfif IsImageFile("#fileUpload.serverfile#")>
                                    <cfimage action="read" source="#fileUpload.serverfile#" name="myImage">
                                    <cfif ImageGetHeight(myImage) gt 900 or ImageGetWidth(myImage) gt 900>
                                        <cffile action="delete" file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
                                        <p> 
                                        The image  uploaded was too large. It must be less than 900 px width
                                        and 900 px height. uploaded image is of #imageGetWidth(myImage)# pixels width
                                        and #imageGetHeight(myImage)# pixels hight.
                                        </p>            
                                    <cfelse>
                                        <cfset ImageScaleToFit(myImage,20,20,"bilinear")>
                                        <cfset newImageName = fileUpload.serverDirectory & "/" &fileUpload.serverFilename & "_thumbnail." &fileUpload.serverFileExt>
                                        <cfimage source="#myImage#" action="write" destination="#newImageName#" overwrite="yes"> 
                                        <p> Thumbnail of uploaded img is created </p>
                                        <p>
                                                <img src="#getFileFromPath(newImageName)#"><br>
                                                <form action="t14details.cfm" method="post">
                                                        <input type="hidden" name="in" value="#form.imagenm#"/>
                                                        <input type="hidden" name="ids" value="#form.imgdesc#"/>
                                                        <input type="hidden" name="im" value="#fileUpload.serverFile#"/>
                                                        <button  type="submit" name="viewdata" >#fileUpload.serverFilename & "_thumbnail." & fileUpload.serverFileExt#</button>
                                                </form>
                                        </p>                  
                                    </cfif>
                            <cfelse>
                                    <cffile action="delete" file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
                                    <p>    The file you uploaded, #fileUpload.clientFile#, was not a valid image. </p>        
                            </cfif>
                        </cfif>
                    </cfif>
        </cfoutput>    
    </body>
</html>