<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!-- clientSide -->
<%@ include file="../inc/clientSideA.jsp" %>

<script src="${ctx}/js/clientFoodMain.js"></script>

<script type="text/javascript">
///주문정보!

</script>


<link rel="stylesheet" href="${ctx}/css/clientFoodMain.css">

	<div class="FoodMain">
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
			                                <a href="javascript:void(0);" data-value="${menu.fcode}" onclick="cartadd(this)">
			                                    <!-- clientCartAdd.do?orderfoodcode=${menu.fcode} -->
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
	                                <a href="javascript:void(0);" data-value="${menu.fcode}" onclick="cartadd(this)">
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
	                                <a href="javascript:void(0);" data-value="${menu.fcode}" onclick="cartadd(this)">
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
	                                <a href="javascript:void(0);" data-value="${menu.fcode}" onclick="cartadd(this)">
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
                  <c:set var="totpri" value="0" />
                    <ul class="orderlist">
                    	<c:if test="${focart.size()!=0}">
                    	
                    	
	                    	<c:forEach var="fodto" items="${focart}">
	                    	
		                        <li class="list">
		                            <div class="ordermenu">
		                            
		                                <div style="margin-left: 0px;margin-right: 10px;font-size:13px ;line-height: 20px;">
		                            		<a href="javascript:void(0);" data-value="${fodto.value.fcode}" style="color:#cdcdcd;" onclick="cartminus(this)"><i class="fa fa-minus-square"></i></a>
		                            	</div>
		                                
		                            	
		                                <div class="qty">
		                                 ${fodto.value.fodqty}
		                                </div>
		                                
		                                  <div style="margin-left: 10px;margin-right: 20px;font-size:13px;line-height: 20px;">
		                            		<a href="javascript:void(0);" data-value="${fodto.value.fcode}" style="color:#cdcdcd;" onclick="cartadd(this)">
		                            			<i class="fa fa-plus-square"></i>
		                            		</a>
		                            	</div>
		                            	
		                                <div class="name">
		                                    ${fodto.value.fname} 
		                                </div>
		                                
		                            </div>
		                            <div class="money">
		                            <input type="hidden" value="${fodto.value.fodpri}" class="pri"/>
		                               ${fodto.value.fodpri} 원
		                               
		                               <a "javascript:void(0);" data-value="${fodto.value.fcode}" style="margin-left: 10px;color:rgb(237, 91, 91);" onclick="cartDelete(this)"><i class="fa fa-times"></i></a>
		                            </div>
		                        </li>
		                        <c:set var="totpri" value="${totpri+fodto.value.fodpri}" />
	                    	</c:forEach>
	                    	
	                    	<!-- ajax가 넣어져야해!!! -->
                    	</c:if>
                        
                    </ul>
                </div>

                <div class="totalbox">
                    <div class="side-btn totalMoney">
                        <div> 총 결제금액</div>
                        <div class="Money"> ${totpri} 원</div>
                    </div>
                    <div class="side-btn payMoney">
                        <input value="결제하기" class="btnPay"/>
                    </div>
                </div>
            </div>
        </div> 
    </div>


    
<!-- clientSide 밑부분 -->
<%@ include file="../inc/clientSideB.jsp" %>
    
  	                            