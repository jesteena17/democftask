<html>
    <head>
    </head>
    <body>
        <cfoutput>
			<p>Create a page with two textboxes (captcha and email). 
			Create captcha using cfimage tag.
			To validate the fields captcha(text validation) and email(email validation)
			using server side validation.
			Once user entered the captcha  and clicked on submit,
			then check the entered text is equal to captcha text.
			If correct then Page should show the message(Email Address successfully subscribe our newsletter).
			</p>
			<cfset variables.showForm = true>
			<cfparam name="form.email" default="">
			<cfparam name="form.captcha" default="">
			<cfparam name="form.captchaHash" default="">
			<cfif isDefined("form.sub")>
				
			</cfif>
			<cfif(isDefined("form.ref"))>
				<cfset prod=CreateObject("component","t20")/>
				<cfset captcha = prod.createcaptcha()>
				<cfset captchaHash = hash(captcha)>
			</cfif>
			<cfif showForm>
				<cfset prod=CreateObject("component","t20")/>
				<cfset captcha = prod.createcaptcha()>
				<cfset captchaHash = hash(captcha)>
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
			<cfelse>
				<p>
				     Email Address #form.email# successfully subscribed to our newsletter 
				</p>
			</cfif>
		</cfoutput>
    </body>
</html>