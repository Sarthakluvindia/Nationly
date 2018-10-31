<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="refresh" content="100" >
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Places | Nationly by Sarthak Agarwal</title>
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/ionicons.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>
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
        
      <!-- Places to visit -->
<section id="works" class="works">
                <div class="container">
                    <div class="section-heading">
                    <h2 class="title wow fadeInDown" data-wow-delay=".3s"><b><i>Popular places</i></b></h2>
                        <p class="wow fadeInDown" data-wow-delay=".5s" style="color: #000000">
                            These are some popular places people choose.
                        </p>
                    </div>
                    <div class="row">
                    <%
                    String city;
                    String state;
                    Class.forName("com.mysql.jdbc.Driver");
                	Connection con=(Connection) DriverManager.getConnection("jdbc:mysql://localhost/nationly?user=root&password=Sarthak@124");
                	String retquery="select name,state from pop order by clicks desc limit 3";
                	PreparedStatement retst=con.prepareStatement(retquery);
                	ResultSet rs=retst.executeQuery();	
                                		while(rs.next()){
                                			city = rs.getString(1);
                                			state = rs.getString(2);
                                		
                                %>
                        <div class="col-sm-4 col-xs-12">
                            <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                                <div class="img-wrapper">
                              
                                   <a rel="gallery" href="Cities.jsp?city=<%=city %>">
                                    <img src="PlacesData/<%=city %>/<%=city %>.jpg" class="img-responsive" alt="<%=city %>image" />
                                    </a>
                                    
                                </div>
                                <h4>
                                <%=city %>
                                </h4>
                                <p>
                                <%=state %>
                                </p>
                            </figure>
                        </div>
                        <%}
                          %>
                        
                        
                        </div>
                        </div>
            </section>   
            
            <!-- Places to visit -->
<section id="works" class="works">
                <div class="container" style="margin-top: -100px">
                    <div class="section-heading">
                    <h2 class="title wow fadeInDown" data-wow-delay=".3s"><b><i>Other places</i></b></h2>
                        <p class="wow fadeInDown" data-wow-delay=".5s" style="color: #000000">
                            These are some popular places people choose.
                        </p>
                    </div>
                    <div class="row">
                    <%
                                ServletContext cn1=getServletContext();
                                String str1 = cn1.getRealPath("/")+"\\PlacesData";
                                File f1=new File(str1);
                                File list1[]=f1.listFiles();
                                for(File ff:list1)
        						{
        							if(ff.getName().contains(".jpg"))
        							{
        							}
        							else if(ff.getName().contains(".txt"))
        							{
        							}
        							else{
                                		
                                %>
                        <div class="col-sm-4 col-xs-12">
                            <figure class="wow fadeInLeft animated portfolio-item" data-wow-duration="500ms" data-wow-delay="0ms">
                                <div class="img-wrapper">
                              
                                   <a id="<%=ff.getName() %>" rel="gallery" href="Cities.jsp?city=<%=ff.getName()%>">
                                    <img src="PlacesData/<%=ff.getName()%>/<%=ff.getName()%>.jpg" class="img-responsive" alt="<%=ff.getName() %> image" />
                                    </a>
                                    
                                </div>
                                <h4>
                                <%=ff.getName() %>
                                </h4>
                                <p>
                                 <%
                                    String path=cn1.getRealPath("/")+"\\PlacesData\\"+ff.getName()+"-state.txt";
	 								File text=new File(path);
	 								FileReader fr=new FileReader(text);
	 								BufferedReader br=new BufferedReader(fr);
	 								String t;
	 								while((t=br.readLine())!=null)
	 									out.println(t);
	 								br.close();
	 								fr.close(); %>
                                </p>
                            </figure>
                        </div>
                        <%}
						}%>

                        
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
          <%int j=1;
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