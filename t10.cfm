<html>
      <head>
      </head>
      <body>
            <cfoutput>
                <p>
                    Create a web page that will have two text boxes and a submit button. When submitted, the page will post to self
                    Create a structure in ColdFusion with the values from the text box. The text entered in text box one is the key,
                     and the text entered in text box 2 is the value. Each time you submit the form, the values entered previously should also be shown. 
                    It means, if I submit a form with 'ColdFusion', 'super', then structure should have key as 'ColdFusion'  value as 'Super'.
                    Now, If I enter 'php', 'good', then structure should have both ColdFusion, php along with their values
                    In this task, you should show the keys in alphabetical order.
                </p>
                <form action="" method="post">
                    <input type="text" name="key1" placeholder="enter key"/>
                    <input type="text" name="val1" placeholder="enter val"/>
                    <input type="submit" name="getdata" value="getdata"/>
                </form>
                <cfif NOT StructKeyExists(Session, "mystruct")>
                    <cflock timeout=20 scope="Session" type="Exclusive">
                        <cfset Session.mystruct = StructNew("ordered")>
                    </cflock>
                </cfif>
                <cfif structKeyExists(form,"getdata") >
                    <cfif StructKeyExists(Session, "mystruct")>
                        <cfif  StructKeyExists(Session.mystruct,"#form.key1#")>
                                <cfset structupdate(Session.mystruct, #form.key1#,#form.val1#)> 
                        <cfelse>
                                <cfset structinsert(Session.mystruct, #form.key1#,#form.val1#)>        
                        </cfif>
                    </cfif>
                </cfif> 
               <cfif not StructIsEmpty(#session.mystruct#)>
                <cfset sorted = session.mystruct.ToSorted("text","asc",false)>
                <cfloop collection="#sorted#" item="i">
                     #i# - #sorted[i]#<br>
                </cfloop>
                </cfif>
            </cfoutput>    
    </body>
</html>