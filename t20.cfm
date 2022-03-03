<!-- 

Create a page with two textboxes (captcha and email). 
Create captcha using cfimage tag.
To validate the fields captcha(text validation) and email(email validation)
using server side validation.
Once user entered the captcha  & clicked on submit,
then check the entered text is equal to captcha text.
If correct then Page should show the message(Email Address successfully subscribe our newsletter).

 -->



 <cffunction name="createcaptcha" returnType="string" output="false">
	<cfset var chars = "GHJKMNPQRS">
	<cfset var length = randRange(2,4)>
	<cfset var result = "">
	<cfset var i = "">
	<cfset var char = "">
	
	<cfscript>
	for(i=1; i <= length; i++) {
		char = mid(chars, randRange(1, len(chars)),1);
		result&=char;
	}
	</cfscript>
		
	<cfreturn result>
</cffunction>

<cfset showForm = true>
<cfparam name="form.email" default="">
<cfparam name="form.captcha" default="">
<cfparam name="form.captchaHash" default="">

<cfif isDefined("form.sub")>
	<cfset errors = "">
	
	<cfif  NOT reFindNoCase("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.(?:[A-Z]{2}|com|org|net|edu|gov|mil|biz|info|mobi|name|aero|asia|jobs|museum)$", form.Email)>
		<cfset errors = errors & "Enter A valid  emailID.<br />">
	</cfif>


	<cfif hash(ucase(form.captcha)) neq form.captchaHash>
		<cfset errors = errors & "Entered wrong captcha<br />">
	</cfif>
		
	<cfif errors is "">
		
		<cfset showForm = false>
	</cfif>
	
</cfif>
<cfif(isDefined("form.ref"))>

	<cfset captcha = createcaptcha()>
	<cfset captchaHash = hash(captcha)>
</cfif>

<cfif showForm>

	<cfset captcha = createcaptcha()>
	<cfset captchaHash = hash(captcha)>

	<cfoutput>
	
	
	<cfif isDefined("errors")>
	<p align="center">
	<b>Correct these errors:<br /><span style="color:red">#errors#</span></b>
	</p>
	</cfif>
	
	<form action="" method="post" >
	<table align="center">
		<tr>
			<td>Email:</td>
			<td><input name="email" type="text" value="#form.email#"></td>
		</tr>
		
		<tr>
			<td>Enter Captcha:</td>
			<td><input type="text" name="captcha"></td>
		</tr>
		<tr>
			<td colspan="2">
			<cfimage action="captcha" width="300" height="75" text="#captcha#">
			<input type="hidden" name="captchaHash" value="#captchaHash#">
			</td>
            <td><input type="submit" name"ref" value="refresh captcha"/></td>
		</tr>		
		<tr>
			<td> </td>
			<td><input type="submit" name="sub" value="Subscribe to news letter"></td>
		</tr>
	</table>
	</form>
	</cfoutput>
	
<cfelse>

	<cfoutput>
	<p>
	Email Address #form.email# successfully subscribed to our newsletter 
	</p>
	</cfoutput>
	
</cfif>
