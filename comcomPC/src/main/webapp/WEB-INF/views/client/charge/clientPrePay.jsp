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
});

function pay() {

	document.getElementById("money").value = ${money};
	document.form_money.submit();
};

</script>

<!-- <div class="login-box charge-box">
    <form>
      <div class="user-btn">
        <a href="clientPayOk.do">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            결제하기
        </a>
        <a href="clientCharge.do">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            이전
        </a>
    </div>
   </form>
 </div> -->
 
<div class="login-box">
    <form name="form_money" action="clientPayOk.do?pre=pre" method="post">
      <div class="user-box">
        <p> 결제API</p>
          <span id="pay_money">${money}</span>
         <input type="hidden" id="money" name="money" class="money"/>
      </div>
    
      <div class="user-btn">
      	<a onclick="pay()">
        <!-- <a href="clientPayOk.do"> -->
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            결제하기
        </a>
        <a href="clientCharge.do">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            이전
        </a>
    </div>
   </form>
  </div>
