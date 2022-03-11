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
                <textarea  name="stringdata" rows="5" cols="55">India is huge country. India has  states. Indians are nice. It has a nice climate.i love india and its climate. climate is awesome</textarea>
                <input type="submit" value="submit" name="store">
            </form>
            <cfif structKeyExists(form,"store") and (cgi.request_method is "post")>
                  <cfset words=listToArray(REReplaceNoCase(#form.stringdata#, "[^ A-Z]", "", "All")," ",false,true)/>
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
                  <cfinvoke component="t2525" method="insertData">
                      <cfinvokeargument name="word" value="#wordCount#"/> 
                  </cfinvoke>
              
              </cfif>
              
          </cfoutput>
      </body>
</html>