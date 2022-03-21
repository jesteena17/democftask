<html>
    <head>
    </head>
    <body>
         <cfoutput>
                <p>Qn.
                Write another cfm page, that retrieves the records from database and tells the total number of times a word is present,
                * Words with length less than 3 are not counted.
                * Numbers are not counted and saved into the database.
                * Result should be in decreasing order of the count of words
                * Result should be in decreasing order of length of the text
                * Result should be in alphabetical order
                Ex: India is huge country. India has 29 states. Indians are nice. It has a nice climate.
                Should return - India (2), - nice (2), - has (2), - country (1),- Indians (1)? 
                </p>
                <cfinvoke component="t26" method="displaydata" returnvariable="result"></cfinvoke>
                <!-- <cfdump var = "#result#" > -->  
                <table border="1" width="400"> 
                    <tr>
                        <th width="50%">Word</th>
                        <th>Count</th> 
                    </tr>
                    <cfloop  query=result>
                        <tr> 
                            <td >#result.allwords#</td>
                            <td >#result.wordcount#</td> 
                        </tr> 
                    </cfloop>
                </table>    
            </cfoutput>
        </body>
</html>