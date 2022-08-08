<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ include file="../inc/clientSideA.jsp" %>
<link rel="stylesheet" href="${ctx}/css/clientMain.css">
<div class="demo-slider">
  <div class="slide-item"><img src="${ctx}/img/001.jpg" alt="slider1"></div>
  <div class="slide-item"><img src="${ctx}/img/002.jpg" alt="slider2"></div>
  <div class="slide-item"><img src="${ctx}/img/003.jpg" alt="slider3"></div>
  <div class="slide-item"><img src="${ctx}/img/004.jpg" alt="slider4"></div>
</div>
<div class="main-card" id="top">
            <!-- <h2>B E S T</h2> -->
            <div class="wrapper">
                <h2>게임 BEST</h2>
                <div class="carousel">
                    <div>
	                    <div class="slide">
	                        <div class="slideImg">
	                            <a class="card-img" href="#">
							      <img src="${ctx}/img/100.png">
							    </a>
	                        </div>
	                    </div>
                        <div>
						    <p>리그 오브 레전드</p>
						    <p>라이엇게임즈 / 43.58%</p>
						</div>
					</div>
					<div>
	                    <div class="slide">
	                        <div class="slideImg">
	                            <a class="card-img" href="#">
							      <img src="${ctx}/img/200.png">
							    </a>
	                        </div>
	                    </div>
                        <div>
						    <p>FIFA 온라인 4</p>
						    <p>넥슨 / 11.55%</p>
						</div>
					</div>
					<div>
	                    <div class="slide">
	                        <div class="slideImg">
	                            <a class="card-img" href="#">
							      <img src="${ctx}/img/300.png">
							    </a>
	                        </div>
	                    </div>
                        <div>
						    <p>로스트아크</p>
    						<p>스마일게이트	 / 7.04%</p>
						</div>
					</div>
					<div>
	                    <div class="slide">
	                        <div class="slideImg">
	                            <a class="card-img" href="#">
							      <img src="${ctx}/img/400.jpg">
							    </a>
	                        </div>
	                    </div>
                        <div>
						    <p>서든어택</p>
    						<p>넥슨 / 6.18%</p>  
						</div>
					</div>
                </div>
            </div>
        </div>
	<div class="BestMenu" id="top">
            <!-- <h2>B E S T</h2> -->
            <div class="wrapper">
                <h2>인기 메뉴</h2>
                <div class="carousel">

                    <div class="slide">
                        <div class="slideImg">
                            <img src="${ctx}/img/떡볶이.jpg">
                            <div class="ex">
                                <div class="menu">
                                    <p>
                                        메뉴명: 떡볶이<br>
                                        가격 : 5,000 원</p>
                                </div>
                                <div class="gocart">
                                    <a href="#">
                                        <i class="fas fa-cart-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="slide">
                        <div class="slideImg">
                            <img src="${ctx}/img/떡볶이2.jpg">
                            <div class="ex">
                                <div class="menu">
                                    <p>
                                        메뉴명: 떡볶이<br>
                                        가격 : 5,000 원</p>
                                </div>
                                <div class="gocart">
                                    <a href="#">
                                        <i class="fas fa-cart-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="slide">
                        <div class="slideImg">
                            <img src="${ctx}/img/라면.jpg">
                            <div class="ex">
                                <div class="menu">
                                    <p>
                                        메뉴명: 떡볶이<br>
                                        가격 : 5,000 원</p>
                                </div>
                                <div class="gocart">
                                    <a href="#">
                                        <i class="fas fa-cart-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="slide">
                        <div class="slideImg">
                            <img src="${ctx}/img/치킨.jpg">
                            <div class="ex">
                                <div class="menu">
                                    <p>
                                        메뉴명: 떡볶이<br>
                                        가격 : 5,000 원</p>
                                </div>
                                <div class="gocart">
                                    <a href="#">
                                        <i class="fas fa-cart-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="slide">
                        <div class="slideImg">
                            <img src="${ctx}/img/hotdog.jpg">
                            <div class="ex">
                                <div class="menu">
                                    <p>
                                        메뉴명: 떡볶이<br>
                                        가격 : 5,000 원</p>
                                </div>
                                <div class="gocart">
                                    <a href="#">
                                        <i class="fas fa-cart-plus"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>


<script src="${ctx}/js/clientMain.js"></script>
<script src="${ctx}/js/clientFoodMain.js"></script>
    
<!-- clientSide 밑부분 -->
<%@ include file="../inc/clientSideB.jsp" %>
