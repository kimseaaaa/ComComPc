<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
   
<!-- adminSide -->
<%@ include file="../../inc/adminSideA.jsp" %>

<%
	SimpleDateFormat yyyy = new SimpleDateFormat("yyyy");         
	SimpleDateFormat MM = new SimpleDateFormat("MM");         
	SimpleDateFormat dd = new SimpleDateFormat("dd");         
	Date now = new Date();        
	String nowday = yyyy.format(now.getTime())+"-"+ MM.format(now.getTime())+"-"+ dd.format(now.getTime()) +" 00:00:00";
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	Date now0 = sdf.parse(nowday);
%>
<c:set var="yesterday" value="<%=now0%>" />


<link rel="stylesheet" href="${ctx}/css/list.css">

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<div class="listcontainer">
  <h1>메시지</h1>
  <div>
    <div class="topbar">
      <a href="adminChatIdList.do" class="addbtn">아이디</a>
      <a href="adminMsgMain.do" class="addbtn">좌석번호</a>
      <div class="wrap">
      	<form method="post" name="keyword" action="<c:url value='/adminChatSearch.do'/>">
      		<div class="search">
	          <input type="text" class="searchTerm" name="keyword" placeholder="아이디를 입력해주세요.">
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
          <th>좌석번호</th>
          <th>시간</th>
          <th>내용</th>
          <th>처리여부</th>
          <th class="dmbtn" >채팅방 이동</th>
        </tr>
      </thead>
      <tbody>   
      	<c:forEach var="list" items="${list}">
      		<c:if test="${list.cok==0 && list.cfrom ne '관리자'}">
      			<tr>
      				<td><a style="font-weight: bold" href="adminClientView.do?id=${list.cfrom}">${list.cfrom}</a></td>
		          	<td>${list.seatnum}</td>
		          	<td><fmt:formatDate value="${list.cdate}" pattern="${list.cdate>=yesterday ? 'HH:mm' : 'yyyy-MM-dd'}"/></td>
		          	<td>${list.ccontent}</td>
		          	<td>안읽음</td>
		          	<td>
			          	<div class="delmodbtn">
		          			<div class="mod">
			          			<a href="adminChat.do?cto=${list.cfrom}"class="modbtn">채팅방</a>
				         	</div>
				         </div>
			         </td>
		        </tr>
	        </c:if>
        </c:forEach>
        <c:forEach var="list" items="${list}">
        	<c:if test="${list.cok==1 || list.cfrom eq '관리자'}">
	        	<tr>	        
		          <td><a style="font-weight: bold" href="${list.cfrom eq '관리자' ? list.cto : list.cfrom}">${list.cfrom eq '관리자' ? list.cto : list.cfrom}</a></td>
		          <td>${list.seatnum}</td>
		          <td><fmt:formatDate value="${list.cdate}" pattern="${list.cdate>=yesterday ? 'HH:mm' : 'yyyy-MM-dd'}"/></td>
		          <td>${list.ccontent}</td>
		          <td>읽음</td>
		          <td>
		          	<div class="delmodbtn">
	          			<div class="mod">
		          			<a href="adminChat.do?cto=${list.cfrom eq '관리자' ? list.cto : list.cfrom}"class="modbtn">채팅방</a>
			         	</div>
			         </div>
		        </tr>
	        </c:if>
       	</c:forEach>
      </tbody>
    </table>
    </div>
</div>
<%@ include file="../../inc/adminSideB.jsp" %>