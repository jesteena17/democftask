<html>
      <head>
            <link href="./css/commonstyle.css" rel="stylesheet" />
      </head>
      <body>
            <cfoutput>
                  <p>   
                        Create a page with text box  submit button. 
                        User can enter numeric value in the text box  click the submit button.
                        If user entered non numeric character, page should validate user input using JS.
                        While clicking on submit button, page should show up 1 to given input number, 
                        odd numbers should be in blue, even numbers should be in green.
                  </p>
                  <form id="myForm" action="" method="post" onsubmit="return check(this);">
                        <input type="text" id="getnum"  name="getnum"  />
                        <input type="submit" name="sub" id="sub"  value="enter number"/>
                  </form>
                  <span id="demo"></span><br>
                  <cfif structKeyExists(form,"sub") and (cgi.REQUEST_METHOD is "post" )>
                        <cfif IsNumeric(form.getnum)>
                              <cfloop index = "i" from = "1" to = "#form.getnum#" step = "1">
                                    <cfif i mod 2 EQ 0>
                                          <span  class="monday spn">Even  : #i# </span><br>
                                    <cfelse>
                                          <span class="fri spn">Odd  : #i# </span><br>
                                    </cfif>
                              </cfloop>
                        </cfif>
                  </cfif>
            </cfoutput>
            <script>
            function check(form)
            {  
                  let text;
                  if (!(/^[0-9]+$/.test(form.getnum.value))) 
                  {
                        text = "Input only valid numbers";                     
                        document.getElementById("demo").innerHTML = text;
                        document.getElementById("demo").style.color = "red";
                       [].forEach.call(document.querySelectorAll('.spn'), function (el) {
                        el.style.visibility = 'hidden';
                        }); 
                       return false;
                  }    
                  return true;
            }
            </script>
      </body>
</html>

