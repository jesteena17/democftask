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
              <form action="t21send.cfm" method="POST" enctype="multipart/form-data">
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
         </cfoutput>
    </body>
</html>