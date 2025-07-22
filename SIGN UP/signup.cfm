<!DOCTYPE html>

<cfquery name="get" datasource="dsn_praveen">
    select * from profile 
    where Email = '#session.email#'
</cfquery>
<cfquery name ="userData" datasource="dsn_praveen">
select * from form 
where email ='#session.email#'   
</cfquery>
    <cfif isDefined('url.id')>
        <cfquery name="getform" datasource="dsn_praveen">
            select * from form 
            where id = #url.id#
            </cfquery>     
        <cfset email_val='#getform.email#'>
        <cfset name='#getform.username#'>

        <cfset dob='#getform.DOB#'>
        <cfset dob1 = DateFormat(dob,"mm/dd/yyyy")>
   
        <cfset phone='#getform.MOBILE#'>
        <cfset pass='#getform.password#'>
        <cfset passre='#getform.password#'>
        <cfset check='#getform.terms#'>
        <cfset gender='#getform.gender#'>
        <cfset marrital_status = '#getform.marrital_status#'>
        <cfset relation = '#getform.relation#'>
        
        <cfset relative_name = '#getform.relative_name#'>
        <cfset terms = '#getform.terms#'>
        <cfdump var = "#getform#">
    <cfelse>
        <cfset email_val=''>
         <cfset gender = ''>
         <cfset name = ''>
         <cfset dob = ''>
             <cfset dob1 = ''>
         <cfset phone = ''>
         <cfset pass = ''>
         <cfset passre = ''>
         <cfset gender = ''>
         <cfset marrital_status = ''>
         <cfset relation = ''>
     
         <cfset relative_name = ''>
         <cfset terms = ''>
    
        </cfif>
   
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
</head>
<body style=" background-color: #f7f7fa;">
    <div class="d-flex justify-content-around mt-0  " id="Container-box">
        <cfif isDefined('url.id')>
            <div class=" d-flex align-items-center justify-content-center ">
            <img src="girl.png" id="bg-img2">
        </div>
        <cfelse>
            <div class=" d-flex align-items-center justify-content-center ">
            <img src="workspace.png" id="bg-img2">
        </div>
        </cfif>
        <cfoutput >
                    
         <form name="forms" <cfif  isDefined('url.id')>  
            action="Update.cfm?id=#url.id#"
         </cfif> action="form.cfm" method="POST" id="forms"  autocomplete="on" onsubmit="return validation(event)">
            <div class="bg-white border rounded border-0 " id="signIn_Pg">
                <cfif isDefined('url.id')>
                    <p class="text-center fw-bolder pt-2 mb-0" id="chng_p" style="position: relative; bottom: 6px; font-size: 25px;">Employed detail</p>
                <cfelse>
                    <p class="text-center fw-bolder pt-2 mb-0" id="chng_p" style="position: relative; bottom: 6px; font-size: 25px;">Sign Up</p>
                </cfif>
                <p class="text-center text-body-tertiary mb-2" style="font-size: 15px; position: relative; bottom: 8px;">Your Social Compaigns</p>
                <div class="ms-5" style="position: relative; bottom: 3px;">
                    <div class="box ms-5 mb-0">
                        <input type=" email" id="email" value='#email_val#' class="w-75  py-3 ps-2  border border-dark-subtle rounded" placeholder="Email" name="txt_email"><br>
                        <p id="email_msg" style="font-size: 14px; margin-bottom: 8px;" class="text-danger"></p>
                    </div>
                    <div class="box ms-5 mb-2">
                        <input type=" text" id="name" class="w-75 py-3 ps-2 border border-dark-subtle rounded" placeholder="Name" value='#name#' name="txt_Name"><br>
                        <p id="name_msg" style="font-size: 14px; margin-bottom: 0; ;" class="text-danger  "></p>
                    </div>
                    <div class="box ms-5 mb-2">
                        <input type="date" onchange="ageCalulate()" value="#DateFormat(dob,'yyyy-mm-dd')#"  id="birthday" style="color:##;" name="birthday"class="w-80  py-3 ps-2  border border-dark-subtle rounded" >
                        <span style="font-size:15px; margin-top: 2px; margin-left: 16px; margin-right:8px;">Age</span>
                        <input type="text" id="displayBirthday"  style="font-size: 14px; margin-bottom: 0; width: 60px;padding-left: 15px;" class=" border border-dark-subtle rounded" >
                        <span style="font-size:15px; margin-top: 2px; margin-left: 16px;">Year</span><br>
                        <p id="birthday_msg" class="text-danger" style="font-size:14px; margin-bottom:0;" ></p>
                   </div>
           <div class="box ms-5 mb-2">
                        <span style="font-size: 15px;">Gender</span>
                        <div class="form-check form-check-inline" style="margin-left: 13px;
                        font-size: 16px;">
                            <input class="form-check-input" value="male" type="radio" name="gender" id="Male" <cfif gender EQ 'male'>checked</cfif> >
                            <label class="form-check-label" for="inlineRadio1">Male</label>
                        </div>
                        <div class="form-check form-check-inline" style="
                        font-size: 16px;
                        margin-right: 4px;
                    
                        margin-left: -3px;">
                            <input class="form-check-input" value="female" type="radio" name="gender" id="Female" <cfif gender EQ 'female'>checked</cfif>
                            <label class="form-check-label" for="inlineRadio2">Female</label>
                        </div>
                        <p id="gender_msg" style="font-size: 14px; margin-bottom: 0;" class="text-danger  "></p>
                    </div>
                    <select onchange="showInput()"  name="marital_status" class="form-select" style=" width: 329px;margin-left: 47px; height: 34px;  margin-top: 6px;margin-bottom: 3px " id='select_status'>
                        <option selected="select" value="">Select martial option</option>
                        <option id="married" value="Married" <cfif marrital_status EQ 'Married' > selected</cfif> >Married</option>
                        <option  id="unmarried" value="Unmarried" <cfif marrital_status EQ 'Unmarried' > selected</cfif>>Unmarried</option>                       
                    </select>
                    <input type="text" id="marriedData" value="#relative_name#" class="d-none w-75   py-3 ps-2   border border-dark-subtle rounded" name="relativeName" style="width: 329px!important; margin-bottom: 0px; margin-left: 47px;">
                    <p id='martial_msg' style="font-size: 14px; margin-left: 47px; margin-bottom: 6px;" class="text-danger"></p>
                    <input type ="hidden" id="relation_id" value="#relation#" name="relation" >

                    <div class="box ms-5 mb-2">
                        <input type="text" id="phone_no" class="  w-75   py-3 ps-2   border border-dark-subtle rounded  " placeholder="Enter Phone Number"value='#phone#' name="txt_Number"><br>
                        <p id="phone_msg" style="font-size: 14px; margin-bottom: 0; ;" class="text-danger  "></p>

                    </div>
                    <div class="box ms-5 ">
                        <input type="password" id="password" value='#pass#' class="w-75   py-3 ps-2 border border-dark-subtle rounded" placeholder="Password" name="user_password"><br>
                        <p id="pass_msg" style="font-size: 14px; margin-bottom: 0px;" class="text-danger "></p>

                        <p id="password-text">Use 4 characters with mix of letters & number</p>
                    </div>
                    <div class="box ms-5 ">
                        <input type="password" id="Repeat-password" value='#passre#' class="w-75   py-3 ps-2 border border-dark-subtle rounded" placeholder="Repeat Password" ><br>
                        <p id="repeatpss_msg" style="font-size: 14px; margin-bottom: 0px;" class="text-danger "></p>

                    </div>
                    <div class="box d-flex ">
                        <div class="form-check">
                            <div class="mb-0 form-check " style="margin-top: 0px; position: relative;left: 24px; right: 30px;">
                                <input type="checkbox" <cfif terms EQ '1'>checked</cfif> class="form-check-input" style="font-size: 15px; margin-top: 14px;" id="mycheckbox">
                                <label class="form-check-label" style="font-size: 15px; margin-top: 9px; margin-bottom: 0;"> I Accept the <a style="font-size: 15px;" href="##">Term</a></label>
                                <p id="term_msg" style="font-size: 14px; margin-bottom: 4px;" class="text-danger "></p>
                            </div>
                            <input type ="hidden" id="term_id" name="agree" >
                        </div>

                    </div>
                    <cfif isDefined('url.id')>
                        <div class="signup mt-0 " style="margin-left: 44px;">
                            <input type="submit" value="Update" id="signUp_txt"  style="font-size: 16px; height: 43px; margin-top: 0px; " class="pb-2 w-75 ms-1  bg-primary bg-gradient text-white fw-bolder text-center pt-2 border rounded ">
                        </div>
                       
                        <cfelse>
                    <div class="signup mt-0 " style="margin-left: 44px;">
                        <input type="submit" id="signUp_txt"  style="font-size: 16px; height: 43px; margin-top: 0px; " class="pb-2 w-75 ms-1  bg-primary bg-gradient text-white fw-bolder text-center pt-2 border rounded ">
                    </div>
                    </cfif>
                  
                </div>
            </div>
        </form>
    </cfoutput>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        const SignupForm = document.querySelector('#forms');
        <cfif isDefined('url.id')>   <!---if user id is defined then run age calculation--->
                 var a = document.getElementById('birthday').value;
                var minutes = 1000 * 60;
                var hours = minutes * 60;
                var day = hours * 24;
                var years = day * 365;
                var birthay_cal = Date.parse(a);
                var datenow = new Date(); 
                var yearold = Math.round((datenow-birthay_cal)/years);
                console.log( yearold )
                document.getElementById('displayBirthday').value= yearold;     
           </cfif>

          function ageCalulate(){
            var a = document.getElementById('birthday').value;
        var minutes = 1000 * 60;
        var hours = minutes * 60;
        var day = hours * 24;
        var years = day * 365;
        var birthay_cal = Date.parse(a);
        var datenow = new Date(); 
        var yearold = Math.round((datenow-birthay_cal)/years);
        console.log( yearold )

        document.getElementById('displayBirthday').value= yearold;
              }
        
        function showInput() {
           
            var marriedInput = document.querySelector('#marriedData');
            var martialInput_val = marriedInput.value.trim();
            var martial_sts = document.querySelector('#select_status')
            // var unmarried_sts = document.querySelector('#select_status')
            // var married_val = martial_sts.value;
            var martialInputErr = document.getElementById('martial_msg')
            var gender = document.querySelector('input[name ="gender"]:checked');
            

            var relation = document.getElementById('relation_id');


            var married_val = martial_sts.value;
            // var unmarried_val = martial_sts.value;      
            

 
          if (married_val == "Married" && gender.value == "male" || married_val == "Married" && gender.value == "female" ) {
                marriedInput.classList.remove('d-none');
                
                if(gender.value == "male"){
                    marriedInput.placeholder = 'Enter your spouse name ';
                    relation.value="wife"

                }
                else if(gender.value == "female"){
                    marriedInput.placeholder = 'Enter your husband name ';
                    relation.value ="husband"
                }
                if(martialInput_val == ''){
                    martialInputErr.innerHTML = 'This field is required*';
                }
                else{
                    martialInputErr.innerHTML= '';
                
                }
                return true;
            }   
            if(married_val == "Unmarried") {
                    marriedInput.classList.remove('d-none');
                    marriedInput.placeholder = 'Enter your father name';
                    relation.value ="father"
                    if(martialInput_val == ''){
                        martialInputErr.innerHTML = 'Field is required';
                    }
                    else{
                        martialInputErr.innerHTML = '';
                    
                    }
                    return true;
            } 

            if(married_val=="select"){
                    marriedInput.classList.add('d-none');
                    martialInputErr.innerHTML = '';
                }   

        }

       // SignupForm.addEventListener("submit", () => {
         // });

        function validation(e) {
            //   e.preventDefault();
            

             var Email_regex = /^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+[.][A-Za-z]{2,4}$/;
        var Name_regex = /^(?!-)[a-zA-Z-]*[a-zA-Z]$/;
        // var Pass_regex = /^(?=.*\d)(?=.*[a-zA-Z])[a-zA-Z0-9]{7,}$/;
        var Phone_regex = /^(\+91|\+91\-|0)?[789]\d{9}$/;

        var marriedInput = document.querySelector('#marriedData');
        

            var count = 0;

        var fisrtName = document.querySelector('#name');
        var Email = document.querySelector('#email');
        var num = document.querySelector('#phone_no');
        var password = document.querySelector('#password');
        var repeatPassword = document.querySelector('#Repeat-password');
        var checkBx = document.querySelector('#mycheckbox');
        var dob = document.querySelector('#birthday');
        var dobInput = document.querySelector('#displayBirthday')
        var martial_sts = document.querySelector('#select_status');
        var gender = document.querySelector('input[name ="gender"]:checked');

        var agree =document.getElementById('term_id');

         var martialInputErr = document.getElementById('martial_msg')
         var martialInput_val = marriedInput.value.trim();
        

             var marriedInput = document.querySelector('#marriedData');
            var emailErr = document.getElementById('email_msg');
            var nameErr = document.getElementById('name_msg');
            var phoneErr = document.getElementById('phone_msg');
            var passErr = document.getElementById('pass_msg');
            var repeatpassErr = document.getElementById('repeatpss_msg');
            var checkErr = document.getElementById('term_msg')
            var dobErr = document.getElementById('birthday_msg')
            var genderErr = document.getElementById('gender_msg')
    
        
            var ftName = fisrtName.value.trim();
            var email_val = Email.value.trim();
            var mobNo = num.value.trim();
            var checkPassword = password.value.trim();
            var Reapeat_pssval = repeatPassword.value.trim();
            var dateval = dob.value;
            var married_val = martial_sts.value;
            

        
            var Checkbox_val = checkBx.value;

          
            if(martialInput_val != ''){
                martialInputErr.innerHTML = '';
            }
            else{
                martialInputErr.innerHTML = 'Field is required';
                count++;
            }

            
            if (email_val == '') {

                emailErr.innerHTML = 'Email is required*';
                                count++;
            } else if (!Email_regex.test(email_val)) {
                emailErr.innerHTML = 'Ex-test@gmail.com';
                                count++;
            }     
             else{
                emailErr.innerHTML = '';
            }


            if (ftName === '') {
                nameErr.innerHTML = 'Name is required'
                                count++;
            } else if (ftName.length < 3) {
                nameErr.innerHTML = 'Minimum 3 character is valid'
                                count++;
            } else if (!Name_regex.test(ftName)) {
                nameErr.innerHTML = 'Ex- Alex'
                                count++;
            } else {
                nameErr.innerHTML = '';
            }

            if (mobNo == '') {
                phoneErr.innerHTML = 'Phone number is required'
                                count++;
            } else if (mobNo.length !== 10) {
                phoneErr.innerHTML = 'Add valid phone number'
                                count++;
            } else if (!Phone_regex.test(mobNo)) {
                phoneErr.innerHTML = 'Ex-+91 9456211568';
                                count++;
            } else {
                phoneErr.innerHTML = '';
            }


            if (checkPassword == '') {
                passErr.innerHTML = 'Password is required'
                                count++;
            } else if (checkPassword.length < 4) {
                passErr.innerHTML = 'Minimum 4 character is required'
                                count++;
            } 
            
            else {
                passErr.innerHTML = '';
            }

            if (checkPassword !== Reapeat_pssval) {
                repeatpassErr.innerHTML = 'Password is not match'
                                count++;
                    // console.log(checkPassword == Reapeat_pssval);

            } else {
                repeatpassErr.innerHTML = '';
            }
            if (!checkBx.checked) {
                checkErr.innerHTML = 'you must agree term and condition';
                agree.value = 0
                                count++;

            } else {
                checkErr.innerHTML = '';
                agree.value = 1
            }
        
            if (dateval == '') {
                dobErr.innerHTML = 'Date field is required';
                                count++;
            } 
            else{  
                dobErr.innerHTML = '';
            }
            // console.log(!gender);
            if (!gender) {
                genderErr.innerHTML = 'Please select gender';
                                count++;
                
            }

            else if(gender == married_val){

            }
            else{
                genderErr.innerHTML = '';
            } 
              console.log('count', count);
             
          if(count == 0){
                return true;
              }
              else{

                  return false;
              }
       
            
            }
    </script>
</body>

</html>