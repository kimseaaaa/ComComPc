<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     
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
        <div class="search">
          <input type="text" class="searchTerm" placeholder="What are you looking for?">
          <button type="submit" class="searchButton">
            <i class="fa fa-search"></i>
          </button>
        </div>
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
        <tr>
          <td>dahae</td>
          <td>30</td>
          <td>16:09</td>
          <td>신라면</td>
          <td>3</td>
          <td class="delmodbtn">
            <a href="" class="modbtn">전달</a>
          </td>
        </tr>

        <tr>
          <td>dahae</td>
          <td>30</td>
          <td>16:09</td>
          <td>아이스티</td>
          <td>3</td>
          <td class="delmodbtn">
            <a href="" class="modbtn">전달</a>
          </td>
        </tr>
        <tr>
          <td>dahae</td>
          <td>30</td>
          <td>11:09</td>
          <td>공기밥</td>
          <td>3</td>
          <td class="delmodbtn">
            <a href="" class="modbtn">전달</a>
          </td>
        </tr>
        <tr>
          <td>dahae</td>
          <td>30</td>
          <td>3:09</td>
          <td>진라면</td>
          <td>3</td>
          <td class="delmodbtn">
            <a href="" class="modbtn">전달</a>
          </td>
        </tr>

        <tr>
          <td>dahae</td>
          <td>30</td>
          <td>2022-07-16 </td>
          <td>신라면</td>
          <td>3</td>
          <td class="delmodbtn">완료 </td>
        </tr>

        <tr>
          <td>dahae</td>
          <td>30</td>
          <td>2022-06-26 16:09</td>
          <td>신라면</td>
          <td>3</td>
          <td class="delmodbtn">완료 </td>
        </tr>
      </tbody>
    </table>
    </div>
</div>
</div>
<%@ include file="../../inc/adminSideB.jsp" %>