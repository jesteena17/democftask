<cffunction name="multiply"> 
   <cfset this.sum = 1>   
    <cfloop collection="#Arguments#" item="argument">    
      <cfset this.sum = this.sum * Arguments[argument]>  
        </cfloop>    <cfreturn this.sum>  </cffunction>   
         
   <cfset theval=multiply(1)><cfoutput>
 the result : #theval#
</cfoutput> <br>
   <cfset theval=multiply(1, 2)> <cfoutput>
 the result : #theval#
</cfoutput> <br>
   <cfset theval=multiply(1, 2, 3)><cfoutput>
 the result : #theval#
</cfoutput> <br>
   <cfset theval=multiply(Arg1=8)> <cfoutput>
 the result : #theval#
</cfoutput> <br>
   <cfset theval=multiply(Arg2=9)><cfoutput>
 the result : #theval#
</cfoutput> <br>
   <cfset theval=multiply(Arg1=8, Arg2=9)> <cfoutput>
 the result : #theval#
</cfoutput> <br>
   <cfset theval=multiply(Arg2=6, Arg1=7)> <cfoutput>
 the result : #theval#
</cfoutput> <br>
   <cfset theval=multiply(Arg1=8, Arg2=9, Arg3=10)> <cfoutput>
 the result : #theval#
</cfoutput> <br>
<cfset theval=multiply(5,4,3,2,1)> <cfoutput>
 the result : #theval#
</cfoutput> 