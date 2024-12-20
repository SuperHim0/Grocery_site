<%@page import="java.util.ArrayList"%>
<%
//	ArrayList<String> loginData = (ArrayList<String>) session.getAttribute("LoginData");
//	if(loginData == null){
//		response.sendRedirect("index.jsp");
//		return;
//	}
%>

<%@page import="com.example.superhim.pojo.ProductPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.example.superhim.dao.ProductDao"%>
<%@page import="com.example.superhim.GetApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Ogani | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
</head>

<body>
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Humberger Begin -->
    <%@include file="humburgur.jsp" %>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
	<%-- <%@include file="header.jsp" %>
   --%>  <!-- Header Section End -->

    <!-- Hero Section Begin -->
   <%@include file="hero.jsp" %>
       <!-- Hero Section End -->
                
                <div class="col-lg-12 col-md-6">
                    <div class="product__discount">
                        <div class="section-title product__discount__title">
                            <h2>Products:-</h2>
                        </div>
                        <div class="row">
                            <div class="product__discount__slider owl-carousel">
                        </div>
                    </div>
                  
                    <div class="row">
                    
                <%
                   String search= request.getParameter("search");
                                		/* System.out.println(search); */
                   ApplicationContext ac = GetApplicationContext.getApplicationContext();
                   ProductDao pd= ac.getBean(ProductDao.class);
                   Iterable <ProductPojo> list = null;
                    if(search==null){ 
                    	String department = request.getParameter("department");
                    	if(department==null || department.equalsIgnoreCase("all")){
                    		list = pd.findAll();
                    	}else{
                    		list = pd.getProductDepartmentWise(department);
                    	}
                    	                    	
                    }else{
                    	//search
                      	list = pd.SearchCategory(search);
                    	//System.out.println("56"+list);
                    }
                    ArrayList<ProductPojo> arrayList = (ArrayList<ProductPojo>)list;
                    session.setAttribute("ProductDetails", arrayList);
                    int index=0;
                    for(ProductPojo pp:arrayList){
                                   		
                    %>
                    
                        <div class="col-lg-3 col-md-4 col-sm-6" style="box-sizing:border-box">
                            <div class="product__item" style="border: 6px solid black" >
                                <div class="product__item__pic set-bg" data-setbg="myown/productimage/<%=pp.getProductimage()%>">
                                    <!-- <ul class="product__item__pic__hover">
                                        <li><a href="#"><i class="fa fa-heart"></i></a></li>
                                        <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                                        <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                                    </ul> -->
                                </div>
                                <div class="product__item__text">
                                    <h6><a href="#"><%=pp.getProducttital() %></a></h6>
                                   <h5><del>Rs.<%=pp.getCrossprice()%></del></h5>
                           		 <h5>Rs.<%=pp.getMainprice()%> only</h5>
                           		 <a href="product-details.jsp?index=<%=index%>" class="primary-btn">BUY NOW</a>
                                </div>
                            </div>
                        </div>
                       <%
                    index++;   
                    } %> 
                        
                    </div>
                    <div class="product__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Footer Section Begin -->
	<%@include file="footer.jsp" %>

    <!-- Footer Section End -->

    <!-- Js Plugins -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.nice-select.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jquery.slicknav.js"></script>
    <script src="js/mixitup.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/main.js"></script>



</body>

</html>