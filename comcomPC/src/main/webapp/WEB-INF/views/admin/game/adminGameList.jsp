<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
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
  <h1>게임리스트</h1>
  <div>
    <div class="topbar">
      <a href="adminGameAdd.do" class="addbtn">게임추가</a>
      <form class="wrap" id="searchform" action="adminGameSearch.do">
        <div class="search">
          <input type="text" class="searchTerm" placeholder="게임명을 입력해주세요." name="gname">
          <button type="submit" class="searchButton">
            <i class="fa fa-search"></i>
          </button>
        </div>
      </form>
    </div> 

    <table class="table">
      <thead>
        <tr>
          
          <th>카테고리</th>
          <th>이미지</th>
          <th>게임명</th>
          <th>유통사</th>
          <th>유료/무료</th>
          <th>최근 업데이트일</th>
          <th class="dmbtn" >수정/삭제</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach var="gdto" items="${gamelist}">
        <tr>
          <td>${gdto.gcat}</td>
          <td>
            <!-- <img src="Lost_Ark.png"> -->
           <%--  <img src="<c:out value='/gameimg/${gdto.gimg}'/>"/> --%>
            <img src="${ctx}/gameimg/${gdto.gimg}"/>
          </td>
          <td><a style="font-weight: bold;"  href="adminGameView.do?gcode=${gdto.gcode}">${gdto.gname}</a></td>
          <td>${gdto.gcomp}</td>
          <td>${gdto.gfee}</td>
          <td>
          	<fmt:formatDate value="${gdto.gupdate}" pattern="yyyy-MM-dd"/>
          </td>
          <td>
               <div class="delmodbtn">
                 <div class="mod">
                 	<a href="adminGameView.do?gcode=${gdto.gcode}" class="modbtn">수정</a>
                 </div>
                 <div class="del"><a href="adminGameDel.do?gcode=${gdto.gcode}&gimg=${gdto.gimg}" class="delbtn">삭제</a></div>
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