
<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from shivaaythemes.in/fithub-demo/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Mar 2023 08:19:35 GMT -->
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

        <!-- Main Style CSS  -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
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

        <%@include file="AdminNavbar.jsp" %>

        <!--Classes Start-->
        <section class="main-classes">
            <div class="classes-overlay-bg animate-this">
                <img src="assets/images/classes-overlay-bg.png" alt="Overlay">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="classes-title">
                            <!--                            <div class="subtitle">
                                                            <h2 class="h2-subtitle">Our Classes</h2>
                                                        </div>-->
                            <h2 class="h2-title">Admin Panel</h2>
                        </div>
                    </div>
                </div>
                <div class="row class-slider" id="counter">
                    <div class="col-lg-6">
                        <div class="class-box wow fadeInUp" data-wow-delay=".5s" >
                            <a>
                                <div class="class-img" style="height: 250px" >
                                    <img src="images/AdminCities.jpg" style="height: 250px" alt="Class">
                                </div>
                            </a>
                            <div class="class-box-contant">
                                <div class="class-box-title">
                                    <div class="class-box-icon">
                                        <img src="assets/images/class-icon4.png" alt="Icon">
                                    </div>
                                    <a href="AdminManageCities.jsp"><h3 class="h3-title">Manage<br> Cities</h3></a>
                                </div>
                                <p>Admin can manage cities. Add new cities or delete excisting once.</p>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6"  >
                        <div class="class-box wow fadeInUp" data-wow-delay=".5s" >
                            <a>
                                <div class="class-img" style="height: 250px" >
                                    <img src="images/ManageGymOwners.jpg" style="height: 250px" alt="Class">
                                </div>
                            </a>
                            <div class="class-box-contant">
                                <div class="class-box-title">
                                    <div class="class-box-icon">
                                        <img src="assets/images/class-icon4.png" alt="Icon">
                                    </div>
                                    <a href="AdminManageGymOwners.jsp"><h3 class="h3-title">Manage Gym Owners</h3></a>
                                </div>
                                <p>Admin can manage ie. Approve or Block Gym Owners.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Classes End-->

        <!--Footer Start-->

        <%--<%@include file="Footer.jsp"  %>--%>

        <!--Footer End-->


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

        <!--Magnific Popup JS-->
        <script src="assets/js/magnific-popup.js"></script>
        <script src="assets/js/custom-magnific-popup.js"></script>

        <!--Progress Bar JS-->
        <script src="assets/js/custom-progress-bar.js"></script>

        <!--Scroll Count JS-->
        <script src="assets/js/custom-scroll-count.js"></script>

        <!--BAck To Top JS-->
        <script src="assets/js/back-to-top.js"></script>

    </body>

    <!-- Mirrored from shivaaythemes.in/fithub-demo/index.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Mar 2023 08:19:56 GMT -->
</html>