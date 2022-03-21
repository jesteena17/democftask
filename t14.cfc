<cfcomponent  displayname="imgUpload">
     <cffunction name="CreateImageThumb" access="public" returnType="string" output="true">
          <cfset variables.thisDir = expandPath(".")>
          <cfset variables.imagename = form.imagenm/>
          <cfset variables.imgdescr = form.imgdesc/>
          <cfset variables.imagefile = form.image/>
          <cfset variables.result = "" />
          <cfif  len(trim(variables.imagefile))>
               <cffile action="upload" fileField="image" destination="#variables.thisDir#" result="fileUpload" mode="777" nameconflict="overwrite">
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
                              <!-- The interpolation method for resampling. You can specify a specific interpolation algorithm by name (for example,
                              hamming),by image quality (for example, mediumQuality), or by performance (for example, highestPerformance). --> 
                              <cfset ImageScaleToFit(myImage,20,20,"bilinear")>
                              <cfset newImageName = fileUpload.serverDirectory & "/" &fileUpload.serverFilename & "_thumbnail." &fileUpload.serverFileExt>
                              <cfimage source="#myImage#" action="write" destination="#newImageName#" overwrite="yes"> 
                              <p> Thumbnail of uploaded img is created </p>
                              <p>
                                   <img src="#getFileFromPath(newImageName)#"><br>
                                   <form action="t14details.cfm" method="post">
                                        <input type="hidden" name="in" value="#variables.imagename#"/>
                                        <input type="hidden" name="ids" value="#variables.imgdescr#"/>
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
          <cfreturn variables.result/>
     </cffunction>
</cfcomponent>