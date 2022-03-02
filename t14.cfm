<!--- Create a form with Image name text box , description text area & Image upload field.
     User can upload only small size jpg,png and gif files. Add validation to check uploaded file type & file size. User should not upload a image which is greater than 1 MB. Once user uploaded a image,create a thumbnail image (20*20 size) from uploaded images. In list page, show thumbnail image & image name. While clicking on the image name, 
    it should redirect the user to details page which will show image name, description & original uploaded image. --->


<!--- This code creates a form with one field where the user enters the image file to upload. --->
<form action="makeThumbnail.cfm" method="post" enctype="multipart/form-data">
image name <input type="text" name="imagenm" required=""/><br>
image description <textarea name="imgdesc" required=""></textarea>
Please upload an image: <input type="file" required="" name="image">
<input type="submit" value="Send Image" name="Submit">
</form>