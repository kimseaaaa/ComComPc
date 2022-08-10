<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!-- clientSide -->
<%@ include file="../../inc/clientSideA.jsp" %>


<link rel="stylesheet" href="${ctx}/css/clientLogin.css">


<div class="login-box">
    <form>

      <div class="user-btn">
        <a href="clientFoodPayOk.do">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            결제하기
        </a>
        <a href="clientFoodMain.do">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            뒤로가기
        </a>
    </div>
    </form>
  </div>



<!-- clientSide 밑부분 -->
<%@ include file="../../inc/clientSideB.jsp" %>
    