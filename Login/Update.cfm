<cfif isDefined('url.id')>
    <cfquery name = "getform" datasource = "dsn_praveen">
        select * from form
        where id = #url.id#
    </cfquery>
    <cfdump var = "#getform#">
    <cfif getform.recordCount GT 0>
        <cfquery name = "new" datasource = "dsn_praveen">
            UPDATE form
            SET
            username = '#form.TXT_NAME#',
            email = '#form.TXT_EMAIL#',
            PASSWORD ='#form.USER_PASSWORD#',
            DOB ='#form.BIRTHDAY#',
            MOBILE='#form.TXT_NUMBER#',
            marrital_status ='#form.MARITAL_STATUS#',
            gender = '#form.GENDER#',
            RELATION ='#form.RELATION#',
            RELATIVE_NAME ='#form.RELATIVENAME#'
            where id = #url.id#;
        </cfquery>
    </cfif>
</cfif>
<cfset session.message = "updated successfully">
<cflocation url = "Profile.cfm">