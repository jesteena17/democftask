<cfscript> 
employee=StructNew(); 
if (IsDefined("Form.submit")) { 

if ((Form.key1 NEQ "") AND (Form.val1 NEQ ""))
 { 

employee[Form.key1]=Form.val1; 


} 

}
</cfscript>

<form action="" method="post">
    <input type="text" name="key1" placeholder="enter key"/>
    <input type="text" name="val1" placeholder="enter val"/>
    <input type="submit" name="submit" value="getdata"/>
 </form>


<cfdump var="#employee#"/>