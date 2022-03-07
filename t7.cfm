<!-- 
Create a web page that will have two text boxes and a submit button.
 When submitted, the page will post to self.
Create a structure in ColdFusion with the values from the text box.
 The text entered in textbox one is the key, and the text entered in textbox 2 is the value. 
 Each time you submit the form, the values entered previously should also be shown. 
It means, if I submit a form with 'ColdFusion', 'super', 
then I should see a dump with the key as 'ColdFusion' & value as 'Super'.
Now, If I enter 'php', 'good', then I should see both ColdFusion, php on the screen along with their values.
CFDUMP the structure.


-->
<form action="" method="post">
    <input type="text" name="key1" placeholder="enter key"/>
    <input type="text" name="val1" placeholder="enter val"/>
    <input type="submit" name="getdata" value="getdata"/>
 </form>
<cfif structKeyExists(form,"getdata") and (cgi.REQUEST_METHOD is "post")>
<cfset  StructInsert(application.demostruct, #form.key1#, #form.val1# )> 
<cfdump var = #application.demostruct#  >
</cfif>

  
