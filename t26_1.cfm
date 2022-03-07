<cfset thisDir = expandPath(".")>
<cfset myfile = FileRead("#thisDir#/t26.txt")/>
<cfdump var="#myfile#"/>
      <cfset words=listToArray(REReplaceNoCase(#myfile#, "[^ A-Z]", "", "All")," ",false,true)/>
      <cfset wordCount = structNew("ordered")>
      <cfloop index="index" array="#words#">
          <cfif structKeyExists(wordCount, index)>
                <cfset wordCount[index]++>
                <cfelse>
              <cfset wordCount[index] = 1>
          </cfif> 
      </cfloop>
           <!--      <cfdump var = "#wordCount#"> -->
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