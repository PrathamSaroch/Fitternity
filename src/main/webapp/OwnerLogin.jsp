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

            function ownerLogin()
            {
                var url = "./ownerCheckLogin";

                var owneremail = document.getElementById("owneremail").value;
                var password = document.getElementById("password").value;

                var formdata = new FormData();
                formdata.append("owneremail", owneremail);
                formdata.append("password", password);

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderHTML(ans));
            }
            
             function renderHTML(ans)
            {
                if(ans == "success")
                {
                    Swal.fire({
                                icon: 'sucsess',
                                title: 'Done...',
                                text: 'Login successfull!'
                            }).then(function () {
                                window.location = "OwnerHome.jsp";
                            });
                }
                else
                {
                    Swal.fire({
                                icon: 'error',
                                title: 'Oops...',
                                text: 'User-Email or Password is incorrect !'
                            });
                }
            } 

        </script>

    </head>

    <body class="login-page">
        <div class="login-box">
            <h1 class="heading-login-box">Owner Login</h1><br>
            <form>
                <div class="user-box">
                    <input class="user-box-input" id="owneremail" type="text" required>
                    <label class="user-box-label">Owner Email</label>
                </div>
                <div class="user-box">
                    <input class="user-box-input" id="password" type="password" required>
                    <label class="user-box-label">Password</label>
                </div> 
                <a type="submit" class="login-box-button" onclick="ownerLogin()">
                    <span></span>
                    <span></span>
                    <span></span>
                    <span></span>
                    Login !
                </a>
            </form>
        </div>
    </body>

    <!-- Mirrored from www.ansonika.com/panagea/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Fri, 10 Mar 2023 10:20:39 GMT -->
</html>