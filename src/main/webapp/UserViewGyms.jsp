
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
                String cityname = request.getParameter("cityname");
            %>
            var cityname = "<%=cityname%>";
            function showGyms()
            {
                var url = "./userShowAllGyms";

                var formdata = new FormData();
                formdata.append("cityname", cityname);

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderGyms(ans));
            }
            function renderGyms(ans)
            {
                ans = ans.trim();
                var mainobj = JSON.parse(ans);
                var arr = mainobj["ans"];

                var ren = "";

                ren += "<div class=\"row\">";
                for (var i = 0; i < arr.length; i++)
                {
                    var st = arr[i];

                    ren += "<div class=\"col-sm-4\" style=\"height: 400px\">";
                    ren += "<div class=\"portfolio-box wow fadeInUp\" data-wow-delay=\".5s\" >";
                    ren += "<img style=\"height: 330px\" src=" + st.photo + " alt=\"Portfolio\">";
                    ren += "<div class=\"portfolio-content\">";
                    ren += "<span>Weight Loss Program</span>";
                    ren += "<a href=\"UserViewGymGallery.jsp?gymid=" + st.gymid + "\"><h3 class=\"h3-title\">" + st.gymname + "</h3></a>";
                    ren += "</div>";
                    ren += "</div>";
                    ren += "</div>";

                }
                ren += "</div>";
                document.getElementById("showgyms").innerHTML = ren;
            }

        </script>


    </head>
    <body onload="showGyms()">

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

        </section>
        <!--Banner End-->
        
        <div class="row" style="margin-top: 50px">
                        <div class="col-sm-12">
                            <div class="classes-title">
                                <div class="subtitle">
                                    <h2 class="h2-subtitle">Cities</h2>
                                </div>
                                <h2 style="color: black" class="h2-title">Our Gyms In <%=cityname%></h2>
                            </div>
                        </div>
                    </div>
        
        
        
        <!--Portfolio Start-->
        <div class="main-portfolio" style="margin-top: 100px">
            <div class="container-fluid">
                <div class="portfolio-slider" id="showgyms">
                   
                 
                </div>
            </div>
        </div>
        <!--Portfolio End-->


        <section class="main-about-us" ></section>


                    <!--Footer Start-->

                    <%@include file="Footer.jsp"  %>

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