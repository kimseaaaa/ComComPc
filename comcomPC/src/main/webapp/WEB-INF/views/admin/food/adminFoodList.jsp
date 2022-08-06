<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
   
<!-- adminSide -->
<%@ include file="../../inc/adminSideA.jsp" %>
<!-- adminHeader -->
<%@ include file="../../inc/adminHeader.jsp" %>

<link rel="stylesheet" href="${ctx}/css/list.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function(){
	 	if(${msg != null}){
			 alert("${msg}");
		} 
	});
</script>

<div class="container">
	<div class="listcontainer">
	    <h1>음식리스트</h1>
	    <div>
	        <div class="topbar">
	        	<div class="topbtns" >
	        		<a href="adminFoodAdd.do" class="addbtn">음식 추가</a>
		           	<a href="amdinFoodBest.do" class="addbtn">BEST</a>
	            </div>
	            <div class="wrap">
	                <form method="post" name="SearchForm" action="<c:url value='/adminFoodSearch.do'/>">
	                    <div class="search">
	                        <input type="text" class="searchTerm" name="keyword" placeholder="음식명을 입력해주세요.">
	                        <button type="submit" class="searchButton">
	                            <i class="fa fa-search"></i>
	                        </button>
	                    </div>
	                </form>
	            </div>
	        </div>
	
	        <table class="table">
	            <thead>
	                <tr>
	                    <th>코드</th>
	                    <th>음식명</th>
	                    <th>이미지</th>
	                    <th>카테고리</th>
	                    <th>가격</th>
	                    <th class="dmbtn">수정/삭제</th>
	                </tr>
	            </thead>
	            <tbody>
	                <c:forEach var="FoodList" items="${list}">
	                    <tr>
	                        <td>${FoodList.fcode}</td>
	                        <td><a style="font-weight: bold;"  href="adminFoodView.do?fcode=${FoodList.fcode}">${FoodList.fname}</a></td>
	                        <td>
	                            <img src="<c:out value='${ctx}/FoodImg/${FoodList.fimg}'/>" />
	                        </td>
	                        <td>${FoodList.fcat}</td>
	                        <td>
	                            <fmt:formatNumber value="${FoodList.fpri}" type="currency" />
	                        </td>
	                        <td>
	                            <div class="delmodbtn">
	                                <div class="mod">
	                                    <a href="adminFoodView.do?fcode=${FoodList.fcode}"
	                                        class="modbtn">수정</a>
	                                </div>
	                                <div class="del">
	                                    <a href="adminFoodDel.do?fcode=${FoodList.fcode}&fimg=${FoodList.fimg}"
	                                    class="delbtn" id="delbtn">삭제</a>
	                                </div>
	                            </div>
	                        </td>
	                    </tr>
	                </c:forEach>
	            </tbody>
	        </table>
	    </div>
	</div>
</div>	

<%@ include file="../../inc/adminSideB.jsp" %>