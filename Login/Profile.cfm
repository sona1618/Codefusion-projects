
<cfquery name="datasbs" datasource="dsn_praveen" >
    select * from form
    where email = '#session.email#'
    
</cfquery>

<cfdump var="#datasbs.id#" >

<cfquery name='imgData' datasource="dsn_praveen">
    select * from profile 
    where Email = '#session.email#'
</cfquery>
    
<cfdump var='#imgData.img#'>



    

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js">var wraper = $('<div>').css({height:0,width:0,'overflow':'hidden')};
        // var filein = $(':file').wrap(wraper);
        // filein.change(function(){
        //     var text =$('#imgage_upld').html();
        //     text =text.substring(text.lastIndexof(\\) + 1,text.length)
        //     $('#imgage_upld').html(text);
        //     $this = $(this)
        //     $('#imgage_upld').text($this.get(0).files.item(0).name)
        // })
        // $('#imgage_upld').click(function(){
        //     filein.click();
        // })show()</script>
</head>

<body style="background: linear-gradient(45deg, light-white, transparent); height: 100vh;">
<script>
<cfif isDefined('session.message') AND Len('session.message')>
    var messag = 
    <cfoutput>'#session.message#'</cfoutput>
    ;
    alert(messag);
    <CFSET StructDelete(Session, "message")>
</cfif>
</script>
 
    <form name="forms"  method="POST" enctype="multipart/form-data" class="d-flex align-item-center justify-content-center " >
        <div style="text-align:center; height: 74vh; margin-top: 4rem;border: 2px solid #848484;  border-radius: 19px;
        width: 20%">
<cfoutput><img src="images/#imgData.img#"  style="height:100px; margin-top:10px;box-shadow: 2px 2px 10px;border-radius: 54px ; margin-bottom: 20px;" ><br>
    <div id="file"></div>
</cfoutput>
    
<label>    <i class="bi bi-camera-fill" style="position: absolute;
    top: 12rem;
    background: aquamarine;
    border-radius: 20px;
    width: 27px;
    left: 42rem;"></i> 
      <input type="file"  id="imgage_upld" name="imgUpld" onchange=onUpld() value="" style="display:none" size="60" >
      
        </label> 
    <cfoutput >
        <a href="signup.cfm?id=#datasbs.id#">
        </cfoutput>  
            <input type="button"  style="width:15%";font-size:15px" name="update"  value ="Edit"><br>          
       </a>

    <cfoutput>
            
   Name     <span>#datasbs.username#</span><br>
   Phone    <span >#datasbs.MOBILE#</span> <br>
   Email    <span >#datasbs.email#</span><br>
   Gender   <span >#datasbs.gender#</span><br>
            
</cfoutput>
<script>

function onUpld(){ 
  

var img_val =document.querySelector('#imgage_upld').value;
var chng = img_val.replace(/^C:\\fakepath\\/,"")

console.log(chng)
            $.post('ajax.cfm',
            {  myData:chng},
            function(res){
                console.log(res)   

        });
        setTimeout(function(){
    location.reload();
}, 1000);
// }
}
</script>
        </div>

    
    </form>

  

        
    

</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js "></script>


</html>