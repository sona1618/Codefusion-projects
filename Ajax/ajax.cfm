
<cfquery name='newData' datasource="dsn_praveen">
select * from profile 
where Email = '#session.email#'
</cfquery>

<cfdump var="#myData#">
<cfif newData.RecordCount EQ 0>

<cfquery name="img_upd" datasource="dsn_praveen">
            INSERT INTO profile(Email,img)
            VALUES('#session.email#','#myData#');
</cfquery>
</cfif>
<cfif newData.RecordCount GT 0 > 
   
                <cfquery name = "update" datasource="dsn_praveen">
                UPDATE profile 
                set img = '#myData#'
                where Email = '#session.email#'
 </cfquery>   
</cfif>
