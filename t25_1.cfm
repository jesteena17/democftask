<html>
    <head>
    </head>
    <body>
     <cfoutput>
            <p>  Qn.
                 Write in Index.cfm, that will save the words in a given paragraph of text into the database as individual records. It means, each word is one row.
	               Ex: "India is huge country." This will create 4 rows in the table.? 
            </p> 
            <form action="" method="post">
                <textarea  name="stringdata" rows="5" cols="55">India is huge country. India has  states. Indians are nice. It has a nice climate. i love india and its climate. climate is awesome</textarea>
                <input type="submit" value="submit" name="store">
            </form>
            <cfif structKeyExists(form,"store") >
                  <cfset words=listToArray(REReplaceNoCase(#form.stringdata#, "[^ A-Z]", "", "All")," ",false,false)/>
                  <cfset wordCount = structNew("ordered")/>
                  <cfloop index="index" array="#words#">
                    <cfif len(#index#) GTE 3>
                      <cfif structKeyExists(wordCount, index)>
                        <cfset wordCount[index]++ />
                      <cfelse>
                        <cfset wordCount[index] = 1/>
                      </cfif> 
                    </cfif>
                  </cfloop>
                    <cfloop item="index" collection="#wordCount#">
                        <cfinvoke component="t25" method="insertData" returnvariable="result">
                        <cfinvokeargument name="word" value="#index#"/> 
                        <cfinvokeargument name="count" value="#wordCount[index]#"/> 
                        </cfinvoke>
                  </cfloop>
                   <cfif result GT 0>
                        <script>
                        alert("Data Addedd Successfully");
                        </script>
                        <cfelse>
                        <script>
                        alert("error adding dupliacte records");
                        </script>
                  </cfif>
              </cfif> 
          </cfoutput>
      </body>
</html>