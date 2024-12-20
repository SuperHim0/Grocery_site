<%@page import="com.example.superhim.dao.PlaceOrderDao"%>
<%@page import="com.example.superhim.pojo.PlaceOrderPojo"%>
<%@page import="com.example.superhim.pojo.BillingAddressPojo"%>
<%@page import="com.example.superhim.GetApplicationContext"%>

<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="java.util.List"%>
<%@page import="com.example.superhim.dao.BillingAddressDao"%>
<%@page import="java.util.ArrayList"%>
<%
	/*  ArrayList<String> loginData = (ArrayList<String>) session.getAttribute("LoginData");
	if(loginData == null){
		response.sendRedirect("index.jsp");
		return;
	} 	 */
	String status =	request.getParameter("status");
	if(status != null){
		session.removeAttribute("login");
		response.sendRedirect("adminlogin.jsp");
		return;
	}
%>

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
        <link rel="stylesheet" href="newstyle.css">
    
    
        <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

    .container2 {
      max-width: 1200px;
      margin: 0 auto;
      padding: 20px;
      box-sizing: border-box;
    }

    .order-details {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    table {
      width: 100%;
      border-collapse: collapse;
      margin-top: 20px;
    }

    table, th, td {
      border: 1px solid #ddd;
    }

    th, td {
      padding: 12px;
      text-align: left;
    }

    th {
      background-color: #f2f2f2;
    }

    /* Media Queries */
    @media only screen and (max-width: 768px) {
      th, td {
        font-size: 14px;
      }
    }

    @media only screen and (max-width: 480px) {
      .order-details {
        padding: 10px;
      }

      th, td {
        font-size: 12px;
      }
    }
  </style>
    
</head>

<body>
   
<%--      <!-- Humberger Begin -->
    <%@include file="humburgur.jsp" %>
    <!-- Humberger End -->

    <!-- Header Section Begin -->
    <%@include file="header.jsp" %>
    <!-- Header Section End -->

    <!-- Hero Section Begin -->
     <%@include file="hero.jsp" %>
    <!-- Hero Section End --> --%>
  
    <%
        
       
      // String status= request.getParameter("status");
       ApplicationContext ac= GetApplicationContext.getApplicationContext();
       BillingAddressDao bad = ac.getBean(BillingAddressDao.class);
       Iterable<BillingAddressPojo> list = bad.findAll();
       System.out.print("all user diliverd data"+list);
       PlaceOrderDao pod = ac.getBean(PlaceOrderDao.class);
       for(BillingAddressPojo bap:list){
    	   int totalprice=0;   
    	  String isdelivered = bap.getIsDelivered();
    	  System.out.print("customerorder: "+isdelivered+""+status);
	      if(isdelivered.equalsIgnoreCase(status)) 
	      {
	    	String orderid = bap.getOrderid();
	    	System.out.print("order id of the product:"+orderid);
	    	List<PlaceOrderPojo> list1 =  pod.readOrderIdwise(orderid);
	    	//fatching the date and time of user 
	    	String date_time = bap.getDatetime();
	        String[] strarr = date_time.split("T" , 10);
    		System.out.println("Date :" +strarr[0]);

	    	for(String a: strarr){
	    		System.out.println("time and date :" +a);
	    	}
	    	
    %>
    
			 <div class="container2">
			    <div class="order-details">
			    
			     <h3 class="breadcrumb__text" style="text-align: center; color: green;"> <b><%@include file="Message/message.jsp" %></b><br></h3>
			      
			      <%
			      if(status.equalsIgnoreCase("No"))
			      {
			      %>
			      <h2 style="color: green;"><b>Arriving Products</b></h2>
		 		<%} else{%>
			      <h2 style="color: green;"><b>Delivered Products</b></h2>
                  <%} %>
			    
			      <h2>Order Details</h2>
			      <p><strong>Customer Name:<%=bap.getFirstname() %></strong></p>
			      <p><strong>Address:<%=bap.getAddress() %>,<%=bap.getCountry()%></strong> </p>
			      <p><strong>Town:<%=bap.getCity()%>,<%=bap.getState()%>,<%=bap.getPostcode()%></strong> </p>
			      <p><strong>Order Phone 1:<%=bap.getPhonenumber()%> </strong> </p>
			      <p><strong>Order Phone 2:<%=bap.getMobile()%> </strong> </p>
			      <p><strong>Date & Time:<%=bap.getDatetime()%> </strong> </p>
			      <p><strong>Note:<%=bap.getNotes()%>  </strong> </p>  
			      
			      
			
			      <table>
			        <thead>
			          <tr>
			            <th>Product Title</th>
			            <th>Product Price</th>
			            <th>Count</th>
			            <th>Bulk Price</th>
			          </tr>
			        </thead>
			        
			        <tbody>
			         <%
			      for(PlaceOrderPojo pop : list1){
  					int mainprice = Integer.parseInt(pop.getMainprice());
  					int count = pop.getCount();
  					int countmainprice = mainprice*count;
  					totalprice = totalprice+countmainprice;
  			%>
			        

			          <tr>
			            <td><%=pop.getProducttital()%></td>
			            <td><%=mainprice%></td>
			            <td><%=count%></td>
			            
			           <% 
			           
			      if(status.equalsIgnoreCase("No"))
			      {
			      %>
			            <td>Rs.<%=countmainprice %> /- <a style="color: red;" href="cancelorder?sn=<%=pop.getSn()%>&orderid=<%=orderid%>">cancel</a> </td>
			        <%}else{ %>    
			             
			            <td>Rs.<%=countmainprice %>/- </td>
                        <%} }//foreach loop of item%>
			          </tr>
			          
			      
			          <!-- Add more rows as needed -->
			        </tbody>
			      </table>
			 <%
			 String charge = bap.getCharge();
			 
			 if(!charge.equalsIgnoreCase("Free")){
				 int Dfee = Integer.parseInt(charge);
				 totalprice = totalprice+Dfee;
			 }
			 %>
			 
			       <p><strong>Delivery Charge</strong> Rs.<%=charge %>-</p> 
			       
			      
			       <p style="font-size: 20px;"><strong>Total Charge:</strong> Rs.<%=totalprice %>/- ONLY </p>
			      
			        
			      
			    </div>
			  </div>
			  <%
	    	
	    	}//ifelse
	      
	      }%>
			  

    <!-- Footer Section Begin -->
     
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