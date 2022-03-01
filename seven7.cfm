<!--- 
ColdFusion Structure
--------------------
Create a web page that will have two text boxes and a submit button.
 When submitted, the page will post to self.
Create a structure in ColdFusion with the values from the text box.
 The text entered in textbox one is the key,
  and the text entered in textbox 2 is the value.
   Each time you submit the form, the values entered previously should also be shown.

It means, if I submit a form with 'ColdFusion', 'super', 
then I should see a dump with the key as 'ColdFusion' & value as 'Super'.
Now, If I enter 'php', 'good', then I should see both ColdFusion, php on the screen along with their values.
CFDUMP the structure.

https://www.sitepoint.com/coldfusion-ii-structs/
https://community.adobe.com/t5/coldfusion-discussions/loop-thru-form-variables/m-p/306711
https://stackoverflow.com/questions/19683868/display-cfloop-items-in-order-from-form
--->



<cfscript>

 employee=StructNew();

 allemployee=ArrayNew(1);
structInsert(employee, "key1", "val1");
structInsert(employee, "key2", "val2");
structInsert(employee, "key3", "val3");
structInsert(employee, "key4", "val4");
ArrayAppend(allemployee,employee );
// WriteOutput(employee);

</cfscript>

<cfloop array="#allemployee#" item="item">
 <cfdump var="#allemployee#"/>
</cfloop>


