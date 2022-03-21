<html>
    <head>
    </head>
    <body>
        <cfoutput>
               <cfif  structKeyExists(form,"viewdata") >  
                    <div align="center">
                         <h1>DETAILS</h1>
                         <img src="./#form.im#"/>
                         <h1>name:#form.in#</h1>
                         <h3>description: #form.ids#</h3>
                    </div>   
               </cfif> 
        </cfoutput>
    </body>
</html>