
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

            <%
                String gymid = request.getParameter("gymid");
            %>

            var gymid = "<%=gymid%>";

            function addGym()
            {
                var url = "./ownerEditGym";

                var gymname = document.getElementById("gymname").value;
                var address = document.getElementById("address").value;
                var latitude = document.getElementById("latitude").value;
                var longitude = document.getElementById("longitude").value;

                if (gymname == "" || address == "" || latitude == "" || longitude == "")
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Enter The Form Properly !'
                    });
                } else {

                    var formdata = new FormData();
                    formdata.append("gymname", gymname);
                    formdata.append("address", address);
                    formdata.append("latitude", latitude);
                    formdata.append("longitude", longitude);

                    var pool = document.getElementById("pool");
                    if (pool.checked)
                    {
                        formdata.append("pool", "True");
                    } else
                    {
                        formdata.append("pool", "False");
                    }

                    var sauna = document.getElementById("sauna");
                    if (sauna.checked)
                    {
                        formdata.append("sauna", "True");
                    } else
                    {
                        formdata.append("sauna", "False");
                    }

                    var changingroom = document.getElementById("changingroom");
                    if (changingroom.checked)
                    {
                        formdata.append("changingroom", "True");
                    } else
                    {
                        formdata.append("changingroom", "False");
                    }

                    var locker = document.getElementById("locker");
                    if (locker.checked)
                    {
                        formdata.append("locker", "True");
                    } else
                    {
                        formdata.append("locker", "False");
                    }

                    var parking = document.getElementById("parking");
                    if (parking.checked)
                    {
                        formdata.append("parking", "True");
                    } else
                    {
                        formdata.append("parking", "False");
                    }

                    var ac = document.getElementById("ac");
                    if (ac.checked)
                    {
                        formdata.append("ac", "True");
                    } else
                    {
                        formdata.append("ac", "False");
                    }

                    var shower = document.getElementById("shower");
                    if (shower.checked)
                    {
                        formdata.append("shower", "True");
                    } else
                    {
                        formdata.append("shower", "False");
                    }

                    var washroom = document.getElementById("washroom");
                    if (washroom.checked)
                    {
                        formdata.append("washroom", "True");
                    } else
                    {
                        formdata.append("washroom", "False");
                    }

                    var water = document.getElementById("water");
                    if (water.checked)
                    {
                        formdata.append("water", "True");
                    } else
                    {
                        formdata.append("water", "False");
                    }

                    fetch(url, {method: "POST", body: formdata})
                            .then(response => response.text())
                            .then(ans => renderResponse(ans));
                }
            }
            function renderResponse(ans)
            {
                if (ans == "success")
                {
                    Swal.fire({
                        icon: 'sucsess',
                        title: 'Done...',
                        text: 'Edit Successfully!'
                    })
                    ownerEditGymes();
                } else
                {
                    Swal.fire({
                        icon: 'error',
                        title: 'Oops...',
                        text: 'Same Gym name has registered, Change your Gym name !'
                    });
                }
            }

            function ownerEditGymes()
            {
                var url = "./ownerGetInfo";

                var formdata = new FormData();
                formdata.append("gymid", gymid);

                fetch(url, {method: "POST", body: formdata})
                        .then(response => response.text())
                        .then(ans => fitInfo(ans));
            }
            function fitInfo(ans)
            {
                ans = ans.trim();
                var mainobj = JSON.parse(ans);
                var arr = mainobj["ans"];

                var st = arr[0];

                document.getElementById("gymname").value = st.gymname;
                document.getElementById("address").value = st.address;
                document.getElementById("latitude").value = st.latitude;
                document.getElementById("longitude").value = st.longitute;

                if (st.pool == "True")
                {
                    document.getElementById("pool").checked = true;
                }
                if (st.sauna == "True")
                {
                    document.getElementById("sauna").checked = true;
                }
                if (st.changing_room == "True")
                {
                    document.getElementById("changingroom").checked = true;
                }
                if (st.lockers == "True")
                {
                    document.getElementById("locker").checked = true;
                }
                if (st.parking_facility == "True")
                {
                    document.getElementById("parking").checked = true;
                }
                if (st.ac == "True")
                {
                    document.getElementById("ac").checked = true;
                }
                if (st.shower == "True")
                {
                    document.getElementById("shower").checked = true;
                }
                if (st.washroom == "True")
                {
                    document.getElementById("washroom").checked = true;
                }
                if (st.waterfacility == "True")
                {
                    document.getElementById("water").checked = true;
                }

            }


        </script>

    </head>
    <body onload="ownerEditGymes();" >

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

        <%@include file="OwnerNavbar.jsp" %>

        <section class="main-classes" >

            <div class="classes-overlay-bg animate-this">
                <img src="assets/images/classes-overlay-bg.png" alt="Overlay">
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="classes-title">
                            <h2 class="h2-title">Edit Information</h2>
                        </div>
                    </div>
                </div>

                <div id="login">
                    <br>
                    <form autocomplete="off" id="gymform" >
                        <div class="form-group">
                            <label style="color: white" >Gym Name</label>
                            <input style="border: 2px solid black; border-radius: 10px" class="form-control" id="gymname" type="text" readonly>
                        </div><br>
                        <div class="form-group">
                            <label style="color: white" >Address</label>
                            <input style="border: 2px solid black; border-radius: 10px" class="form-control" id="address" type="text">
                        </div><br>

                        <div id="showcities" >


                        </div><br>

                        <div class="row" >
                            <div class="form-group col-sm-6">
                                <label style="color: white" >Latitude</label>
                                <input style="border: 2px solid black; border-radius: 10px" class="form-control" id="latitude" type="text">
                            </div><br>
                            <div class="form-group col-sm-6 ">
                                <label style="color: white" >Longitude</label>
                                <input style="border: 2px solid black; border-radius: 10px" class="form-control" id="longitude" type="text">
                            </div><br>
                        </div><br>
                        <div class="form-group">
                            <label style="color: white" >Choose Amenities your gym offers.</label>
                            <div  style="border: 2px solid black; border-radius: 10px; background-color: white" class="form-control" id="" type="">

                                <label class="row" >
                                    <div class="form-group col-sm-2" style="text-align: center" >
                                        <input type="checkbox" id="pool">
                                        <span class="checkmark"><b>Pool</b></span>
                                    </div><br>

                                    <div class="form-group col-sm-2" style="text-align: center" >
                                        <input type="checkbox" id="sauna">
                                        <span class="checkmark"><b>Spa & Sauna</b></span>
                                    </div><br>

                                    <div class="form-group col-sm-2" style="text-align: center" >
                                        <input type="checkbox" id="changingroom">
                                        <span class="checkmark"><b>Changing Room</b></span>
                                    </div><br>

                                    <div class="form-group col-sm-2" style="text-align: center" >
                                        <input type="checkbox" id="locker">
                                        <span class="checkmark"><b>Lockers</b></span>
                                    </div><br>

                                    <div class="form-group col-sm-2" style="text-align: center" >
                                        <input type="checkbox" id="parking">
                                        <span class="checkmark"><b>Parking Facility</b></span>
                                    </div><br>

                                    <div class="form-group col-sm-2" style="text-align: center" >
                                        <input type="checkbox" id="ac">
                                        <span class="checkmark"><b>Central AC</b></span>
                                    </div><br>

                                </label><br>

                                <label class="row" >
                                    <div class="form-group col-sm-2" style="text-align: center" >
                                        <input type="checkbox" id="shower">
                                        <span class="checkmark"><b>Shower</b></span>
                                    </div><br>

                                    <div class="form-group col-sm-2" style="text-align: center" >
                                        <input type="checkbox" id="washroom">
                                        <span class="checkmark"><b>Washrooms</b></span>
                                    </div><br>

                                    <div class="form-group col-sm-2" style="text-align: center" >
                                        <input type="checkbox" id="water">
                                        <span class="checkmark"><b>Water Dispenser</b></span>
                                    </div><br>

                                </label><br>

                            </div>
                        </div><br>

                        <div id="pass-info" class="clearfix"></div>
                        <input type="button" value="Edit !" onclick="addGym()" class="btn btn-success">

                    </form>
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
