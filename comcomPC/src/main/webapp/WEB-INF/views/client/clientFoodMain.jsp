<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!-- clientSide -->
<%@ include file="../inc/clientSideA.jsp" %>

<!-- FoodMain에 속한 slick

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
	<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
 
 -->

<link rel="stylesheet" href="${ctx}/css/clientFoodMain.css">

	<div class="FoodMain">
        <!-- 메뉴이동 hashtag -->
        <!-- <div class="nav" id="top">
            <div class="hashtag"><a href="#drink">#음료</a></div>
            <div class="hashtag"><a href="#snack">#스낵</a></div>
            <div class="hashtag"><a href="#meal">#식사</a></div>
        </div>  -->

        <!-- 사이드 nav 메뉴로 가는 버튼  -->
        <div class="moveBtn">
            <div class="moveToBtn">
                <a href="#top">Top</a>
            </div>
            <div class="moveToBtn">
                <a href="#drink">음료</a>
            </div>
            <div class="moveToBtn">
                <a href="#snack">스낵</a>
            </div>
            <div class="moveToBtn">
                <a href="#meal">식사</a>
            </div>
            <div class="moveToBtn">
                <a href="#cart-list">Cart</a>
            </div>
        </div>

        <!-- BestMenu slick -->
        <div class="BestMenu" id="top">
            <!-- <h2>B E S T</h2> -->
            <div class="wrapper">
                <h2>B E S T<h2>
                <div class="carousel">
                	<c:forEach var="menu" items="${MenuList}">
	               		<c:if test="${menu.fbest eq 1}">
		               		<div class="slide">
			               		<div class="slideImg">
		                             <img src="<c:out value='${ctx}/FoodImg/${menu.fimg}'/>" />
		                             <div class="ex">
		                             	<div class="menuInfo">
	                            			<div class="menu-name">메뉴명: ${menu.fname}</div>
	                            			<div class="menu-pri">가격 : <fmt:formatNumber value="${menu.fpri}" type="currency" /> 원</div>
	                           			</div>
		                            	<div class="go-cart">
			                                <a href="#">
			                                    <i class="fas fa-cart-plus"></i>
			                                </a>
		                            	</div>
	                                </div>
	                            </div>
                            </div>
	               		</c:if>
               		</c:forEach>
           		</div>
            </div>
        </div>

        <!-- menu -->
        <div class="main-menu">
        
        	<!-- menu 음료 -->
            <div class="menu-list drink" id="drink">
            	<h2>음료</h2>
                <ul>
               	<c:forEach var="menu" items="${MenuList}">
               		<c:if test="${menu.fcat eq '음료'}">
	                	<li class="menu-card">
	                		<div class="menu-img">
	                            <img src="<c:out value='${ctx}/FoodImg/${menu.fimg}'/>" />
	                        </div>
	                        <div class="line">
	                        </div>
	                        <div class="menu-ex">
	                            <div class="menuInfo">
	                            	<div class="menu-name">메뉴명: ${menu.fname}</div>
	                            	<div class="menu-pri">가격 : <fmt:formatNumber value="${menu.fpri}" type="currency" /> 원</div>
	                            </div>
	                            <div class="go-cart">
	                                <a href="#">
	                                    <i class="fas fa-cart-plus"></i>
	                                </a>
	                            </div>
	                        </div>
	                    </li>
                    </c:if>
               	</c:forEach>
                </ul>
            </div>
            <!--음료 메뉴-->

            <!-- menu 스낵 -->
            <div class="menu-list sanck" id="snack">
                <h2>스낵</h2>
                <ul>
                <c:forEach var="menu" items="${MenuList}">
               		<c:if test="${menu.fcat eq '스낵'}">
	                	<li class="menu-card">
	                		<div class="menu-img">
	                            <img src="<c:out value='${ctx}/FoodImg/${menu.fimg}'/>" />
	                        </div>
	                        <div class="line">
	                        </div>
	                        <div class="menu-ex">
	                            <div class="menuInfo">
	                            	<div class="menu-name">메뉴명: ${menu.fname}</div>
	                            	<div class="menu-pri">가격 : <fmt:formatNumber value="${menu.fpri}" type="currency" /> 원</div>
	                            </div>
	                            <div class="go-cart">
	                                <a href="#">
	                                    <i class="fas fa-cart-plus"></i>
	                                </a>
	                            </div>
	                        </div>
	                    </li>
                    </c:if>
               	</c:forEach>
                </ul>
            </div>
            <!--스낵 메뉴-->

            <!-- menu 식사 -->
            <div class="menu-list meal" id="meal">
                <h2>식사</h2>
                <ul>
                <c:forEach var="menu" items="${MenuList}">
               		<c:if test="${menu.fcat eq '식사'}">
	                	<li class="menu-card">
	                		<div class="menu-img">
	                            <img src="<c:out value='${ctx}/FoodImg/${menu.fimg}'/>" />
	                        </div>
	                        <div class="line">
	                        </div>
	                        <div class="menu-ex">
	                            <div class="menuInfo">
	                            	<div class="menu-name">메뉴명: ${menu.fname}</div>
	                            	<div class="menu-pri">가격 : <fmt:formatNumber value="${menu.fpri}" type="currency" /> 원</div>
	                            </div>
	                            <div class="go-cart">
	                                <a href="#">
	                                    <i class="fas fa-cart-plus"></i>
	                                </a>
	                            </div>
	                        </div>
	                    </li>
                    </c:if>
               	</c:forEach>
                </ul>
            </div> 
            <!--식사 메뉴-->
            
        </div> 
        <!--main-menu-->

        <div class="cartline"></div>

        <!-- cartList -->
        <div class="cart-list" id="cart-list">
            <h2> < 주문 목록 > </h2>
            <div class="request">
                <div class="orderbox">
                    <ul class="orderlist">
                        <li class="list">
                            <div class="ordermenu">
                                <div class="name">
                                    짜파게티 
                                </div>
                                
                                <div class="qty">
                                x 3
                                </div>
                            </div>
                            <div class="money">
                                15,000원
                            </div>
                        </li>
                        <li class="list">
                            <div class="ordermenu">
                                <div class="name">
                                    아이스아메리카노 
                                </div>
                                <div class="qty">
                                x 1
                                </div>
                            </div>
                            <div class="money">
                                4,500원
                            </div>
                        </li>
                        <li class="list">
                            <div class="ordermenu">
                                <div class="name">
                                    와사비맛 아몬드 
                                </div>
                                <div class="qty">
                                x 2
                                </div>
                            </div>
                            <div class="money">
                                4,400원
                            </div>
                        </li> 
                        
<!--                         <li class="list">
                            <div class="ordermenu">
                                <div class="name">
                                    와사비맛 아몬드 
                                </div>
                                <div class="qty">
                                x 2
                                </div>
                            </div>
                            <div class="money">
                                4,400원
                            </div>
                        </li>
                        <li class="list">
                            <div class="ordermenu">
                                <div class="name">
                                    와사비맛 아몬드 
                                </div>
                                <div class="qty">
                                x 2
                                </div>
                            </div>
                            <div class="money">
                                4,400원
                            </div>
                        </li>
                        <li class="list">
                            <div class="ordermenu">
                                <div class="name">
                                    와사비맛 아몬드 
                                </div>
                                <div class="qty">
                                x 2
                                </div>
                            </div>
                            <div class="money">
                                4,400원
                            </div>
                        </li> -->
                        
                    </ul>
                </div>

                <div class="totalbox">
                    <div class="side-btn totalMoney">
                        <div> 총 결제금액</div>
                        <div class="Money"> 123,900 원</div>
                    </div>
                    <div class="side-btn payMoney">
                        <input value="결제하기" class="btnPay"/>
                    </div>
                </div>
            </div>
        </div> 


    </div>
    <!--FoodMain-->

    

<script src="${ctx}/js/clientFoodMain.js"></script>
    
<!-- clientSide 밑부분 -->
<%@ include file="../inc/clientSideB.jsp" %>
    
  
    
