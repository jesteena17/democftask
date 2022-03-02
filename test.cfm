<cfscript>
	// Setup our default form field values.
	param name="form.newUserID" type="string" default="";
	param name="form.removeUserID" type="string" default="";
	param name="form.userIDs" type="array" default=[];
	// If a new ID was provided, add it to the collection!
	// --
	// NOTE: For the sake of simplicity, we are not going to do any special handling of
	// commas in the value. We're just assuming that this is a controlled environment
	// with valid inputs.
	if ( form.newUserID.len() ) {
		form.userIDs.append( form.newUserID );
	}
	// If a remove ID was provided, remove it from the collection!
	if ( form.removeUserID.len() ) {
		form.userIDs.delete( form.removeUserID );
	}
</cfscript>
<cfoutput>

	<form method="post" action="#cgi.script_name#">

		<!--- NEW userID related fields. --->
		<p>
			<input
				type="text"
				name="newUserID"
				value=""
				placeholder="New user ID..."
				autofocus
			/>

			<button type="submit">
				Add User ID
			</button>
		</p>

		<table border="1" cellpadding="10" cellspacing="2">
		<thead>
			<tr>
				<th> User ID </th>
				<th> <br /> </th>
			</tr>
		</thead>
		<cfloop index="id" array="#form.userIDs#">
			<tr>
				<td>
					#encodeForHtml( id )#
				</td>
				<td>
					<!---
						In order to make sure that the full set of user IDs is maintained
						across the various FORM POSTS, we are going to include each ID as
						a hidden input field. Then, on each form post, ColdFusion will
						collapse all of the like-named fields into a single value. And,
						since we using the "[]" suffix, that value will be an ARRAY.
					--->
					<input
						type="hidden"
						name="userIDs[]"
						value="#encodeForHtmlAttribute( id )#"
					/>

					<!---
						Each row in this table will have its own SUBMIT BUTTON. However,
						since they are using unique Name/Value pairs, we can easily
						determine which value the user was referring to (since we're
						submitting the target ID as the VALUE).
					--->
					<button
						type="submit"
						name="removeUserID"
						value="#encodeForHtmlAttribute( id )#">
						Remove
					</button>
				</td>
			</tr>
		</cfloop>
		</table>

		<p>
			<!---
				A no-op post back, just to demonstrate that all of the hidden inputs will
				correctly maintain the current list of IDs.
			--->
			<button type="submit">
				Post Back
			</button>

			<a href="#cgi.script_name#">
				Clear
			</a>
		</p>

	</form>

</cfoutput>