<%@page import="fitternity.vmm.DBLoader"%>
<%@page import="java.sql.ResultSet"%>

<!DOCTYPE html>
<html lang="en">

    <!-- Mirrored from shivaaythemes.in/fithub-demo/portfolio-detail.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Mar 2023 08:20:09 GMT -->
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


        <!--Jarallax CSS-->
        <link rel="stylesheet" type="text/css" href="assets/css/jarallax.css">

        <!-- Main Style CSS  -->
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link href="bootstrap-5.0.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <script>
            <%
                String gymid = request.getParameter("gymid");
            %>
            var gymid = "<%=gymid%>";

            function userShowGymDetail()
            {
                var url = "./userShowGymGallery";

                var formdata = new FormData();
                formdata.append("gymid", gymid);

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderGyms(ans));
            }
            function renderGyms(ans)
            {
                ans = ans.trim();
                var mainobj = JSON.parse(ans);
                var arr = mainobj["ans"];


                for (var i = 0; i < arr.length; i++)
                {
                    var st = arr[0];

                    var latitude = st.latitude;
                    var longitute = st.longitute;

                    document.getElementById("gymname1").innerHTML = st.gymname;
                    document.getElementById("owneremail").innerHTML = st.owneremail;
                    document.getElementById("address").innerHTML = st.address;

                    document.getElementById("gmap_canvas").src = "https://maps.google.com/maps?q=" + latitude + "," + longitute + "&ie=UTF8&iwloc=&output=embed";

                    if (st.pool == "True")
                    {
                        document.getElementById("pool").style.display = "block";
                    }
                    if (st.sauna == "True")
                    {
                        document.getElementById("sauna").style.display = "block";
                    }
                    if (st.changing_room == "True")
                    {
                        document.getElementById("changingroom").style.display = "block";
                    }
                    if (st.lockers == "True")
                    {
                        document.getElementById("lockers").style.display = "block";
                    }
                    if (st.parking_facility == "True")
                    {
                        document.getElementById("parking").style.display = "block";
                    }
                    if (st.ac == "True")
                    {
                        document.getElementById("ac").style.display = "block";
                    }
                    if (st.shower == "True")
                    {
                        document.getElementById("shower").style.display = "block";
                    }
                    if (st.washroom == "True")
                    {
                        document.getElementById("washroom").style.display = "block";
                    }
                    if (st.waterfacility == "True")
                    {
                        document.getElementById("water").style.display = "block";
                    }
                }
                showPhotos();

            }

            function showPhotos()
            {
                var url = "./userShowGymPhotos";

                var formdata = new FormData();
                formdata.append("gymid", gymid);

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderGymPhotos(ans));
            }
            function renderGymPhotos(ans)
            {
                ans = ans.trim();
                var mainobj = JSON.parse(ans);
                var arr = mainobj["ans"];

                var ren = "";

                ren += "<div id=\"carouselExampleControls\" class=\"carousel slide\" data-bs-ride=\"carousel\">";
                ren += "<div class=\"carousel-inner\">";

                for (var i = 0; i < arr.length; i++)
                {
                    var st = arr[i];
                    if (i == 0) {
                        ren += "<div class=\"carousel-item active\">";

                    } else {
                        ren += "<div class=\"carousel-item\">";

                    }
                    ren += "<img src=\'" + st.photo + "\' alt=\"Los Angeles\" class=\"d-block\" style=\"width:100%; height:300px\">";
                    ren += "</div>";

                }
                ren += "</div>";

                ren += "<button class=\"carousel-control-prev\" type=\"button\" data-bs-target=\"#carouselExampleControls\" data-bs-slide=\"prev\">";
                ren += "<span class=\"carousel-control-prev-icon\" aria-hidden=\"true\"></span>";
                ren += "<span class=\"visually-hidden\">Previous</span>";
                ren += "</button>";
                ren += "<button class=\"carousel-control-next\" type=\"button\" data-bs-target=\"#carouselExampleControls\" data-bs-slide=\"next\">";
                ren += "<span class=\"carousel-control-next-icon\" aria-hidden=\"true\"></span>";
                ren += "<span class=\"visually-hidden\">Next</span>";
                ren += "</button>";
                ren += "</div>";

                document.getElementById("showphotos").innerHTML = ren;

//                showPlans();
            }

            function selectDates(packageid, duration)
            {
                window.location.href = "UserShowGymPackage.jsp?packageid=" + packageid + "&duration=" + duration;
            }


        </script>

    </head>
    <body onload="userShowGymDetail()" >

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
        <header class="site-header">
            <!--Navbar Start  -->
            <%@include file="UserNavbar.jsp" %>
            <!--Navbar End  -->
        </header>
        <!-- Header End -->

        <!--Banner Start-->
        <section class="main-inner-banner jarallax" data-jarallax data-speed="0.2" data-imgPosition="50% 0%" style="background-image: url(assets/images/portfolio-detail-in-banner.jpg);">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="banner-in-title">
                            <h1 class="h1-title" id="gymname1"></h1>
                        </div>
                        <div class="banner-breadcum">
                            <ul>
                                <li><a href="index.html">All Gyms</a></li>
                                <li><i class="fa fa-chevron-right"></i></li>
                                <li><a href="portfolio.html">Gallery Page</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!--Banner End-->

        <!--Portfolio Detail Start-->
        <section class="main-portfolio-detail">
            <div class="container">
                <div class="row">
                    <div class="col-lg-7">
                        <div class="portfolio-detail-title-box">
                            <h2 class="h2-title" id="gymname2">Amanities that we Are providing :</h2>
                            <hr style="height: 2px" >
                            <h4 id="pool" style="display: none" >Swimming Pool</h4>
                            <h4 id="sauna" style="display: none" >Spa & Sauna</h4>
                            <h4 id="changingroom" style="display: none" >Changing Room</h4>
                            <h4 id="lockers" style="display: none" >Lockers Facility</h4>
                            <h4 id="parking" style="display: none" >Parking Space</h4>
                            <h4 id="ac" style="display: none" >Centralised AC</h4>
                            <h4 id="shower" style="display: none" >Shower</h4>
                            <h4 id="washroom" style="display: none" >Separate Washroom</h4>
                            <h4 id="water" style="display: none" >Water Facility</h4>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="portfolio-detail-info-box">
                            <div class="portfolio-detail-info-content">
                                <div class="portfolio-detail-info-text">
                                    <span>Owner Email :</span>
                                    <span id="owneremail" ></span>
                                </div>
                                <div class="portfolio-detail-info-text two">
                                    <span>Tags:</span>
                                    <span>Fitness, Gym</span>
                                </div>
                            </div>
                            <div class="portfolio-detail-info-content two">
                                <div class="portfolio-detail-info-text">
                                    <span>Address </span>
                                    <span id="address" ></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                    <hr style="height: 2px" >
                    <div class="col-lg-12">
                        <div class="pricing-title">
                            <div class="subtitle">
                                <h2 class="h2-subtitle">Pricing Table</h2>
                            </div>
                            <h2 class="h2-title">Choose Your Pricing Plan</h2>
                        </div>
                    </div>
                    <div id="showplans" >

                        <div class="row pricing-slider">

                            <%
                                ResultSet rs = DBLoader.executeQuery("select * from owner_packages_table where gymid ="+gymid);
                                while(rs.next()){
                                
                                String packagename = rs.getString("packagename");
                                String price = rs.getString("price");
                                String offerprice = rs.getString("offerprice");
                                String duration = rs.getString("duration");
                                String desc = rs.getString("desc");
                                String packageid = rs.getString("packageid");
                            %>

                            <div class="col-lg-4">
                                <div class="pricing-box wow fadeInUp" data-wow-delay=".5s" style="height: 500px">
                                    <div class="pricing-title-box pricing-one">
                                        <h3 class="h3-title"><%=packagename%></h3>
                                        <h2 class="h2-title"><%=duration%><span>/days</span></h2>
                                        <!--<h2 class="h2-title">$35<span>/Month</span></h2>-->
                                    </div>
                                    <div class="pricing-content-box" >
                                        <div class="pricing-content" style="height: 230px">
                                            <div class="pricing-point">
                                                <ul>
                                                    <li>
                                                        <img src="assets/images/check.png" alt="Check">
                                                        <b>Price : &#8360; <span style="text-decoration: line-through" ><%=price%></span></b>
                                                    </li>
                                                    <li>
                                                        <img src="assets/images/check.png" alt="Check">
                                                        <b>Offer Price : &#8360; <span><%=offerprice%></span></b>
                                                    </li>
                                                    <li>
                                                        <img src="assets/images/check.png" alt="Check">
                                                        <p><%=desc%></p>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <a onclick="selectDates(<%=packageid%>, <%=duration%>)" class="sec-btn">Join Now</a>

                                    </div>
                                </div>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                    
                        <hr style="height: 2px" >
                    <div class="row">
                        <h2 class="h2-title" id="gymname2">Photos :</h2>

                        <div class="col-sm-3"></div>
                        <div id="showphotos" class="col-sm-6 " >

                        </div><br><br>
                    </div>
                        
                    <hr style="height: 2px">
                    <h2 class="h2-title" id="gymname2">Find Us on Google Maps :</h2>

                    <div class="main-contact-map-in">
                        <div class="mapouter"><div class="gmap_canvas">
                                <iframe width="100%" height="100%" id="gmap_canvas" src="https://maps.google.com/maps?q=31.636694035778973,74.87413616805217&ie=UTF8&iwloc=&output=embed" frameborder="0" scrolling="no" marginheight="0" marginwidth="0"></iframe><a href="https://2yu.co">2yu</a><br><style>.mapouter{
                                        position:relative;
                                        text-align:right;
                                        height:100%;
                                        width:100%;
                                        }</style><a href="https://embedgooglemap.2yu.co/">html embed google map</a><style>.gmap_canvas {
                                        overflow:hidden;
                                        background:none!important;
                                        height:100%;
                                        width:100%;
                                        }</style></div></div>
                    </div>

                    <hr style="height: 2px" >
                </div>
            </div>

        </section>

        <!--Portfolio Detail End-->

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
                                <span>Copyright © 2022 <a href="index.html">ShivaayThemes.</a> All rights reserved.</span>
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
        <%@include file="Footer.jsp" %>
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

        <!--Back To Top JS-->
        <script src="assets/js/back-to-top.js"></script>

        <!--Jarallax JS-->
        <script src="assets/js/jarallax.js"></script>
        <script src="assets/js/jarallax.min.js"></script>
        <script src="bootstrap-5.0.2-dist/js/bootstrap.bundle.js" type="text/javascript"></script>
    </body>

    <!-- Mirrored from shivaaythemes.in/fithub-demo/portfolio-detail.html by HTTrack Website Copier/3.x [XR&CO'2014], Mon, 27 Mar 2023 08:20:10 GMT -->
</html>
