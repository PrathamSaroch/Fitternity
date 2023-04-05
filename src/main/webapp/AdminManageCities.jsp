
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

            function addCity()
            {
                var url = "./adminAddCities";

                var cityname = document.getElementById("cityname").value;
                var desc = document.getElementById("desc").value;
                var photo = document.getElementById("photo").files[0];

                var formdata = new FormData();
                formdata.append("cityname", cityname);
                formdata.append("desc", desc);
                formdata.append("photo", photo);

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => renderResponse(ans));
            }
            function renderResponse(ans)
            {
                if (ans == "success")
                {
                    Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'City Added Successfully!'
                    })
                    document.getElementById("cityform").reset();
                    adminShowCities();
                } else
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'City Already Present !'
                    });
                }
            }

            function adminShowCities()
            {
                var url = "./adminShowCities";

                fetch(url, {method: "POST"})
                        .then(response => response.text())
                        .then(ans => showCities(ans));
            }
            function showCities(ans)
            {
                ans = ans.trim();
                var mainobj = JSON.parse(ans);
                var arr = mainobj["ans"];

                var ren = "";
                for (var i = 0; i < arr.length; i++)
                {
                    var st = arr[i];

                    ren += "<div class=\"row\" >";

                    ren += "<div class=\"col-sm-3\" >";
                    ren += "<img class=\"img-thumbnail\" style=\"border: 2px solid black; border-radius: 10px;\" src=\'" + st.photo + "\' >";
                    ren += "</div>";

                    ren += "<div class= \"col-sm-6\" style=\"text-align: center\" >";
                    ren += "<div class=\"card-body\">";
                    ren += "<label class=\"card-text text-alli\" style=\"font-size: 25px;text-align: center\" >City Name : " + st.cityname + "</label><br><br>";

                    ren += "</div>";
                    ren += "</div>";

                    ren += "<div class= \"col-sm-3\" style=\"text-align: center\" >";
                    ren += "<input type=\"button\" value=\"Delete City\" class=\"btn btn-dark\" onclick=\"adminDeleteCity('" + st.cityname + "')\" ><br><br>";

                    ren += "</div>";

                    ren += "</div>";
                    ren += "<br>";
                    ren += "<hr>";

                }
                document.getElementById("showcity").innerHTML = ren;
            }

            function adminDeleteCity(cityname)
            {
                var url = "./adminDeleteCities";

                var formdata = new FormData();
                formdata.append("cityname", cityname);

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => deleteCity(ans));
            }
            function deleteCity(ans)
            {
                if (ans == "success")
                {
                    Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'City Deleted Successfully!'
                    })
                    adminShowCities();
                } else
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Error While Deleting !'
                    });
                }
            }

        </script>

    </head>
    <body onload="adminShowCities()" >

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

        <section class="main-classes" >

            <div class="classes-overlay-bg animate-this">
                <img src="assets/images/classes-overlay-bg.png" alt="Overlay">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="classes-title">
                            <h2 class="h2-title">Admin Add Cities</h2>
                        </div>
                    </div>
                </div>

                <div id="login">
                    <br>
                    <form autocomplete="off" id="cityform" >
                        <div class="form-group">
                            <label style="color: white" >City Name</label>
                            <input style="border: 2px solid black; border-radius: 10px" class="form-control" id="cityname" type="text">
                        </div><br>
                        <div class="form-group">
                            <label style="color: white" >Description</label>
                            <textarea style="height: 200px; border: 2px solid black; border-radius: 10px" class="form-control" id="desc" type=""></textarea>
                        </div><br>
                        <div class="form-group">
                            <label style="color: white" >Photo</label><br>
                            <input style="border: 2px solid black; border-radius: 10px" id="photo" type="file" >
                        </div><br>

                        <div id="pass-info" class="clearfix"></div>
                        <input type="button" value="Add City" onclick="addCity()" class="btn btn-success">

                    </form>
                </div>
            </div>
            <hr>
            <div class="container" ><hr><br>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="classes-title">
                            <h2 class="h2-title">Added Cities</h2>
                        </div>
                    </div>
                </div>
                <div id="showcity" style="border: 2px solid black; border-radius: 10px;margin: 40px;background-color: white; padding: 10px" >

                </div>
            </div>

        </section>

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