<!--- Get user & his mother date of birth.
     show users age & At what age his mother delivered him.
     Tell him how many days are remaining for his & his mother’s birthday. --->



     <form action="" method="post">
        <input type="text" name="sdob" placeholder="mydob"/>
        <input type="text" name="mdob" placeholder="mothersdob"/>
        <input type="submit" name="getdata" value="getdata"/>
     </form>


    <cfif structKeyExists(form,"getdata") and (cgi.REQUEST_METHOD is "post")>
<cfdump var="#sdob#"/>
<cfdump var="#mdob#"/>
<cfset sage = dateDiff("yyyy", sdob, now())>
<cfset mage = dateDiff("yyyy", mdob, now())>
<cfoutput>
    son's age : #sage#<br>
 Mothers age : #mage#<br>
    At what age his mother delivered him : #mage-sage#
</cfoutput>


    </cfif>