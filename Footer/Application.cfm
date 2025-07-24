<cfapplication name = "sigup" sessionmanagement = "YES" 
               applicationtimeout = #createTimespan(1, 0, 0, 0)# 
               sessiontimeout = #createTimespan(1, 0, 0, 0)#>

<cfset session.mm = "praveen">