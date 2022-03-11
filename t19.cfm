<html>
    <head>
    </head>
    <body>
        <cfoutput>
            <p>Create a web page that will have one submit button.
              When submitted, the page will post to self. 
              Create a cookie named 'VisitsCounter' and every time the submit button is clicked and the page is posted,
              the 'VisitsCounter' should be increased by 1
              and the increased value is shown on the page.
            </p>
            <cfif cgi.REQUEST_METHOD is "post" and structKeyExists(form,"click")>
              <cfif IsDefined("Cookie.VisitsCounter") is False>
                  <cfcookie name="VisitsCounter" value="1" />
                  Your Total Visit Count : 1
                  <cfelse> 
                  <cfset count = #cookie.VisitsCounter# />
                  <cfset count = count + 1/>
                  <cfcookie name="VisitsCounter" value=#count# />
                  Your Total Visit Count : #VisitsCounter#
              </cfif> 
            </cfif>
            <form method="post" action="">
              <input type="submit" name="click" value="click"/>
            </form>
          
        </cfoutput>
    </body>
</html>