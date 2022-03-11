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
            <cfset  a= [[1, 4, 7], [2, 5, 8], [3, 6, 9]] />
            <cfloop from="1" to="#ArrayLen(a)#" index="i">
                <cfloop from="1" to="#ArrayLen(a[i])#" index="j">
                   #a[i][j]#&nbsp;
                </cfloop>
              <br>
            </cfloop>
        </cfoutput>
    </body>
</html>