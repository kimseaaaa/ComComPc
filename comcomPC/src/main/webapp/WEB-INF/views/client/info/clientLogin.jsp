<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${ctx}/css/clientLogin.css">
<!-- 자바스크립트 파일 불러오기 -->
<script type="text/javascript" src="${ctx}/js/valid.js" charset="utf-8"></script>

<script type="text/javascript">
$(document).ready(function(){
	if(${msg != null}){
		alert("${msg}");
	}	  
	<c:remove var="msg" scope="session"/>
});
</script>

<div class="seat-num">
    72
</div>

<div class="login-box">
    <h2>Login</h2>

    <form action="clientLoginOk.do" method="post" name ="clientLoginForm">
      <div class="user-box">
        <input type="text" name="id" required="">
        <label>아이디</label>
      </div>
      <div class="user-box">
        <input type="password" name="pw" required="">
        <label>비밀번호</label>
      </div>
      <div class="user-btn">
        <!-- <a href="client_front.html"> -->
        <a onclick="clLoginChk()">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            로그인
        </a>
        <a href="clientJoin.do">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            회원가입
        </a>
    </div>
    </form>
  </div>