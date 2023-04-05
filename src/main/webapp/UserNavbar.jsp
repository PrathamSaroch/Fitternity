     <header class="site-header">
        <div class="header-bottom">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-2">
                         <!--Sit Logo Start--> 
                        <div class="site-branding">
                            <a href="#" title="Fithub">
                                <img src="assets/images/logo.png" alt="Logo">
                                <img src="assets/images/logo_stickey.png" class="sticky-logo" alt="Logo">
                            </a>
                        </div>
                         <!--Sit Logo End--> 
                    </div>
                    <div class="col-lg-10">
                        
                        <%
                                String useremail =(String) session.getAttribute("useremail");
                                if(useremail != null)
                                {
                        %>
                        
                        <div class="header-menu">
                            <nav class="main-navigation one">
                                <button class="toggle-button">
                                    <span></span>
                                    <span class="toggle-width"></span>
                                    <span></span>
                                </button>
                                <div class="mobile-menu-box">
                                    <i class="menu-background top"></i>
                                    <i class="menu-background middle"></i>
                                    <i class="menu-background bottom"></i>
                               <ul class="menu">
                                   <li><a href="">Welcome : <%=useremail%></a></li>
                                   <li><a href="index_1.jsp">Main Page </a></li>
                                   <li><a href="UserViewPurchasedPackages.jsp">Your Purchased Packages </a></li>
                                   <li><a href="UserLogout.jsp">Logout !</a></li>
                               </ul>
                                </div>
                            </nav>
                        </div>
                        
                        <%
                            }else{
                        %>
                        
                        <div class="header-menu">
                            <nav class="main-navigation one">
                                <button class="toggle-button">
                                    <span></span>
                                    <span class="toggle-width"></span>
                                    <span></span>
                                </button>
                                <div class="mobile-menu-box">
                                    <i class="menu-background top"></i>
                                    <i class="menu-background middle"></i>
                                    <i class="menu-background bottom"></i>
                               <ul class="menu">
                                <li class="sub-items active">
                                    <a href="javascript:void(0);" title="Home">User</a>
                                    <ul class="sub-menu">
                                        <li><a href="UserLogin.jsp" title="Home">User Login</a></li>
                                        <li><a href="UserSignup.jsp" title="Home">User Signup</a></li>
                                    </ul>
                                    </li>
                                    
                                    <li class="sub-items active">
                                    <a href="javascript:void(0);" title="Home">Owner</a>
                                    <ul class="sub-menu">
                                        <li><a href="OwnerLogin.jsp" title="Home">Owner Login</a></li>
                                        <li><a href="OwnerSignup.jsp" title="Home">Owner Signup</a></li>
                                    </ul>
                                    </li>
                                    
                                    <li class="sub-items active">
                                    <a href="javascript:void(0);" title="Home">Admin</a>
                                    <ul class="sub-menu">
                                        <li><a href="AdminLogin.jsp" title="Home">Admin Login</a></li>
                                    </ul>
                                    </li>

                               </ul>
                                </div>
                            </nav>
                            <div class="header-search-box">
                                <a href="javascript:void(0);" data-bs-toggle="modal" data-bs-target="#search-modal" class="header-search">
                                    <i class="fa fa-search" aria-hidden="true"></i>
                                </a>
                            </div>
                            <div class="black-shadow"></div>
                            <div class="header-btn">
                                <a href="UserSignup.jsp" class="sec-btn">Enrole now !</a>
                            </div>
                        </div>
                        
                        <%
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
    </header>