<!--

Create a web page that will have two text boxes and a submit button. When submitted, the page will post to self
Create a structure in ColdFusion with the values from the text box. The text entered in text box one is the key, and the text entered in text box 2 is the value. Each time you submit the form, the values entered previously should also be shown. 
	It means, if I submit a form with 'ColdFusion', 'super', then structure should have key as 'ColdFusion' & value as 'Super'.
	Now, If I enter 'php', 'good', then structure should have both ColdFusion, php along with their values
In this task, you should show the keys in alphabetical order.


-->



<form action="" method="post">
    <input type="text" name="key1" placeholder="enter key"/>
    <input type="text" name="val1" placeholder="enter val"/>
    <input type="submit" name="getdata" value="getdata"/>
 </form>


 
<cfif structKeyExists(form,"getdata") and (cgi.REQUEST_METHOD is "post")>

<cfset  StructInsert(application.demostruct, #form.key1#, #form.val1# )> 
  

<cfset sorted = structSort(application.demostruct, "text", "asc")> 



<cfdump var = #application.demostruct#  >


</cfif>

  
