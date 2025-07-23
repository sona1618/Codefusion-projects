<cfquery name="getEmployees" datasource="dsn_praveen">
    select * from form 
    where email = '#form.txt_email#';
</cfquery>
<cfdump var="#getEmployees.RecordCount#">
<cfif getEmployees.RecordCount GT 0> 
   
    <cflocation url="signup.cfm" >

<cfelseif getEmployees.RecordCount EQ 0> 
    <cfquery name="getData" datasource="dsn_praveen">
        INSERT INTO FORM(username,email,password,dob,MOBILE,marrital_status,gender,terms,relation,relative_name)
        VALUES('#form.TXT_NAME#','#form.TXT_EMAIL#','#form.user_password#','#form.BIRTHDAY#','#form.TXT_NUMBER#','#form.MARITAL_STATUS#','#form.GENDER#',#form.AGREE#,'#form.RELATION#','#form.RELATIVENAME#') 
    </cfquery>
    <cflocation url="login.cfm">
     
    
       
</cfif>



 


