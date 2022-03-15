<html>
    <head>
       <link href="./css/commonstyle.css" rel="stylesheet" />
    </head>
    <body>
         <cfoutput>
                  <p>Qn.
                        Depending on the number of times a word is present in the given text, the size of the word should be increased. 
                        Hint: Use relative font sizes from CSS properties.
                        Bonus Point: Use different colors.? 
                  </p>
                  <cfinvoke component="t25" method="displaydata" returnvariable="result"></cfinvoke>
                  <!-- <cfdump var = "#result#" >   -->   
                  <table border="1" width="400">
                        <tr> 
                        <th width="50%">Word</th> 
                        <th>Count</th> 
                        </tr>
                        <cfloop  query="#result#">
                              <cfif #result.wordcount# GTE 3>
                                    <cfset stclass="big"> 
                              <cfelseif #result.wordcount#  GTE 2 and result.wordcount LTE 3 >
                                    <cfset stclass="med" > 
                              <cfelse>
                                    <cfset stclass="smal" > 
                              </cfif>
                              <tr> 
                                    <td class="#stclass#">#result.allwords#</td> 
                                    <td  class="#stclass#">#result.wordcount#</td> 
                              </tr> 
                        </cfloop>
                  </table>
        </cfoutput>
    </body>
</html>