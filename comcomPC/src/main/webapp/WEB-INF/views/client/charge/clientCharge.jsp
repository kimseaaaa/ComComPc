<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ include file="../../inc/clientSideA.jsp" %>
<link rel="stylesheet" href="${ctx}/css/clientLogin.css">

<div class="login-box charge-box">
    <form name="form_test" action="clientPay.do" method="post">
      <div class="user-box">
        <p>충전할 금액</p>
           	<span><input value=0 style="border:0; color: #00EDA3; font-size:30px; width:35%;" type="text" name="money" class="money" id="money" readonly>원</span>
      </div>
      <!-- <button class="money-b" type="submit" value="num1" href="#"><p>1,000 원</p></button>
      <button class="money-b" type="submit" value="num2" href="#"><p>3,000 원</p></button> 
      <button class="money-b" type="submit" value="num3" href="#"><p>10,000 원</p></button> <br/>
      <button class="money-b" type="submit" value="num4" href="#"><p>10,000 원</p></button>
      <button class="money-b" type="submit" value="num5" href="#"><p>50,000 원</p></button> -->
      
      <button class="money-b" type="button" value=1000 onclick="add(this)"><p>1,000 원</p></button>
      <button class="money-b" type="button" value=3000 onclick="add(this)"><p>3,000 원</p></button>
      <button class="money-b" type="button" value=5000 onclick="add(this)"><p>5,000 원</p></button><br/>
      <button class="money-b" type="button" value=10000 onclick="add(this)"><p>10,000 원</p></button>
      <button class="money-b" type="button" value=50000 onclick="add(this)"><p>50,000 원</p></button>
      <button class="money-b" type="button" value=100000 onclick="add(this)"><p>100,000 원</p></button>
    
      <div class="user-btn">
        <a onclick="document.form_test.submit();">
        <!-- href="clientPrePay.do" -->
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            충전하기
        </a>
        <a onclick="history.back()">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            뒤로가기
        </a>
    </div>
   </form>
 </div>

<script>
   
   function add(obj){
      let totmoney = $(".money").val();
      console.log(totmoney);
      var one = obj.value;
      console.log(one);
      var result = parseInt(one)+parseInt(totmoney);
      console.log(result);
      document.getElementById("money").value =result;
   };
  
</script>
<!-- 
<script>
function s_function() {
	$('#form_test').submit();
}
</script> -->


<%@ include file="../../inc/clientSideB.jsp" %>