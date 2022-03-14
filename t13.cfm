<html>
    <head>
        <link href="./css/commonstyle.css" rel="stylesheet" />
    </head>
    <body>
        <cfoutput>
            <cfset text="the quick brown fox jumps over the lazy dog">
                
                <form action="" method="post">
                    <input type="text" name="serch" placeholder="enter key" />
                    <input type="submit" name="getdata" value="getdata" />
                </form>
                <cfif structKeyExists(form,"getdata") and (cgi.REQUEST_METHOD is "post" )>
                    <cfset keyword="#form.serch#"/>
                   <cfset  text = "# (FindNoCase(keyword, text))? ReplaceNoCase(text, keyword, '<span class="search">' &
                                Mid(text, FindNoCase(keyword, text), Len(keyword)) & '</span>', 'all') : text #" />
                </cfif>
                #text#
        </cfoutput>
    </body>

</html>