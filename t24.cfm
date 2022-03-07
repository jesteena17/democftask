<!--  

Create a subscribe form with first name,
 Email id text boxes.Near email id text box, check button should be there.
 Below these text boxes submit button should be there. 
 By default the submit button should be disabled. 
 While clicking that, check mail id in Database using Ajax.
  If the user entered the mail id there, then it would give an error message like "Mail id is already there".
   If not, enable the submit button.
    While clicking on the submit button it will insert first name & email id into the database.

 -->
 <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script src="./js/jquery-1.12.4.js"></script>
        <script src="./js/t24.js"></script>
        </head>
        <body>
            <form id="form1" name="form1" method="post" action="">
                <p> fullname : <input type="text" name="fullname" id="fullname" required />
                </p>
                <p>
                email : <input type="text" name="username" id="email" /> 
                <input type="checkbox" name="verify" id="verify" value="add" required/>add email to db
                </p>
                <p>
                    <input type="submit" name="reg" id="reg" value="Submit" />
                </p>
            </form>
        </body>
</html>