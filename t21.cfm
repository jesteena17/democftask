<cfparam name="form.name" default="jes">
<cfparam name="form.MailTo" default="jinutomy17@gmail.com">
<cfparam name="form.mailfrom" default="rishiba.pp.niitclt@gmail.com">
<cfparam name="form.subject" default="Birthday Greeting">
<cfparam name="form.body" default="Happy BIrthdayys">
<cfparam name="form.FiletoUpload" default="">
<html>
    <head>
          <link href="css/commonstyle.css" rel="stylesheet" />
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
                              <td><input type="Text" value="#form.name#" name="name"></td>
                         </tr>
                         <tr>
                              <th>email</th>
                              <td>
                              <input type="Text" value="#form.MailTo#" name="MailTo">
                              <input type="hidden" name="mailfrom" value="#form.mailfrom#" />
                              <input type="hidden" name="subject" value="#form.subject#" />
                              </td>
                         </tr>
                         <tr>
                              <th>wishes</th>
                              <td><textarea name="body" cols="40" rows="5" wrap="virtual">#form.body#</textarea> </td>
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
              <cfif StructKeyExists(form,"sub")>  
                    <cfinvoke component="t20" method="sendgreetngs" returnvariable="result"></cfinvoke>
                     <p class="Monday">#result#</p>
               </cfif>  
         </cfoutput>
    </body>
</html>