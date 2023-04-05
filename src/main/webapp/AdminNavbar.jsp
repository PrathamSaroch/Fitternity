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

                                    <%
                                        String adminemail = (String) session.getAttribute("adminemail");
if(adminemail != null )
{
                                    %>

                                    <li>
                                        <a href="" >Welcome Admin : <%=adminemail%></a>
                                    </li>
                                    <li><a href="AdminLogout.jsp">Logout !</a></li>

                                    <%
                                        }
                                    %>

                            </div>
                    </div>
                </div>
            </div>
        </div>
</header>