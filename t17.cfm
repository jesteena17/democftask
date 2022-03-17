<cfparam name="form.getnum" default=12 type="integer">
<html>
      <head>
            <link href="./css/commonstyle.css" rel="stylesheet" />
            <script src="js/t17.js"></script>
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
                        <input type="text" id="getnum" value="#form.getnum#"  name="getnum"  />
                        <input type="submit" name="sub" id="sub"  value="enter number"/>
                  </form>
                  <span id="demo"></span><br>
                  <cfif structKeyExists(form,"sub")  >
                        <cfif IsNumeric(form.getnum)>
                              <cfloop index = "i" from = "1" to = "#form.getnum#" step = "1">
                                   <cfinvoke component="t15" method="EvenOdd" returnvariable="result">
                                        <cfinvokeargument name="numin" value=#i#/> 
                                   </cfinvoke>
                                   <cfif  result eq "even">
                                        <span  class="Monday spn">Even  : #i# </span><br>
                                   <cfelse>
                                        <span class="Friday spn">Odd  : #i# </span><br>
                                   </cfif>
                              </cfloop>
                        </cfif>
                  </cfif>
            </cfoutput>
      </body>
</html>

