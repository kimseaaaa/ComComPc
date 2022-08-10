<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${ctx}/css/clientLogin.css">

<script type="text/javascript">
$(document).ready(function(){
	if(${msg != null}){
		alert("${msg}");
	}	  
	<c:remove var="msg" scope="session"/>
	
	<!-- 변경되는지 확인필요 --> 
	$('.seat-num').text("${seatnum}");
});
</script>

<div class="seat-num">
  
</div>

<div class="login-box">
    <form>
      <div class="user-box">
        <p> 남은 금액</p>
        <span> 100,000 원</span>
      </div>
    
      <div class="user-btn">
        <a href="client_charge.html">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            충전하기
        </a>
        <a href="clientMain.do">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            시작하기
        </a>
    </div>
    </form>
  </div>