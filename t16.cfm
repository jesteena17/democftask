<!--- Write a CF program to print data by 3 rows and 3 columns like the example below.

1    4    7
2    5    8
3    6    9 --->



<cfscript>
    a= [[1, 4, 7], [2, 5, 8], [3, 6, 9]];
  
   
</cfscript>

<cfloop from="1" to="#ArrayLen(a)#" index="i">
    <cfoutput>
     <cfloop from="1" to="#ArrayLen(a[i])#" index="j">
      #a[i][j]#&nbsp;
     </cfloop>
     <br>
    </cfoutput>
   </cfloop>