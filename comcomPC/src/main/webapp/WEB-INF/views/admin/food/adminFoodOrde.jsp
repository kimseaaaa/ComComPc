<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
   
<!-- adminSide -->
<%@ include file="../../inc/adminSideA.jsp" %>

<link rel="stylesheet" href="${ctx}/css/list.css">

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<div class="container">
<div class="listcontainer">
  <h1>음식 주문 리스트</h1>
  <div>
    <div class="topbar">
      <div class="wrap">
        <form class="search" action="adminOrderSearch.do">
          <input type="text" class="searchTerm" name="ordersearch" placeholder="좌석번호 또는 아이디를 입력하세요">
          <button type="submit" class="searchButton">
            <i class="fa fa-search"></i>
          </button>
        </form>
      </div>
    </div> 

    <table class="table">
      <thead>
        <tr>
          <th>아이디</th>
          <th>좌석번호</th>
          <th>주문시간</th>
          <th>매뉴명</th>
          <th>수량</th>
          <th class="dmbtn" >확인</th>
        </tr>
      </thead>
      <tbody>
        <%
        SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");         
    	SimpleDateFormat MM = new SimpleDateFormat("MM");         
    	SimpleDateFormat dd = new SimpleDateFormat("dd");   
    	SimpleDateFormat HH = new SimpleDateFormat("hh");
    	SimpleDateFormat mm = new SimpleDateFormat("mm");
    	Date now = new Date();        
    	String nowday = yyyy.format(now.getTime())+"-"+ MM.format(now.getTime())+"-"+ dd.format(now.getTime()) +" 00:00:00";
   		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        Date now0 = sdf.parse(nowday);
      %>
      <c:set var="yesterday" value="<%=now0%>" />
      <c:forEach var="fodto" items="${folist}">
        <tr>
          <td>${fodto.fodid}</td>
          <td>${fodto.seatnum}</td>
          <td><fmt:formatDate value="${fodto.foddate}" pattern="${fodto.foddate>=yesterday ? 'HH:mm' : 'yyyy-MM-dd'}"/></td>
          <td>${fodto.fname}</td>
          <td>${fodto.fodqty}</td>
          <td class="delmodbtn">
            <a href="adminOrderOk.do?l=l&fodcode=${fodto.fodcode}" class="modbtn">전달</a>
          </td>
        </tr>
      </c:forEach>

		<c:forEach var="fodto" items="${endfolist}">
		       <tr>
		         <td>${fodto.fodid}</td>
		         <td>${fodto.seatnum}</td>
		         <td><fmt:formatDate value="${fodto.foddate}" pattern="${fodto.foddate>=yesterday ? 'HH:mm' : 'yyyy-MM-dd'}"/></td>
		         <td>${fodto.fname}</td>
		         <td>${fodto.fodqty}</td>
		         <td class="delmodbtn">완료 </td>
		       </tr>
		   </c:forEach>

      </tbody>
    </table>
    </div>
</div>
</div>
<%@ include file="../../inc/adminSideB.jsp" %>