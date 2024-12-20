<%@page import="com.example.superhim.pojo.SignUpPojo"%>
<%@page import="java.util.List"%>
<%@page import="com.example.superhim.dao.CustomerSignupDao"%>
<%@page import="com.example.superhim.dao.CartDao"%>
<%@page import="com.example.superhim.GetApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__left">
                            <%	
                            	ApplicationContext headerApplicationContext = GetApplicationContext.getApplicationContext();
                                CartDao bean = headerApplicationContext.getBean(CartDao.class);
                                CustomerSignupDao csd = headerApplicationContext.getBean(CustomerSignupDao.class);
                            	List <SignUpPojo> listHeader = csd.GetUserData(loginData.get(0), loginData.get(1));
                            	/* SignUpPojo snpHeader = listHeader.get(0);*/
                            	String fullnameUser = "";
                            	System.out.println("-------------------------------------------");
                            	System.out.println(fullnameUser);
                            	System.out.println(loginData.get(0));
                            	for ( SignUpPojo supojo:listHeader){
                            		fullnameUser = supojo.getFullname();
                            		supojo.getMobile();
                            		
                            	}
                                                       %>
                            <ul>
                                <li><i class="fa fa-envelope"></i> hello@uietMDU.com</li>
                                <li>Free Shipping for all Order of RS.200</li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right" style="box-sizing: border-box; display:flex;
                        justify-content: space-around;">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <!-- <img src="img/language.png" alt=""> -->
                                <div><i class="fa fa-user"></i><%=fullnameUser%></div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li id="order-hover"><a href="#" style="position: relative;"><i class="fa fa-shopping-bag"></i>Order</a>
                                        <div class="header__top__right__language " id="order_opt">
                                            <!-- <img src="img/language.png" alt=""> -->
                                            <ul class="header__top__right__language"> 
                                                <li><a href="customerorderhistory.jsp?status=NO">Arriving</a></li>
                                                <li><a href="customerorderhistory.jsp?status=Yes">delivered</a></li>
                                            </ul>
                                            
                                        </div>
                                    </li>
                                    <script>
                                        const order_opt = document.querySelector("#order_opt")
                                        const order_hover = document.querySelector("#order-hover")
                                        order_hover.addEventListener("mouseover", func, false);
                                        order_hover.addEventListener("mouseout", func1, false);

                                        function func1()
                                        {  
                                            order_opt.style.display= "none";
                                        }
                                        function func()
                                        {  
                                            order_opt.style.display= "block";
                                        }

                                    </script>
                                    <%	
                                    
                                    String name = ""; 
                                    String[] s =  fullnameUser.split(" ");
                                    name = s[0];
                                    	
                                    %>
                                    
                                    <li><a href="#"><i class="fa fa-user"></i><%=name%></a></li>
                                    <li><a href="logout.jsp"><i class="fa fa-user"></i>Logout</a></li>
                                </ul>
                            </div>
                            <div class="header__top__right__auth" style=" display:flex; box-sizing: border-box;">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">
                        <a href="./home.jsp"><img style="height: 60px;" src="img/shopping-bag.png" alt="" ></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active">
                            <a href="./home.jsp">Home</a></li>
                            <li><a href="./shop-grid.jsp">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="./product-details.jsp">Shop Details</a></li>
                                    <li><a href="./cart.jsp">Shoping Cart</a></li>
                                    <li><a href="./checkout.jsp">Check Out</a></li>
                                </ul>
                            </li>
                            <li><a href="./blog.jsp">Blog</a></li>
                            <li><a href="./contact.jsp">Contact</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <ul><!-- 
                            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li> -->
                            
                            <li><a href="cart.jsp"><i class="fa fa-shopping-bag"></i> <span><%=bean.UpdateCartValue(loginData.get(0), loginData.get(1)) %></span></a></li>
                        </ul>
                        <div class="header__cart__price">item: <span>$150.00</span></div>
                    </div>
                </div>
            </div>
            <div class="humberger__open">
                <i class="fa fa-bars"></i>
            </div>
        </div>
    </header>