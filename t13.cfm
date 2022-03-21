<cfparam name="form.serch" default="the" type="string">
<html>
        <head>
        <link href="./css/commonstyle.css" rel="stylesheet" />
        </head>
        <body>
               <cfoutput>
                    <cfset variables.result="the quick brown fox jumps over the lazy dog">
                    <form action="" method="post">
                         <input type="text" name="serch" value="#form.serch#" placeholder="enter key" />
                         <input type="hidden" name="origdata" value="#variables.result#"/>
                         <input type="submit" name="getdata" value="getdata" />
                    </form>
                    <cfif structKeyExists(form,"getdata")  >
                         <cfinvoke component="t13" method="SearchData" returnvariable="result"></cfinvoke>
                    </cfif>
                    #result#
               </cfoutput>
        </body>
</html>