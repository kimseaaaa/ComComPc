<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="${ctx}/css/clientLogin.css">
<script type="text/javascript" src="${ctx}/js/valid.js" charset="utf-8"></script>

<div class="seat-num">
   72
</div>

<div class="login-box">
   <h2>Join</h2>

   <form class="form" name="joinForm" action="clientJoinOk.do" method="post" id="form">
      <div class="id-box">
         <div class="user-box">
            <input type="text" name="id" class="id" required="" onkeyup="change(this)">
            <label>아이디</label>
         </div>
         <button class="id-a" id="send" type="button">
            <p>중복확인</p>
         </button>
         <input type="hidden" id="checkOk" name="checkOk" value=0>
      </div>

      <div class="user-box">
         <input type="password" name="pw" class="pw" autocomplete="off" required="">
         <label>비밀번호</label>
      </div>
      <div class="user-box">
         <input type="password" id="pwOk" autocomplete="off" required="">
         <label>비밀번호 확인</label>
      </div>
      <div class="user-box birth">
         <input name="birth" id="birth" type="date" required="" >
<!--          <input type="text" name="birth" required=""> -->
         <label>생년월일</label>
      </div>
      <div class="user-box">
         <input type="text" name="tel" class="tel" maxlength="13" required="">
         <!-- <input type="text" name="tel" class="tel" required=""> -->
         <label>전화번호</label>
      </div>
      <div class="user-btn">
         <a onclick="clJoinChk()">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            회원가입
         </a>
         <a href="clientLogin.do">
            <span></span>
            <span></span>
            <span></span>
            <span></span>
            뒤로가기
         </a>
      </div>
   </form>
</div>
<script type="text/javascript">
   var send = document.getElementById("send");

   send.addEventListener("click", function () {
      let usrID = $(".id").val();
      let status = $("#checkOk").val();
      /* console.log(usrID);
      console.log(status); */
      $.ajax({
         url: "<c:url value='/clientidcheck.do'/>",
         type: "post",
         data: { "id": usrID },
         success: function (data) {
            if (data == 0) {
               alert("사용불가능한 아이디입니다.");
               $(".id").focus();
               document.getElementById("checkOk").value = 0;
               /* console.log($("#checkOk").val()); */
            } else {
               alert("사용가능한 아이디입니다.");
               $(".pw").focus();
               document.getElementById("checkOk").value = 1;
               /* console.log($("#checkOk").val()); */
            }
         },
         error: function () {
            alert("에러!!!!!!!!!");
         }
      });

   });

   function change(obj) {
      document.getElementById("checkOk").value = 0;
      /*    console.log("아이디 변경");
      console.log($("#checkOk").val()); */

   }
   
   
    $('.tel').keydown(function(event) {
         var key = event.charCode || event.keyCode || 0;
         $text = $(this);
         if (key !== 8 && key !== 9) {
             if ($text.val().length === 3) {
                 $text.val($text.val() + '-');
             }
             if ($text.val().length === 8) {
                 $text.val($text.val() + '-');
             }
         }

         return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));          
     }); 
    
    
    
    var now_utc = Date.now()
    var timeOff = new Date().getTimezoneOffset()*60000;
    var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
    document.getElementById("birth").setAttribute("max", today);

</script>