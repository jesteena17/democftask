
<cfset text = "the quick brown fox jumps over the lazy dog">
<cfoutput>

#text#
</cfoutput>

<form action="" method="post">
    <input type="text" name="serch" placeholder="enter key"/>
  
    <input type="submit" name="getdata" value="getdata"/>
 </form>

<cfif structKeyExists(form,"getdata") and (cgi.REQUEST_METHOD is "post")>
   <cfset keyword = "#form.serch#">


<cfoutput>
    #(FindNoCase(keyword, text))? ReplaceNoCase(text, keyword, '<font style="background-color:yellow;">' & Mid(text, FindNoCase(keyword, text), Len(keyword)) & '</font>', 'all') : text#
</cfoutput>

</cfif>