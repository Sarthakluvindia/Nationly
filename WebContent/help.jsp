<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Help | Nationly by Sarthak Agarwal</title>

<!-- CSS Files -->
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/jquery.fancybox.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Javascript Files -->
<script type="text/javascript" src="js/main.js"></script>

</head>
<body>
<!-- Header  -->
<header id="top-bar" class="navbar-fixed-top animated-header">
            <div class="container">
                <div class="navbar-header">
                    <!-- responsive nav button -->
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    </button>
                    <!-- /responsive nav button -->
                    
                    <!-- logo -->
                    <div class="navbar-brand text" style="margin-top: -20px">
                        <a href="index.jsp" style="text-decoration: none; color: #fff">
                            <h1><b><i>Nationly</i></b></h1>
                        </a>
                    </div>
                    <!-- /logo -->
                </div>
                <!-- main menu -->
                <nav class="collapse navbar-collapse navbar-right" role="navigation">
                    <div class="main-menu">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="index.jsp" >Home</a></li>
                            <li><a href="about.jsp">About</a></li>
                            <li><a href="places.jsp">Places</a></li>
                            <li><a href="contact.jsp">Contact</a></li>
                            <li><a href="help.jsp">Help</a></li>
                            <li><a href="support.jsp">Support</a></li>
                            <li><a href="Login.jsp">Login</a></li>
                        </ul>
                    </div>
                </nav>
                <!-- /main nav -->
            </div>
        </header>
        
        <section id="about">
<div style="background-color: #000; padding: 15px">
                <div class="container-about" style="margin-top: 100px">
                    <div class="row">
                        <div class="col-md-6 col-sm-6">
                            <div class="block wow fadeInLeft" data-wow-delay=".3s" data-wow-duration="500ms">
                                <h2><b><i>About Nationly</i></b></h2>
                                <p>
                                     Nationly is a place for cultivated and dedicated bohemians. A place where you can get everything at one place: 
                                </p>
                                     <ul>
                                     <li>Want destinations, we have it.</li> 
                                     <li>Want hotels, we have it.</li>
                                     <li>Want tickets, we have it.</li>
                                     <li>Want rest days, we have it.</li>
                                     </ul>
                                
                                <p>Nationly is all about the fun of planning the details of your trip. We believe that your own personal trip requires you to have your own personal travel guide.
</p><p>Starting with one of our adjustable guides is the easiest way to decide what to do, where to dine and where to put your head down after an enjoyable day.
</p><p>Planning a trip was never this easy!</p>
                            </div>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <div class="block wow fadeInRight" data-wow-delay=".3s" data-wow-duration="500ms">
                                <img class="img-responsive" src="images/about.jpg" alt="" height="400px" width="600px">
                            </div>
                        </div>
                    </div>
                </div>
                </div>
            </section>
             <section id="contact-section" >
            <div class="container">
            <h2><b><i>Help</i></b></h2>
            <div class="row address-details" style="color: #000">
                    <div class="col-md-3">
                        <div class="address wow fadeInLeft" data-wow-duration="500ms" data-wow-delay=".3s">
                            <i class="fa fa-location-arrow"></i>
                            <h5>Mukesh Patel School of Technology Management and Engineering <br>Vile Parle West, Mumbai</h5>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="address wow fadeInLeft" data-wow-duration="500ms" data-wow-delay=".7s">
                            <i class="fa fa-send"></i>
                            <h5>nationly@gmail.com<br></h5>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="address wow fadeInLeft" data-wow-duration="500ms" data-wow-delay=".9s">
                            <i class="fa fa-mobile-phone"></i>
                            <h5>Sarthak:- 9929540832</h5>
                        </div>
                    </div>
                     <div class="col-md-3">
                        <div class="address wow fadeInLeft" data-wow-duration="500ms" data-wow-delay=".9s">
                            <i class="fa fa-angellist"></i>
                            <a href="http://bit.ly/nationly"><h5>http://bit.ly/nationly</h5></a>
                        </div>
                    </div>
                </div>
                </div>
                </section>
        <!-- Footer -->
<footer class="page-footer font-small stylish-color-dark pt-4">

    <!-- Footer Links -->
    <div class="container text-center text-md-left">

      <!-- Grid row -->
      <div class="row">
      <hr>

        <!-- Grid column -->
        <div class="col-md-4 mx-auto">

          <!-- Content -->
          <h4 class="font-weight-bold text-uppercase mt-3 mb-4"><b><i>About Nationly</i></b></h4>
          <p style="font-size: 14px">Nationly is all about the fun of planning the details of your trip. We believe that your own personal trip requires you to have your own personal travel guide.</p>

        </div>
        <!-- Grid column -->

        

        <!-- Grid column -->
        <div class="col-md-2 mx-auto">

          <!-- Links -->
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Ways to Travel</h5>

          <ul class="list-unstyled">
            <li>
              <a target="_blank" href="https://www.makemytrip.com/">Flights</a>
            </li>
            <li>
              <a target="_blank" href="https://www.irctc.co.in/nget/train-search">Trains</a>
            </li>
            <li>
              <a target="_blank" href="https://www.google.com/maps/">Road</a>
            </li>
            <li>
              <a target="_blank" href="https://www.google.com/maps/">Walking</a>
            </li>
          </ul>

        </div>
        <!-- Grid column -->

      

        <!-- Grid column -->
        <div class="col-md-2 mx-auto">

          <!-- Links -->
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Places Sorted...</h5>

          <ul class="list-unstyled">
            <li>
              <a href="places.jsp">Latest</a>
            </li>
            <li>
              <a href="places.jsp">Popular</a>
            </li>
            <li>
              <a href="places.jsp">Recent</a>
            </li>
            <li>
              <a href="places.jsp">None</a>
            </li>
          </ul>

        </div>
        <!-- Grid column -->


        <!-- Grid column -->
        <div class="col-md-2 mx-auto">

          <!-- Links -->
          <h5 class="font-weight-bold text-uppercase mt-3 mb-4">Popular Places</h5>

          <ul class="list-unstyled">
          <%
                                int j=1;
          						ServletContext c=getServletContext();
                                String popplaces = c.getRealPath("/")+"\\PlacesData";
                                File fi=new File(popplaces);
                                File listi[]=fi.listFiles();
                                for(File ff:listi)
        						{
        							if(ff.getName().contains(".jpg"))
        							{
        							}
        							else if(ff.getName().contains(".txt"))
        							{
        							}
        							else{
                                		
                                %>
            <li>
              <a href="Cities.jsp?city=<%=ff.getName()%>"><%=ff.getName() %></a>
            </li>
            <%j++;}
					
					if(j==5){break;};}%>
          </ul>

        </div>
        <!-- Grid column -->

      </div>
      <!-- Grid row -->

    </div>
    <!-- Footer Links -->

    <!-- Social buttons -->
    <ul class="list-unstyled list-inline text-center social">
       <li>
           <a href="#" class="fa fa-twitter" ></a>                   
       </li>
       <li>
           <a href="#" class="fa fa-google"></a>
       </li>
       <li>
           <a href="#" class="fa fa-instagram"></a>
       </li>
       <li>
           <a href="#" class="fa fa-linkedin"></a>
       </li>
    </ul>
    <!-- Social buttons -->
<br>
    <!-- Copyright -->
    <div class="footer-copyright text-center py-3" style="color: white">© 2018 Copyright:
      <a href="https://sarthakluvindia.wordpress.com/" style="color:white"> Sarthak Agarwal</a>
    </div>
    <!-- Copyright -->

</footer>
<!-- Footer -->
</body>
</html>