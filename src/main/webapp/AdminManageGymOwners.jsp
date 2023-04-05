
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
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        
        <script>

            function adminGetAllOwners()
            {
                var url = "./adminGetAllOwners";

                fetch(url, {method: "POST"})
                        .then(response => response.text())
                        .then(ans => ownerCities(ans));
            }
            function ownerCities(ans)
            {
                ans = ans.trim();
                var mainobj = JSON.parse(ans);
                var arr = mainobj["ans"];

                var ren = "";
                var ren1 = "";
                for (var i = 0; i < arr.length; i++)
                {
                    var st = arr[i];

                    if (st.status == "Pending")
                    {

                        ren += "<div class=\"row\" >";

                        ren += "<div class=\"col-sm-3\" >";
                        ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;\" src=\'" + st.photo + "\' >";
                        ren += "</div>";

                        ren += "<div class= \"col-sm-3\" style=\"text-align: center\" >";
                        ren += "<div class=\"card-body\">";
                        ren += "<label class=\"card-text text-alli\" style=\"font-size: 25px;text-align: center\" >Owner Name : " + st.ownername + "</label><br><br>";
                        ren += "<label class=\"card-text text-alli\" style=\"font-size: 25px;text-align: center\" >Owner Email : " + st.owneremail + "</label><br><br>";
                        ren += "</div>";
                        ren += "</div>";

                        ren += "<div class= \"col-sm-3\" style=\"text-align: center\" >";
                        ren += "<div class=\"card-body\">";
                        ren += "<label class=\"card-text text-alli\" style=\"font-size: 25px;text-align: center\" >City : " + st.city + "</label><br><br>";
                        ren += "<label class=\"card-text text-alli\" style=\"font-size: 25px;text-align: center\" >Franchise Name : " + st.franchisename + "</label><br><br>";
                        ren += "</div>";
                        ren += "</div>";

                        ren += "<div class= \"col-sm-3\" style=\"text-align: center\" >";
                        ren += "<input type=\"button\" value=\"Approve\" class=\"btn btn-success\" onclick=\"approveOwner('" + st.owneremail + "')\" ><br><br>";
                        ren += "</div>";

                        ren += "</div>";
                        ren += "<br>";
                        ren += "<hr>";
                    } else
                    {
                        ren1 += "<div class=\"row\" >";

                        ren1 += "<div class=\"col-sm-3\" >";
                        ren1 += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;\" src=\'" + st.photo + "\' >";
                        ren1 += "</div>";

                        ren1 += "<div class= \"col-sm-3\" style=\"text-align: center\" >";
                        ren1 += "<div class=\"card-body\">";
                        ren1 += "<label class=\"card-text text-alli\" style=\"font-size: 25px;text-align: center\" >Owner Name : " + st.ownername + "</label><br><br>";
                        ren1 += "<label class=\"card-text text-alli\" style=\"font-size: 25px;text-align: center\" >Owner Email : " + st.owneremail + "</label><br><br>";
                        ren1 += "</div>";
                        ren1 += "</div>";

                        ren1 += "<div class= \"col-sm-3\" style=\"text-align: center\" >";
                        ren1 += "<div class=\"card-body\">";
                        ren1 += "<label class=\"card-text text-alli\" style=\"font-size: 25px;text-align: center\" >City : " + st.city + "</label><br><br>";
                        ren1 += "<label class=\"card-text text-alli\" style=\"font-size: 25px;text-align: center\" >Franchise Name : " + st.franchisename + "</label><br><br>";
                        ren1 += "</div>";
                        ren1 += "</div>";

                        ren1 += "<div class= \"col-sm-3\" style=\"text-align: center\" >";
                        ren1 += "<input type=\"button\" value=\"Block\" class=\"btn btn-danger\" onclick=\"pendingOwner('" + st.owneremail + "')\" ><br><br>";
                        ren1 += "</div>";

                        ren1 += "</div>";
                        ren1 += "<br>";
                        ren1 += "<hr>";
                    }

                }
                document.getElementById("pending").innerHTML = ren;
                document.getElementById("approved").innerHTML = ren1;
            }

            function approveOwner(owneremail)
            {
                var url = "./adminApproveOwner";
                
                var formdata = new FormData();
                formdata.append("owneremail", owneremail);
                
                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => approve(ans));
            }
            function approve(ans)
            {
                if (ans == "success")
                {
                    Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'Owner Approved!'
                    });
                    adminGetAllOwners();
                } else
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Error Occured !'
                    });
                }
            }
            
            function pendingOwner(owneremail)
            {
                var url = "./adminPendingOwner";
                
                var formdata = new FormData();
                formdata.append("owneremail", owneremail);
                
                fetch(url, {method: "POST",body: formdata})
                        .then(response => response.text())
                        .then(ans => pending(ans));
            }
            function pending(ans)
            {
                if (ans == "success")
                {
                    Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'Owner Blocked!'
                    })
                    adminGetAllOwners();
                } else
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Error Occured !'
                    });
                }
            }

        </script>
    </head>
    <body onload="adminGetAllOwners()" >

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
                            <h2 class="h2-title">Pending Franchise Owners</h2>
                        </div>
                    </div>
                </div>

                <div id="pending" style="border: 2px solid black; border-radius: 10px;margin: 40px;background-color: white; padding: 10px" >

                </div>

            </div>

            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="classes-title">
                            <h2 class="h2-title">Approved Franchise Owners</h2>
                        </div>
                    </div>
                </div>

                <div id="approved" style="border: 2px solid black; border-radius: 10px;margin: 40px;background-color: white; padding: 10px" >

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