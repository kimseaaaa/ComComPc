<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
    
<%@ include file="../../inc/adminSideA.jsp" %>
<link rel="stylesheet" href="${ctx}/css/adminChat.css">

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

<div class="chat">
<section class="msger">  
    <main class="msger-chat" id="msger-chat">
    	<c:forEach var="list" items="${list}">
    		<c:if test="${list.cto eq id}">
    			<div class="msg right-msg">
			        <div class="msg-bubble">
			          <div class="msg-info">
			            <div class="msg-info-name">관리자</div>
			            <div class="msg-info-time"><fmt:formatDate value="${list.cdate}" pattern="${list.cdate>=yesterday ? 'HH:mm' : 'yyyy-MM-dd'}"/></div>
			          </div>
			          <div class="msg-text">
			          	${list.ccontent}
			          </div>
			        </div>
		        </div>
	        </c:if>
         	<c:if test="${list.cfrom eq id}">
	         	<div class="msg left-msg">
	         		<div class="msg-bubble">
	         			<div class="msg-info">
	         				<div class="msg-person">
		         				<div class="msg-seatnum">${list.seatnum}</div>
		         				<div class="msg-info-name">${list.cfrom}</div>
	            			</div>
	            			<div class="msg-info-time"><fmt:formatDate value="${list.cdate}" pattern="${list.cdate>=yesterday ? 'HH:mm' : 'yyyy-MM-dd'}"/></div>
	           			</div>
	           			<div class="msg-text">
	           				${list.ccontent}
	       				</div>
	   				</div>
				</div>
		</c:if>
	</c:forEach>
	</main>
	
		
    <form class="msger-inputarea" method="post" action="<c:url value='/adminChatSend.do'/>">
      <input type="text" class="msger-input" name="ccontent" placeholder="내용을 입력하세요.">
      <input type="hidden" name="cto" value=${id}>
      <button type="submit" class="msger-send-btn">보내기</button>
    </form>
  </section>
</div>

<script type="text/javascript">
	var myDiv = document.getElementById("msger-chat");
	myDiv.scrollTop = myDiv.scrollHeight;
</script>
  
  
<%@ include file="../../inc/adminSideB.jsp" %>