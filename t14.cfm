<cfparam name="form.imagenm" default="" type="string">
<cfparam name="form.imgdesc" default="" type="string">
<cfparam name="form.image" default="" type="string">
<html>
    <head>
    </head>
    <body>
        <cfoutput>
            <p>  
                Create a form with Image name text box , description text area  Image upload field.
                User can upload only small size jpg,png and gif files. Add validation to check uploaded file type  file size. User should not upload a image which is greater than 1 MB. Once user uploaded a image,create a thumbnail image (20*20 size) from uploaded images. In list page, show thumbnail image & image name. While clicking on the image name, 
                it should redirect the user to details page which will show image name, description  original uploaded image.
            </p>
            <form action="" method="post" enctype="multipart/form-data">
                image name <input type="text" name="imagenm" value="#form.imagenm#" required="" /><br><br>
                description <textarea name="imgdesc" required="">#form.imgdesc#</textarea><br><br>
                upload an image: <input type="file" required="" name="image"><br><br>
                <input type="submit" value="Send Image" name="send">
            </form>
            <cfif structKeyExists(form,"send")>
                  <cfinvoke component="t14" method="CreateImageThumb" returnvariable="result"></cfinvoke>
                   #result#
            </cfif>          
        </cfoutput>    
    </body>
</html>