<html>
      <head>
      </head>
    <body>
        <cfoutput>
              <cfinvoke component="t15" method="multiply" returnvariable="result">
                  <cfinvokeargument name="a" value="10"/> 
                  <cfinvokeargument name="b" value="20"/> 
                  <cfinvokeargument name="c" value="20"/> 
                  <cfinvokeargument name="d" value="20"/> 
              </cfinvoke>
              <br>
              product using cfinvoke :   #result#<br>
              <cfobject name="multiplyObj" type="component" component="t15">
              product using cfobject : #multiplyObj.multiply(1,2,4)#
              <cfset prod=CreateObject("component","t15")/>
              <cfset res=prod.multiply(3,4,5)/> 
              <br> 
              <b>product using crate object : #res# </b> 
          </cfoutput>
    </body>
</html>