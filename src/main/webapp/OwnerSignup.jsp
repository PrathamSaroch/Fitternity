<!DOCTYPE html>
<html lang="en">


    <!-- Mirrored from www.ansonika.com/panagea/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 10 Mar 2023 10:20:38 GMT -->
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
        <meta name="author" content="Ansonika">
        <title>Panagea | Premium site template for travel agencies, hotels and restaurant listing.</title>

        <!-- Favicons-->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" type="image/x-icon" href="img/apple-touch-icon-57x57-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="img/apple-touch-icon-72x72-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="img/apple-touch-icon-114x114-precomposed.png">
        <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="img/apple-touch-icon-144x144-precomposed.png">

        <!-- GOOGLE WEB FONT -->
        <link rel="preconnect" href="https://fonts.gstatic.com/">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&amp;display=swap" rel="stylesheet">

        <!-- BASE CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/vendors.css" rel="stylesheet">

        <!-- ALTERNATIVE COLORS CSS -->
        <link href="#" id="colors" rel="stylesheet">

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <style>

            .login-page {
                font-family: sans-serif;
                background: #243b55;
            }

            .login-box {
                position: absolute;
                top: 50%;
                left: 50%;
                width: 350px;
                padding: 50px;
                transform: translate(-50%, -50%);
                background: rgba(0, 0, 0, 0.5);
                border-radius: 10px;
            }

            .heading-login-box {
                margin-top: 20px;
                margin-bottom: 20px;
                color: #fff;
                text-align: center;
            }

            .user-box {
                position: relative;
            }

            .user-box-input {
                width: 100%;
                padding: 10px 0;
                font-size: 14px;
                color: #fff;
                margin-bottom: 30px;
                border: none;
                border-bottom: 1px solid #fff;
                outline: none;
                background: transparent;
            }

            .user-box-label {
                position: absolute;
                top: 0;
                left: 0;
                padding: 10px 0;
                font-size: 14px;
                color: #fff;
                pointer-events: none;
                transition: 0.5s;
            }

            .login-box .user-box input:focus~label,
            .login-box .user-box input:valid~label {
                top: -20px;
                left: 0;
                color: #8ab0df;
                font-size: 12px;
            }

            .login-box-button {
                position: relative;
                display: inline-block;
                padding: 10px 20px;
                color: #8ab0df;
                font-size: 14px;
                text-decoration: none;
                overflow: hidden;
                transition: .5s;
                margin-top: 30px;
            }

            .login-box a:hover {
                background: #8ab0df;
                color: #fff;
            }

            .login-box a span {
                position: absolute;
                display: block;
            }

            .login-box-button span:nth-child(1) {
                top: 0;
                left: -100%;
                width: 100%;
                height: 2px;
                background: linear-gradient(90deg, transparent, #8ab0df);
                animation: btn-1 1.7s linear infinite;
            }

            @keyframes btn-1 {
                0% {
                    left: -100%;
                }

                50%,
                100% {
                    left: 100%;
                }
            }

            .login-box-button span:nth-child(2) {
                top: -100%;
                right: 0;
                width: 2px;
                height: 100%;
                background: linear-gradient(180deg, transparent, #8ab0df);
                animation: btn-2 1.7s linear infinite;
                animation-delay: 0.25s;
            }

            @keyframes btn-2 {
                0% {
                    top: -100%;
                }

                50%,
                100% {
                    top: 100%;
                }
            }

            .login-box-button span:nth-child(3) {
                bottom: 0;
                right: -100%;
                width: 100%;
                height: 2px;
                background: linear-gradient(270deg, transparent, #8ab0df);
                animation: btn-3 1.7s linear infinite;
                animation-delay: 0.5s;
            }

            @keyframes btn-3 {
                0% {
                    right: -100%;
                }

                50%,
                100% {
                    right: 100%;
                }
            }

            .login-box-button span:nth-child(4) {
                bottom: -100%;
                left: 0;
                width: 2px;
                height: 100%;
                background: linear-gradient(360deg, transparent, #8ab0df);
                animation: btn-4 1.7s linear infinite;
                animation-delay: 0.75s;
            }

            @keyframes btn-4 {
                0% {
                    bottom: -100%;
                }

                50%,
                100% {
                    bottom: 100%;
                }
            }
            @media screen and (max-width: 576px) and (min-width: 400px) {
                .login-box {
                    width: 250px;
                }
            }

            @media screen and (max-width: 400px) {
                .login-box {
                    width: 200px;
                }

                .heading-login-box {
                    font-size: 16px !important;
                }

                .user-box-input {
                    font-size: 12px;
                }

                .user-box-label {
                    font-size: 12px;
                }
                .login-box-button {
                    font-size: 12px;
                }
            }

        </style>

        <script>

            function showCities()
            {
                var url = "./ownerViewCities";

                fetch(url, {method: "POST"})
                        .then(response => response.text())
                        .then(ans => renderCities(ans));
            }
            function renderCities(ans)
            {
                ans = ans.trim();
                var mainobj = JSON.parse(ans);
                var arr = mainobj["ans"];

                var ren = "";

                ren += "<div class=\"user-box\">";
                ren += "<label style=\"color: white\">Select City</label>";
                ren += "<select id=\"cityname\" class=\"user-box-input text-black\" style=\"width: 100%\" >";
                ren += "<option></option>";
                for (var i = 0; i < arr.length; i++)
                {
                    var st = arr[i];

                    ren += "<option style=\"color: black\" value=\'" + st.cityname + "\' >" + st.cityname + "</option>";
                }
                ren += "</select>";
                ren += "</div>";

                document.getElementById("showcities").innerHTML = ren;
            }

            function ownerSignup()
            {
                var url = "./ownerSignup";

                var ownername = document.getElementById("ownername").value;
                var owneremail = document.getElementById("owneremail").value;
                var cityname = document.getElementById("cityname").value;
                var phoneno = document.getElementById("phoneno").value;
                var franname = document.getElementById("franname").value;
                var conpassword = document.getElementById("conpassword").value;
                var password = document.getElementById("password").value;
                var photo = document.getElementById("photo").files[0];

                if (ownername == "" || phoneno == "" || owneremail == "" || password == "" || conpassword == "" || cityname == "" || franname == "")
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter The Form Properly !'
                    });
                } else if (phoneno.length != 10)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter the Phone Number Properly !'
                    });
                } else if (owneremail.indexOf("@") == -1)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter Email in Proper Format !'
                    });
                } else if (document.getElementById("photo").files.length[0])
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Select the Profile Picture !'
                    });
                } else if (password != conpassword)
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Password & Confirm Passowrd must match !'
                    });
                } else
                {
                    
                    var formdata = new FormData();
                    formdata.append("ownername", ownername);
                    formdata.append("owneremail", owneremail);
                    formdata.append("cityname", cityname);
                    formdata.append("phoneno", phoneno);
                    formdata.append("franname", franname);
                    formdata.append("password", password);
                    formdata.append("photo", photo);

                    fetch(url, {method: "POST", body: formdata})
                            .then(response => response.text())
                            .then(ans => renderHTML(ans));
                }
            }

            function renderHTML(ans)
            {
                if (ans == "success")
                {
                    Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'Signed in successfull!'
                    });
                    document.getElementById("ownersignup").reset();
                } else
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Owner has already registered with this Email ID !'
                    });
                }
            }

        </script>

    </head>

    <body class="login-page" onload="showCities()" >
        <div class="login-box" style="margin-top: 50px;margin-bottom: 70px">
            <h1 class="heading-login-box">Owner Signup</h1><br>
            <form id="ownersignup" >
                <div class="user-box">
                    <input class="user-box-input" id="ownername" type="text" required>
                    <label class="user-box-label">Ownername</label>
                </div>
                <div class="user-box">
                    <input class="user-box-input" id="owneremail" type="text" required>
                    <label class="user-box-label">Owneremail</label>
                </div>

                <div id="showcities" >

                    <!--Show All Cities-->

                </div>

                <div class="user-box">
                    <input class="user-box-input" id="phoneno" type="text" required>
                    <label class="user-box-label">Phone number</label>
                </div>
                <div class="user-box">
                    <input class="user-box-input" id="franname" type="text" required>
                    <label class="user-box-label">Franchise Name</label>
                </div>
                <div class="user-box">
                    <input class="user-box-input" id="password" type="password" required>
                    <label class="user-box-label">Password</label>
                </div>
                <div class="user-box">
                    <input class="user-box-input" id="conpassword" type="password" required>
                    <label class="user-box-label">Confirm Password</label>
                </div>
                <div class="user-box">
                    <label style="color: white">Profile Picture</label>
                    <input class="user-box-input" id="photo" type="file" required>
                </div>
                <a type="submit" class="login-box-button" onclick="ownerSignup()">
                    <span></span> 
                    <span></span>
                    <span></span>
                    <span></span>
                    Submit
                </a><br><br>
                <div class="text-center add_top_10" style="color: white">Already have an acccount? <strong><a href="OwnerLogin.jsp" style="color: white">Login !</a></strong></div>
            </form>
        </div>
    </body>

    <!-- Mirrored from www.ansonika.com/panagea/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 10 Mar 2023 10:20:39 GMT -->
</html>