<html>
    <head>
    </head>
    <body>
        <cfoutput>
               <p>Qn.
               Write a CF program to print data by 3 rows and 3 columns like the example below.
               1    4    7
               2    5    8
               3    6    9 ? 
               </p>
               <cfinvoke component="t15" method="matrix" returnvariable="result">  </cfinvoke>
               <cfloop from="1" to="#ArrayLen(result)#" index="i">
                    <cfloop from="1" to="#ArrayLen(result[i])#" index="j">
                         #result[i][j]# &nbsp;&nbsp;
                    </cfloop>
                    <br>
               </cfloop>     
          </cfoutput>
    </body>
</html>