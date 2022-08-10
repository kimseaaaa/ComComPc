<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%-- <fmt:parseDate var="parseRegDate" value="${rs.regDt}" pattern="yyyy-MM-dd"/>

<fmt:formatDate var="resultRegDt" value="${parseRegDate}" pattern="yyyy-MM-dd"/>
${resultRegDt}
 --%>
<%@ include file="../inc/clientSideA.jsp" %>  

<link rel="stylesheet" href="${ctx}/css/clientChat.css">

<div class="chat">
    <section class="msger" id="msger">
        <main class="msger-chat" id="msger-chat">
		<c:forEach var="list" items="${list}">
			<c:if test="${list.cfrom eq id}">
	            <div class="msg right-msg">
	                <div class="msg-bubble">
	                    <div class="msg-info">
	                        <div class="msg-info-name">${list.seatnum}</div>
	                        <div class="msg-info-time"><fmt:formatDate value="${list.cdate}" pattern="yy-MM-dd KK:mm"/></div>
	                    </div>
	                    <div class="msg-text">
	                        ${list.ccontent}
	                    </div>
	                </div>
	            </div>
            </c:if>
            <c:if test="${list.cto eq id}">
            	<div class="msg left-msg">
                <div class="msg-bubble">
                    <div class="msg-info">
                        <div class="msg-info-name">관리자</div>
                        <div class="msg-info-time"><fmt:formatDate value="${list.cdate}" pattern="yy-MM-dd KK:mm"/></div>
                    </div>
                    <div class="msg-text">
                        ${list.ccontent}
                    </div>
                </div>
            </div>
            </c:if>
            
		</c:forEach>
        </main>
        <form class="msger-inputarea" method="post" action="<c:url value='/clientChatSend.do'/>">
        	<input type="hidden" name="">
            <input type="text" class="msger-input" placeholder="내용을 입력하세요." name="ccontent">
            <button type="submit" class="msger-send-btn">보내기</button>
        </form>
    </section>
</div>

<script type="text/javascript">
	var myDiv = document.getElementById("msger-chat");
	myDiv.scrollTop = myDiv.scrollHeight;
</script>

<%@ include file="../inc/clientSideB.jsp" %>