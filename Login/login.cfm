<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    
</head>

<body style="background-color:  #f7f7fa;">
    <div class="d-flex justify-content-center align-items-center" id="Container-box">
       
            
        <div class="bg-white border rounded border-0 w-50 " style="margin-top:56px" id="login-pg">
            
            <p class="text-center fw-bolder pt-3 mb-0 mt-3 " style="font-size:25px">Sign In</p>
            <p class="text-center text-body-tertiary mb-3" style="font-size: 21px;">Your Social Compaigns</p>

            <div class="ms-5 text-center">
                <form action="loginAction.cfm"id="forms_login" method="post">
                    <p id="Eror_msgboth" style="font-size: 14px; margin-bottom: 0; ;" class="text-danger  "></p>
                <div class="box1">
                    <input type=" email" id="email" class="Email w-75 mb-2" placeholder="Email"  name="txt_Email">
                </div>
                <div class="box1">
                    <input type="password" id="password" name ="Password" class="pass w-75 mb-3" style="height:34px" placeholder="Password " name="_txtpassword ">       

                </div>
                <div class="box  text-md-end mb-1 ">
                    <a href="forgetpass.cfm" class="forgotpass " >
                        <p class="forgot-pass " style="font-size: 15px; margin-left:18rem ;"> Forgot Password?</p>
                    </a>
                </div>
                <div class="signup h-50 me-4">
                    <input type="submit" value="Sign In" class="ps-3 pb-1 w-75  mb-2 bg-primary bg-gradient text-white fw-bolder border rounded " style="height:44px">
                </div>
                <span class="signup-txt pe-2 " style="font-size: 17px;">Not a member yet? <a href="signup.cfm" style="font-size:17px " >Sign Up
                            
                        </a></span>
                        </form>
            </div>

        </div>
    </div>
   

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js "></script>
</body>
<script>
const loginform = document.querySelector('#forms_login');
loginform.addEventListener("submit",(e) =>{
    e.preventDefault();
    var eror_bothmsg = document.getElementById('email');
    var error_msgboth = document.querySelector('#Eror_msgboth');
    var error_pass = document.querySelector('#password');
    if(eror_bothmsg.value == '' && error_pass.value == '')
        {error_msgboth.innerHTML = 'This field is required';        
    }
    else{
        error_msgboth.innerHTML=""
    }
   loginform.submit()
    return true;

})


    
    </script>



</html>