
<cfinvoke component="t15" method="multiply" returnvariable="result">
   
    <cfinvokeargument name="a" value="10"/> 
    <cfinvokeargument name="b" value="20"/> 
     <cfinvokeargument name="c" value="20"/> 
          <cfinvokeargument name="d" value="20"/> 
</cfinvoke>


<cfoutput>
    <br>

  product using cfinvoke :   #result#
    <br>
</cfoutput>



<cfobject name="multiplyObj" type="component" component="t15">
<cfoutput>
product using cfobject : #multiplyObj.multiply(1,2,4)#
</cfoutput>



<cfscript> 
prod=CreateObject("component","t15"); 
res=prod.multiply(3,4,5); 
</cfscript> 
<br> 
<b>product using crate object : </b> 
<cfoutput>#res#</cfoutput>