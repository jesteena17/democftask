<html>
      <head>
      </head>
      <body>
            <cfoutput>
                <p>     
                    Create a web page that will have two text boxes and a submit button.
                    When submitted, the page will post to self
                    Create a structure in ColdFusion with the values from the text box. 
                    The text entered in text box one is the key, and the text entered in text box 2 is the value.
                    CFDUMP the structure.
                 </p>
                <form action="" method="post">
                    <input type="text" name="key1" placeholder="enter key"/>
                    <input type="text" name="val1" placeholder="enter val"/>
                    <input type="submit" name="getdata" value="getdata"/>
                </form>
                <cfif structKeyExists(form,"getdata") and (cgi.REQUEST_METHOD is "post")>
                    <cfset employee=StructNew()>
                    <cfset value=StructInsert(employee, "#form.key1#", "#form.val1#")>
                    <cfdump var="#employee#"/>
                </cfif>
            </cfoutput>    
    </body>
</html>