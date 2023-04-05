<!DOCTYPE html>
<html lang="en">

<!-- Mirrored from shivaaythemes.in/fithub-demo/contact-us.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Mar 2023 08:20:19 GMT -->
<head>
    <title>Fithub - Gym & Fitness HTML Template</title>
    <meta name="keywords" content="Fithub" />
    <meta name="description" content="Fithub" />
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />

    <!-- FavIcon CSS -->
    <link rel="icon" href="assets/images/favicon.png" type="image/gif" sizes="16x16">

    <!--Bootstrap CSS-->
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">

    <!--Google Fonts CSS-->
    <link rel="preconnect" href="https://fonts.googleapis.com/">
    <link rel="preconnect" href="https://fonts.gstatic.com/" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Catamaran:wght@100;200;300;400;500;600;700;800;900&amp;family=Rubik:ital,wght@0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,300;1,400;1,500;1,600;1,700;1,800;1,900&amp;display=swap" rel="stylesheet">

    <!--Font Awesome Icon CSS-->
    <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">

    <!-- Slick Slider CSS -->
    <link rel="stylesheet" type="text/css" href="assets/css/slick.css">
    <link rel="stylesheet" type="text/css" href="assets/css/slick-theme.css">

    <!-- Wow Animation CSS -->
    <link rel="stylesheet" type="text/css" href="assets/css/animate.min.css">

    <!-- Magnific Popup CSS -->
    <link rel="stylesheet" type="text/css" href="assets/css/magnific-popup.min.css">

    <!--Jarallax CSS-->
    <link rel="stylesheet" type="text/css" href="assets/css/jarallax.css">

    <!-- Main Style CSS  -->
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    
    <script>
        
        function userLogin()
            {
                var url = "./userCheckLogin";

                var useremail = document.getElementById("useremail").value;
                var password = document.getElementById("password").value;

                var formdata = new FormData();
                formdata.append("useremail", useremail);
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
                                window.location = "index_1.jsp";
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
<body>

     <!-- Loader Start -->
	<div class="loader-box">
        <div class="loader-text">
            <span class="let1">L</span>
            <span class="let2">o</span>
            <span class="let3">a</span>
            <span class="let4">d</span>
            <span class="let5">i</span>
            <span class="let6">n</span>
            <span class="let7">g</span>
            <span class="let8">.</span>
            <span class="let9">.</span>
            <span class="let10">.</span>
        </div>
	</div>
	<!-- Loader End -->

     <!-- Header Start -->
     
    <!-- Header End -->

    <!--Banner Start-->
    <section class="main-inner-banner jarallax" data-jarallax data-speed="0.2" data-imgPosition="50% 0%" style="background-image: url(assets/images/contact-us-in-banner.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="banner-in-title">
                        <h1 class="h1-title">User Login</h1>
                    </div>
                    <div class="banner-breadcum">
                        <ul>
                            <li><a href="javascript:void(0);">Home</a></li>
                            <li><i class="fa fa-chevron-right"></i></li>
                            <li><a href="javascript:void(0);">User Login</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Banner End-->

    <!--Contact Us Start-->
    <section class="main-contact-in">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6">
                    <div class="get-in-touch-content wow fadeInLeft" data-wow-delay=".5s">
                        <div class="get-in-touch-title">
                            <div class="subtitle">
                                <h2 class="h2-subtitle">Contact Us</h2>
                            </div>
                            <h2 class="h2-title">Get In Touch</h2>
                        </div>
                        <div class="get-in-touch-box">
                            <div class="get-in-touch-icon">
                                <img src="assets/images/email.png" alt="Email">
                            </div>
                            <div class="get-in-touch-text">
                                <h3 class="h3-title">Email:</h3>
                                <span>info@gmail.com</span>
                            </div>
                        </div>
                        <div class="get-in-touch-box">
                            <div class="get-in-touch-icon">
                                <img src="assets/images/phone.png" alt="Email">
                            </div>
                            <div class="get-in-touch-text">
                                <h3 class="h3-title">Call Now:</h3>
                                <span>+91 987 3654 365</span>
                            </div>
                        </div>
                        <div class="get-in-touch-box">
                            <div class="get-in-touch-icon">
                                <img src="assets/images/location.png" alt="Email">
                            </div>
                            <div class="get-in-touch-text mb-0">
                                <h3 class="h3-title">Location:</h3>
                                <span>13 Sunset Blvd Los Angeles, CA 90026, USA</span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="appointment-bg wow fadeInRight" data-wow-delay=".5s">
                        <div class="appointment-title">
                            <h2 class="h2-title">User Login</h2>
                            <div class="line"></div>
                        </div>
                        <form>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-box">
                                        <input type="email" name="EmailAddress" class="form-input" placeholder="User Email" id="useremail" required="">
                                    </div>
                                </div>
                                <div class="col-md-12">
                                    <div class="form-box">
                                        <input type="password" name="Phone No" class="form-input" placeholder="Password" id="password" required="">
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="form-box mb-0">
                                        <input type="button" onclick="userLogin()" class="sec-btn" value="Login" >
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--Contact Us End-->

    <!--Map Start-->
<!--    <div class="main-contact-map-in">
        <iframe src="https://maps.google.com/maps?q=31.63669403578831,74.87409325265376&ie=UTF8&iwloc=&output=embed" width="416" height="570" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </div>-->
    <!--Map Emd-->

    <!--Footer Start-->
    <footer class="main-footer">
        <div class="footer-overlay-bg animate-this">
            <img src="assets/images/footer-overlay.png" alt="Overlay">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer-box-one">
                        <a href="index.html">
                            <img src="assets/images/logo.png" alt="Fithub">
                        </a>
                        <p>Etiam suscipit fringilla ullamcorper sed malesuada urna nec odio.</p>
                        <div class="footer-time">
                            <img src="assets/images/clock-2.png" alt="Clock">
                            <div class="footer-time-text-box">
                                <div class="footer-time-text">
                                    <span>Monday - Friday</span>
                                    <span>7:00Am - 10:00Pm</span>
                                </div>
                                <div class="footer-time-text mt-3">
                                    <span>Saturday - Sunday</span>
                                    <span>7:00Am - 2:00Pm</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer-box-two">
                        <h3 class="h3-title">Our Links</h3>
                        <div class="line"></div>
                        <ul>
                            <li><a href="index.html">Home</a></li>
                            <li><a href="about-us.html">About Us</a></li>
                            <li><a href="classes.html">Classes</a></li>
                            <li><a href="blog-list.html">Blog</a></li>
                            <li><a href="contact-us.html">Contact Us</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer-box-three">
                        <h3 class="h3-title">Contact Us</h3>
                        <div class="line"></div>
                        <ul>
                            <li>
                                <div class="footer-contact-icon">
                                    <i class="fa fa-map-marker" aria-hidden="true"></i>
                                </div>
                                <div class="footer-contact-text">
                                    <span>1247/Plot No. 39, 15th Phase, Colony, Kukatpally, Hyderabad</span>
                                </div>
                            </li>
                            <li>
                                <div class="footer-contact-icon">
                                    <i class="fa fa-phone" aria-hidden="true"></i>
                                </div>
                                <div class="footer-contact-text">
                                    <span>1800-121-3637</span>
                                    <span>+91 555 234-8765</span>
                                </div>
                            </li>
                            <li>
                                <div class="footer-contact-icon">
                                    <i class="fa fa-envelope" aria-hidden="true"></i>
                                </div>
                                <div class="footer-contact-text">
                                    <span>info@gmail.com</span>
                                    <span>services@gmail.com</span>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6">
                    <div class="footer-box-four">
                        <h3 class="h3-title">Our Newsletter</h3>
                        <div class="line"></div>
                        <div class="footer-subscribe-form">
                            <input type="email" name="email" class="form-input subscribe-input" placeholder="Email Address" required="">
                            <button type="submit" class="sec-btn"><i class="fa fa-chevron-right"></i></button>
                        </div>
                        <div class="footer-social">
                            <ul>
                                <li><a href="javascript:void(0);"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                <li><a href="javascript:void(0);"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                <li><a href="javascript:void(0);"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-copyright">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-7">
                        <div class="copyright-text">
                            <span>Copyright � 2022 <a href="index.html">ShivaayThemes.</a> All rights reserved.</span>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-5">
                        <div class="copyright-links">
                            <ul>
                                <li><a href="about-us.html">Privacy Policy</a></li>
                                <li><a href="about-us.html">Team &amp; Condition</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--Footer End-->

    <!--Back To Top Start-->
    <div class="progress-wrap active-progress">
        <svg class="progress-circle svg-content" width="100%" height="100%" viewBox="-1 -1 102 102">
           <path d="M50,1 a49,49 0 0,1 0,98 a49,49 0 0,1 0,-98" style="transition: stroke-dashoffset 10ms linear 0s; stroke-dasharray: 307.919, 307.919; stroke-dashoffset: 280.807;"></path>
        </svg>
     </div>
    <!--BAck To Top End-->

    <!-- modal-search-start -->
    <div class="modal fade" id="search-modal" tabindex="-1" role="dialog" aria-hidden="true">
        <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
           <span aria-hidden="true"><i class="fa fa-times" aria-hidden="true"></i></span>
        </button>
        <div class="modal-dialog" role="document">
           <div class="modal-content">
              <form>
                    <input type="text" placeholder="Search here...">
                    <button>
                        <i class="fa fa-search" aria-hidden="true"></i>
                    </button>
              </form>
           </div>
        </div>
     </div>
     <!-- modal-search-end -->
    
<!-- Jquery JS Link -->
<script src="assets/js/jquery.min.js"></script>

<!-- Bootstrap JS Link -->
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/popper.min.js"></script>

<!-- Custom JS Link -->
<script src="assets/js/custom.js"></script>

<!-- Slick Slider JS Link -->
<script src="assets/js/slick.min.js"></script>

<!-- Wow Animation JS -->
<script src="assets/js/wow.min.js"></script>

<!--Bg Moving Js-->
<script src="assets/js/bg-moving.js"></script>

<!--Back To Top JS-->
<script src="assets/js/back-to-top.js"></script>

<!--Jarallax JS-->
<script src="assets/js/jarallax.js"></script>
<script src="assets/js/jarallax.min.js"></script>

</body>

<!-- Mirrored from shivaaythemes.in/fithub-demo/contact-us.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Mar 2023 08:20:19 GMT -->
</html>