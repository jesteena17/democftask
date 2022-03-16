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
               <form method="post" action="">
                    <input type="submit" name="click" value="click"/>
               </form>
               <cfif structKeyExists(form,"click")>
                    <cfinvoke component="t15" method="t19Cookies" returnvariable="result"></cfinvoke>
                    Your Total Visit Count : #result#
               </cfif>
        </cfoutput>
    </body>
</html>