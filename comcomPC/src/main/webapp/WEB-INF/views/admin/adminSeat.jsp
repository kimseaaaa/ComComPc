<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!-- adminSide -->
<%@ include file="../inc/adminSideA.jsp" %>

<link rel="stylesheet" href="${ctx}/css/adminSeat.css">

<div class="seating-chart">

	<ul class="seats-container">
		<c:forEach var="sdto" items="${listseat}">
            <c:choose>
            <c:when test="${sdto.sid != null}">
            	<li class="seat occupy">
				    <div class="top">
				        <div class="seatnum">${sdto.seatnum}</div>
				        <%-- <div class="name" >${sdto.sid}</div> --%>
				        <a href="adminClientInfo.do" class="name" >${sdto.sid}</a>
				    </div>
				
				    <div class="mid">08 : 12</div>
				    <div class="bottom">
				        <a href="adminClientInfo.do"><i class="fas fa-user"></i></a>&nbsp;&nbsp;
				        <a href="adminChat.do"><i class="fas fa-comment-alt"></i></a>
				    </div>
				</li>
           	</c:when>
            <c:when test="${sdto.sfix == 1}">
            	<li class="seat fix">
	                <div class="top">
	                    <div>${sdto.seatnum}</div>
	                    <div></div>
	                </div>
	
	                <div class="mid"><a href="adminGameFixOk.do?seatnum=${sdto.seatnum}"><i class="fas fa-wrench"></i></a></div>
	
	                <div class="bottom">
	                    <a href=""></a>
	                </div>
           		</li>
           	</c:when>
            <c:otherwise>
	            <li class="seat unoccupied">
                <!-- <input type="radio" name="room-number" data-room-price="125" class="hide" value="101" />  -->
                <div class="top">
                    <div>${sdto.seatnum}</div>
                    <div></div>
                </div>

                <div class="mid"></div>

                <div class="bottom">
                    <a href="adminGameFix.do?seatnum=${sdto.seatnum}"><i class="fas fa-tools"></i></a>
                </div>
            </li>
            </c:otherwise>
        </c:choose>
		</c:forEach>
	</ul>
    </div>
    
<!-- adminSide 밑부분 -->
<%@ include file="../inc/adminSideB.jsp" %>
