<cfparam name="form.FiletoUpload" default=""> 
<html>
    <head>
    </head>
    <body>
          <cfoutput>
               <p>Qn.In CF_DB_WordCount_1 task, rather than using a text area, you should read from a uploaded txt file ?  </p>
               <form action="" method="post" enctype="multipart/form-data">
                    Please upload a txt file:<input type="file" name="FiletoUpload" size="45"><br>
                    <input type="submit" value="Send file" name="registerbtn">
               </form>
               <cfif  (structKeyExists(form, "registerbtn"))> 
                    <cfinvoke component="t26" method="addcount" returnvariable="wordCount"></cfinvoke>                   
                    <cfloop item="index" collection="#wordCount#">
                         <cfinvoke component="t26" method="insertData" returnvariable="result">
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