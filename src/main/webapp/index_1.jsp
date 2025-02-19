
<%@page import="fitternity.vmm.DBLoader"%>
<%@page import="java.sql.ResultSet"%>

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

        <script>
            <%
                String useremail1 = (String) session.getAttribute("useremail");
            %>
            var useremail = "<%=useremail1%>";
            function userCheckLogin(cityname)
            {
                if (useremail == "null")
                {
                    window.location.href = "UserLogin.jsp";
                } else
                {
                    window.location.href = "UserViewGyms.jsp?cityname=" + cityname;
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

        <%@include file="UserNavbar.jsp" %>

        <!-- Header End -->

        <!--Banner Start-->
        <section class="main-banner">
            <div class="banner-overlay-bg animate-this">
                <img src="assets/images/banner-overlay.png" alt="Overlay">
            </div>
            <div class="banner-blur-bg">
                <img src="assets/images/blur-1.png" alt="Blur">
            </div>
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="banner-title-one">
                            <div class="main-banner-subtitle-box wow fadeInUp" data-wow-delay=".5s">
                                <div class="banner-subtitle-box">
                                    <div class="banner-subtitle-first">The Best</div>
                                    <div class="banner-subtitle-second">Fitness Club</div>
                                </div> 
                            </div>
                            <h1 class="h1-title wow fadeInUp" data-wow-delay=".7s">Work Hard To Get Better Life</h1>
                            <p class="wow fadeInUp" data-wow-delay=".9s">Duis mollis felis quis libero dictum vehicula. Duis dictum lorem mi, a faucibus nisi eleifend eu.</p>
                            
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="main-banner-img-one">
                            <img src="assets/images/banner-img-1.png" alt="Banner">
                            <div class="banner-circle-first">
                                <img src="assets/images/banner-circle-one.png" alt="Circle">
                            </div>
                            <div class="banner-circle-second">
                                <img src="assets/images/banner-circle-two.png" alt="Circle">
                            </div>
                            <div class="heart-rate">
                                <img src="assets/images/heart-rate.png" alt="Heart Rate">
                                <span>Heart Rate</span>
                                <h3>100 bpm</h3>
                            </div>
                            <div class="calories-box">
                                <div class="calories">
                                    <img src="assets/images/calories.png" alt="Heart Rate">
                                    <div class="calories-text">
                                        <span>Calories Burned</span>
                                        <h3>100 bpm</h3>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Banner End-->

        <!--About Us Start-->
        <section class="main-about-us">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div class="about-img-box wow fadeInLeft" data-wow-delay=".5s">
                            <div class="about-img-one">
                                <img src="assets/images/about-img-one.png" alt="About Us">
                            </div>
                            <div class="about-img-bg"></div>
                            <div class="fitness">
                                <img src="assets/images/fitness.png" alt="Fitness">
                            </div>
                            <div class="about-circle-one">
                                <img src="assets/images/about-circle-one.png" alt="Circle">
                            </div>
                            <div class="about-circle-two">
                                <img src="assets/images/about-circle-two.png" alt="Circle">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="about-content-box wow fadeInRight" data-wow-delay=".5s">
                            <div class="about-us-title">
                                <div class="subtitle">
                                    <h2 class="h2-subtitle">About Us</h2>
                                </div>
                                <h2 class="h2-title">Welcome To Our Fitness Gym</h2>
                            </div>
                            <p>Nam ut hendrerit leo. Aenean vel ipsum nunc. Curabitur in tellus vitae nisi aliquet dapibus non et erat. Pellentesque porta sapien non accumsan dignissim curabitur sagittis nulla sit amet dolor feugiat.</p>
                            <p>Integer placerat vitae metus posuere tincidunt. Nullam suscipit ante ac aliquet viverra vestibulum ante ipsum primis.</p>
                            <div class="about-text-box">
                                <div class="about-trainer-box">
                                    <div class="about-trainer-img">
                                        <img src="assets/images/about-trainer.jpg" class="rounded-circle" alt="Trainer">
                                    </div>
                                    <div class="about-trainer-name">
                                        <h3 class="h3-title">Denis Robinson</h3>
                                        <span>Our Coach</span>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--About Us End-->

        <!--Video Start-->
        <section class="main-video">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-12">
                        <div class="video-box wow fadeInUp" data-wow-delay=".5s">
                            <div class="video-img" style="background-image: url('assets/images/video-img.jpg');">
                                <div class="video-content">
                                    <h2 class="h2-title">Explore Fitness Life</h2>
                                    <div class="play-btn">
                                        <a href="https://www.youtube.com/watch?v=HQfF5XRVXjU" class="video-play-icon popup-youtube" title="Play Video"><span><i class="fa fa-play" aria-hidden="true"></i></span></a>
                                    </div>
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Video End-->

        <!--Classes Start-->
        <section class="main-classes">
            <div class="classes-overlay-bg animate-this">
                <img src="assets/images/classes-overlay-bg.png" alt="Overlay">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="classes-title">
                            <div class="subtitle">
                                <h2 class="h2-subtitle">Cities</h2>
                            </div>
                            <h2 class="h2-title">Cities that have our gyms</h2>
                        </div>
                    </div>
                </div>
                <div class="row class-slider" id="counter">

                    <%
                            ResultSet rs = DBLoader.executeQuery("select * from city_table");
                            
                            while(rs.next()){
                            
                            String cityname = rs.getString("cityname");
                            String photo = rs.getString("photo");
                            String desc = rs.getString("desc");
                            
                    %>

                    <div class="col-lg-4">
                        <div class="class-box wow fadeInUp" data-wow-delay=".5s" style="height: 500px" >
                            <div class="class-img" style="height: 230px">
                                <img style="height: 230px" src=<%=photo%> alt="Class">
                            </div>
                            <div class="class-box-contant">
                                <div class="class-box-title">
                                    <div class="class-box-icon">
                                        <img src="assets/images/class-icon1.png" alt="Icon">
                                    </div>
                                    <a onclick="userCheckLogin('<%=cityname%>')" ><h3 class="h3-title"><%=cityname%></h3></a>
                                </div>
                                <p><%=desc%></p>
                            </div>
                        </div>
                    </div>
                    <%
                }
                    %>
                </div>
            </div>
        </section>
        <!--Classes End-->


        <!--Counter Start-->
        <section class="main-counter">
            <div class="container">
                <div class="row counter-bg wow fadeInUp" data-wow-delay=".5s">
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="counter-box">
                            <div class="counter-content">
                                <h2 class="h2-title counting-data" data-count="874">0</h2>
                                <div class="counter-text">
                                    <img src="assets/images/happy-client.png" alt="Happy Client">
                                    <span>Happy Clients</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="counter-box">
                            <div class="counter-content">
                                <h2 class="h2-title counting-data" data-count="987">0</h2>
                                <div class="counter-text">
                                    <img src="assets/images/total-clients.png" alt="Total Clients">
                                    <span>Total Clients</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="counter-box">
                            <div class="counter-content">
                                <h2 class="h2-title counting-data" data-count="587">0</h2>
                                <div class="counter-text">
                                    <img src="assets/images/gym-equipment.png" alt="Gym Equipment">
                                    <span>Gym Equipment</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-6">
                        <div class="counter-box">
                            <div class="counter-content">
                                <h2 class="h2-title counting-data" data-count="748">0</h2>
                                <div class="counter-text">
                                    <img src="assets/images/cup-of-coffee.png" alt="Cup Of Coffee">
                                    <span>Cup Of Coffee</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Counter End-->

        <!--Team Start-->
        <section class="main-team">
            <div class="team-overlay-bg animate-this">
                <img src="assets/images/team-overlay-bg.png" alt="Overlay">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="team-title">
                            <div class="subtitle">
                                <h2 class="h2-subtitle">Franchises</h2>
                            </div>
                            <h2 class="h2-title">Franchises Owners</h2>
                        </div>
                    </div>
                </div>
                <div class="row team-slider">

                    <%
                            ResultSet rs2 = DBLoader.executeQuery("select * from owner_table");
                            
                            while(rs2.next()){
                            
                            String ownername = rs2.getString("ownername");
                            String photo = rs2.getString("photo");
                    %>

                    <div class="col-lg-3">
                        <div class="team-box wow fadeInUp" data-wow-delay=".5s">
                            <div class="team-img-box team-border-one">
                                <div class="team-img">
                                    <img src="<%=photo%>" alt="Trainer">
                                </div>
                            </div>
                            <div class="team-content">
                                <a href="#"><h3 class="h3-title team-text-color"><%=ownername%></h3></a>
                                <span>Fitness Trainer</span>
                            </div>
                        </div>
                    </div>

                    <%
                        }
                    %>

                    
                </div>
            </div>
        </section>
        <!--Team End-->

        <!--Footer Start-->

        <%@include file="Footer.jsp"  %>
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