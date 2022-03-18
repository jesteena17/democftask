
<cfparam name="form.key1" default="" type="string">
<cfparam name="form.val1" default="" type="string">
<html>
      <head>
      </head>
      <body>
            <cfoutput>
                    <p>Create a web page that will have two text boxes and a submit button.
                        When submitted, the page will post to self.
                        Create a structure in ColdFusion with the values from the text box.
                        The text entered in textbox one is the key, and the text entered in textbox 2 is the value. 
                        Each time you submit the form, the values entered previously should also be shown. 
                        It means, if I submit a form with 'ColdFusion', 'super', 
                        then I should see a dump with the key as 'ColdFusion'  value as 'Super'.
                        Now, If I enter 'php', 'good', then I should see both ColdFusion, php on the screen along with their values.
                        CFDUMP the structure.
                    </p>
                    <form action="" method="post">
                        <input type="text" name="key1" placeholder="enter key"/>
                        <input type="text" name="val1" placeholder="enter val"/>
                        <input type="submit" name="getdata" value="getdata"/>
                    </form>
      
<cflock scope="Application" timeout="10" type="Exclusive"> 
<cfif not IsDefined("x")> 
<cfset x = 0> 

                 <cfset  array = ArrayNew(1)>  
</cfif> 
</cflock>
              
                    <cfif structKeyExists(form,"getdata") >
                        <cfinvoke component="t15" method="t19Cookies" returnvariable="result"></cfinvoke>
                        
                              <cfset mystruct = StructNew()>
                               <cfset StructInsert(mystruct, #form.key1#,#form.val1#)>
                       
                        <cfset array[result] = mystruct>
                    
                   </cfif> 
    
                       
                  <cfdump var= #array# />
            </cfoutput>    
    </body>
</html>