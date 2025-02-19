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

        <!--FavIcon CSS--> 
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

        <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
            <%
                String packageid = request.getParameter("packageid");
                String duration = request.getParameter("duration");
            %>
            var packageid = "<%=packageid%>";
            var price = "";

            function userShowPlan()
            {
                var url = "./userShowPlan";

                var formdata = new FormData();
                formdata.append("packageid", packageid);

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

                    price = st.offerprice;

                    document.getElementById("planname").innerHTML = st.packagename;
                    document.getElementById("offerprice").innerHTML = st.offerprice;
                    document.getElementById("desc").innerHTML = st.desc;
                }
            }

            function modeOfPayment()
            {
                var startdate = document.getElementById("choosedate").innerHTML;
                var enddate = document.getElementById("enddate").innerHTML;
                if (startdate == "")
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Select Date First !'
                    });
                } else {
                    window.location.href = "UserModeOfPayment.jsp?startdate=" + startdate + "&enddate=" + enddate + "&packageid=" + packageid + "&price=" + price;
                }

            }


        </script>

    </head>
    <body onload="userShowPlan()" >

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
                            <h1 class="h1-title" id="planname"></h1>
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
                            <h4 class="h2-title" id="">Description :</h4>
                            <b><span id="desc"></span></b>
                            <hr style="height: 2px" >
                            <h4 class="h2-title" id="">Price :</h4>
                            <b>Offer Price : &#8360; <span id="offerprice"></span></b>
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="portfolio-detail-info-box">
                            <div class="portfolio-detail-info-content">
                                <div style="text-align: center" >
                                    <h3 style="color: white" >Choose your date :</h3><br>
                                    <p><input style="border: 1px solid white; background-color: white" onchange="getEndDate()" id="datepicker"></p>
                                </div>
                            </div>

                            <div class="portfolio-detail-info-content two">
                                <div class="portfolio-detail-info-text">
                                    <span>Start Date :</span>
                                    <span id="choosedate" ></span>
                                </div>
                                <div class="portfolio-detail-info-text two">
                                    <span>End date :</span>
                                    <span id="enddate" ></span>
                                </div>
                            </div>

                            <div class="portfolio-detail-info-content two">
                                <div class="portfolio-detail-info-text">
                                    <input type="button" class="btn btn-success" value="Payment" onclick="modeOfPayment()" >
                                </div>
                            </div>
                        </div>
                    </div>
                    <br>
                </div>
            </div>
        </section>


        <!--Footer Start-->

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

        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
        <script>
                                        var startdate = "";
                                        $(function () {
                                            $("#datepicker").datepicker({
                                                minDate: 0
                                            });
                                            startdate = $("#datepicker");
                                        });

                                        function getEndDate()
                                        {
                                            startdate = new Date(datepicker.value);

                                            var diff = <%=duration%>;

                                            var result = new Date(startdate);
                                            var choosedate = (result.getMonth() + 1) + "/" + result.getDate() + "/" + result.getFullYear();
                                            result.setDate(result.getDate() + diff);
                                            var enddate = (result.getMonth() + 1) + "/" + result.getDate() + "/" + result.getFullYear();
                                            document.getElementById("enddate").innerHTML = enddate;
                                            document.getElementById("choosedate").innerHTML = choosedate;
                                        }
        </script>

        <!-- Jquery JS Link -->
        <!--<script src="assets/js/jquery.min.js"></script>-->

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
