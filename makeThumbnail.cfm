<cfset thisDir = expandPath(".")>
<!--- Determine whether the form is uploaded with the image. --->
<cfif structKeyExists(form,"image") and len(trim(form.image))>
<!--- Use the cffile tag to upload the image file. --->
<cffile action="upload" fileField="image" destination="#thisDir#" result="fileUpload"
nameconflict="overwrite">
<!--- Determine whether the image file is saved. --->
<cfif fileUpload.fileWasSaved>
<!--- Determine whether the saved file is a valid image file. --->
<cfif IsImageFile("#fileUpload.serverfile#")>
<!--- Read the image file into a variable called myImage. --->
<cfimage action="read" source="#fileUpload.serverfile#" name="myImage">
<!--- Determine whether the image file exceeds the size limits. --->
<cfif ImageGetHeight(myImage) gt 800 or ImageGetWidth(myImage) gt 800>
<!--- If the file is too large, delete it from the server. --->
<cffile action="delete"
file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
<cfoutput>
<p>
The image you uploaded was too large. It must be less than 800 pixels wide
and 800 pixels high. Your image was #imageGetWidth(myImage)# pixels wide
and #imageGetHeight(myImage)# pixels high.
</p>

</cfoutput>
<!--- If the image is valid and does not exceed the size limits,
create a thumbnail image from the source file that is 20-pixels
square, while maintaining the aspect ratio of the source image.
Use the bilinear interpolation method to improve performance.
--->
<cfelse>

<cfset ImageScaleToFit(myImage,20,20,"bilinear")>
<!--- Specify the new filename as the source filename with
"_thumbnail" appended to it. --->
<cfset newImageName = fileUpload.serverDirectory & "/" &
fileUpload.serverFilename & "_thumbnail." &
fileUpload.serverFileExt>
<!--- Save the thumbnail image to a file with the new filename. --->
<cfimage source="#myImage#" action="write"
destination="#newImageName#" overwrite="yes">
<cfoutput>
<p>
Thank you for uploading the image. We have created a thumbnail for
your picture.
</p>
<p>
<!--- Display the thumbnail image. --->
<img src="#getFileFromPath(newImageName)#"><br>
<a href="t14details.cfm?in=#form.imagenm#&ids=#form.imgdesc#&im=#fileUpload.serverFile#">#fileUpload.serverFilename & "_thumbnail." &
fileUpload.serverFileExt#</a>
</p>
</cfoutput>
</cfif>
<!--- If it is not a valid image file, delete it from the server. --->
<cfelse>
<cffile action="delete"
file="#fileUpload.serverDirectory#/#fileUpload.serverFile#">
<cfoutput>
<p>
The file you uploaded, #fileUpload.clientFile#, was not a valid image.
</p>
</cfoutput>
</cfif>
</cfif>
</cfif>