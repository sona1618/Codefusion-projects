
<cfdump var="#form#" >

<cfquery name = 'forgetpass' datasource="dsn_Praveen">
select * from form
WHERE email = '#form.forget_email#'
</cfquery>
<cfdump var="#forgetpass.RecordCount#">

<cfif forgetpass.RecordCount GT 0>
  <cfquery name ='updatepass' datasource="dsn_Praveen"> 
update form 
set password = '#form.CONFIRMPASS#' 
where email = '#form.forget_email#';
        </cfquery>
        


<cflocation url="login.cfm">




    <cfelse>
        <cflocation url="Desktop.cfm">
    
</cfif>
