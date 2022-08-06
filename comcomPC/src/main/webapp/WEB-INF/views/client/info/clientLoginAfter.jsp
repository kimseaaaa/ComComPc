<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<link rel="stylesheet" href="${ctx}/css/clientLogin.css">

<div class="seat-num">
    72
</div>

<div class="login-box">
    <h2>Login</h2>

    <form>
      <div class="user-box">
        <input type="text" name="" required="">
        <label>아이디</label>
      </div>
      <div class="user-box">
        <input type="password" name="" required="">
        <label>비밀번호</label>
      </div>
      <div class="user-btn">
        <!-- <a href="client_front.html"> -->
        <a href="clientLoginOk.do">
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