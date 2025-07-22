<cfdump var = "#form#">
<cfquery name = 'getlogin' datasource = "dsn_praveen">
    SELECT * FROM form
    WHERE email = '#form.TXT_EMAIL#'
    AND password ='#form.PASSWORD#' 
</cfquery>

<cfif getlogin.RecordCount GT 0>
    <cfset session.email = '#form.TXT_EMAIL#'>
    <cflocation url = "Profile.cfm " addtoken = "NO">
<cfelse>
    <cflocation url = "login.cfm " addtoken = "NO">
</cfif>