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

</script>

<div class="seat-num">
    72
</div>

<div class="login-box">
    <form>
      <div class="user-box">

        <p> 남은 시간</p>
        <span>${timefront}</span>
      </div>
    
      <div class="user-btn">
        <a href="clientPreCharge.do">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            충전하기
        </a>
        <a onclick="timezeroOk()">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            시작하기
        </a>
    </div>
    </form>
  </div>
  
<script type="text/javascript">
function timezeroOk() {
	
	//var time = document.getElementById("time").value;
	var time = '${timefront}';
	
	//alert("[clientSideB.jsp][timezeroOk()] time : " + time);
	
	if(time == "00:00"){
		
		alert("잔여시간이 없습니다. 충전해 주세요.");
		location.href = "clientPreCharge.do";
	} else {
		
		location.href = "clientStart.do";
	}
};
</script>
  

 
