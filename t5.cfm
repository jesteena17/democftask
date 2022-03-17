<cfparam name="form.sdob" default="01/12/1996" type="string">
<cfparam name="form.mdob" default="29/12/1968" type="string">
<html>
    <head>
    </head>
    <body>
        <cfoutput>  
            <form action="" method="post">
              Son's Dob <input type="text" name="sdob" value="#form.sdob#" placeholder="mydob"/>
              Moms Dob  <input type="text" name="mdob" value="#form.mdob#" placeholder="mothersdob"/>
                        <input type="submit" name="getdata" value="getdata"/>
            </form>
            <cfif structKeyExists(form,"getdata")>
                <cfinvoke component="t5" method="Age" returnvariable="result"></cfinvoke>
                    son's age : #result.sonage#<br>
                    Mothers age : #result.momage#<br>
                    At what age his mother delivered him : #result.momageatbirth#
            </cfif>
        </cfoutput>   
    </body>
</html>