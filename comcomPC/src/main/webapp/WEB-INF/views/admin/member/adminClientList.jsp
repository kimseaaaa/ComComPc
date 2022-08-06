<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
   
<!-- adminSide -->
<%@ include file="../../inc/adminSideA.jsp" %>

<!-- adminHeader -->
<%@ include file="../../inc/adminHeader.jsp" %>

<link rel="stylesheet" href="${ctx}/css/list.css">

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<div class="container">
<div class="listcontainer">
  <h1>회원 관리</h1>
  <div>
    <div class="topbar">
      <div class="wrap">
       <form method="post" name="SearchForm" action="<c:url value='/adminClientSearch.do'/>">
        <div class="search">
            <input type="text" name="keyword" class="searchTerm" placeholder="아이디를 입력해주세요.">
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
          <th>아이디</th>
          <th>비밀번호</th>
          <th>생년월일</th>
          <th>전화번호</th>
          <th class="dmbtn" >수정/삭제</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="cldto" items="${clientlist}">
        <tr>
          <td>${cldto.id}</td>
          <td>${cldto.pw}</td>
          <td>${cldto.birth}</td>
          <td>${cldto.tel}</td>
          <td>
               <div class="delmodbtn">
                 <div class="mod"><a href="adminClientView.do?id=${cldto.id}" class="modbtn">수정</a></div>
                 <div class="del"><a href="adminClientDel.do?id=${cldto.id}" class="delbtn">삭제</a></div>
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