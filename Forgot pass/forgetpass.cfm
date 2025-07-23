<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>

    
    
<cfoutput>      
    <div style="text-align:center; margin-bottom: 4rem;margin-top: 2rem;">
        <h2 style="margin-bottom:5rem">Forgot your Password!</h2>
        <form action="forgetAction.cfm" method="POST">
        <input type="text"placeholder="Enter your email" style="width: 20rem;
              height: 40px;
              border: 1px solid bisque;
              border-radius: 30px;
              padding-left: 27px;
              margin-left: 20px;
              margin-bottom: 10px;" name="forget_email"><br>
        <input type="text" id="chng_pass"  name="changepass" placeholder="Change your password" style="width: 20rem;
              height: 40px;
              border: 1px solid bisque;
              border-radius: 30px;
              padding-left: 27px;
              margin-left: 20px;
              margin-bottom: 10px;"><br>
        <input type="text" id="confim_pass" name="confirmpass" placeholder="Confirm your password" style="width: 20rem;
        height: 40px;
        border: 1px solid bisque;
        border-radius: 30px;
        padding-left: 27px;
        margin-left: 20px;
        margin-bottom: 10px;"><br>
        <p id="Eror_pass" style="font-size: 14px; margin-bottom: 0; ;" class="text-danger  "></p>

        <input type="submit"  style="height: 44px;
        width: 11rem;
        margin: 1rem 0;
        border-radius: 30px;
        border: 1px solid bisque;">
        </form>
        
    </div>
</cfoutput>
</body>

<script>
   
   const submitform = document.querySelector('#forms');

    submitform.addEventListener("submit", (e) => {
        e.preventDefault();
       
        var pass_val = document.querySelector('#chng_pass');
        var pass_chng = document.querySelector('#confim_pass');
        var errorpass = document.querySelector('#Eror_pass');
        console.log(pass_chng.value);
         if(pass_val.value == '' &&  pass_chng.value == ''){
            errorpass.innerHTML = "This field is required"  
         }
         else if(!pass_val.value == pass_chng.value){
            errorpass.innerHTML ="password should be match"
         }
         submitform.submit()
       
         return false;
    })
   
</script>
</html>