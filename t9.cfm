<html>
      <head>
      </head>
      <body>
            <cfoutput>
                <p>Create a web page that will have two text boxes and a submit button.
                    When submitted, the page will post to self.
                    Create a structure in ColdFusion with the values from the text box.
                    The text entered in text box one is the key, and the text entered in text box 2 is the value.
                    Each time you submit the form, the values entered previously should also maintained in the structure.
                    It means, if I submit a form with 'ColdFusion', 'super',
                    then structure should have key as 'ColdFusion'  value as 'Super'.
                    Now, If I enter 'php', 'good', then structure should have both ColdFusion, php along with their values.
                    If I enter ColdFusion again, with different value, then the new value should replace the old value.
                    CFDUMP the structure.
                    This is different from CF_Struct_3 task. If I enter ColdFusion and ColdFusion is already present,
                    then the system should say, 'ColdFusion already present. Cannot add again'
                </p>
                <form action="" method="post">
                    <input type="text" name="key1" placeholder="enter key"/>
                    <input type="text" name="val1" placeholder="enter val"/>
                    <input type="submit" name="getdata" value="getdata"/>
                </form>
                    <cfif structKeyExists(form,"getdata") >
                         <cfinvoke component="t6to10" method="Structex9" returnvariable="result"></cfinvoke>
                         <cfloop collection = "#result#" item = "index">
                               #index#-#result[index]#<br>
                              <cfif  index eq "error">
                                   <script>
                                        alert("data already present. Cannot add again");
                                   </script>
                              </cfif>
                         </cfloop>
                    </cfif> 
            </cfoutput>    
    </body>
</html>

