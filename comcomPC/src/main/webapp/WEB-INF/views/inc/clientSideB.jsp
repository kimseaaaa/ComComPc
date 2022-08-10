<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

</div>
<div class="sidebar">
  <div class="userNum">72</div>
  <div class="info">

<%	
	String id = (String)session.getAttribute("id");
%> 
    <div class="userName" ><p><%=id%> 님</p></div>
  <a class="home" onclick="timezeroOk()"><i class="fa fa-home" aria-hidden="true"></i></a><br>
</div>
<div class="time">${timefront}</div>
<div class="btnbox">
  <a href="clientLogout.do" class="btn">로그아웃</a>
  <a href="clientCharge.do" class="btn">충전하기</a>
</div>
<br>
 <div class="side-wrapper">
  <div class="side-menu">
   <a class="sidebar-link" href="#">
    <svg viewBox="0 0 24 24" fill="currentColor">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M17.769 8.382H22C22 4.985 19.964 3 16.516 3H7.484C4.036 3 2 4.985 2 8.338v7.324C2 19.015 4.036 21 7.484 21h9.032C19.964 21 22 19.015 22 15.662v-.313h-4.231c-1.964 0-3.556-1.552-3.556-3.466 0-1.915 1.592-3.467 3.556-3.467v-.034zm0 1.49h3.484c.413 0 .747.326.747.728v2.531a.746.746 0 01-.747.728H17.85c-.994.013-1.864-.65-2.089-1.595a1.982 1.982 0 01.433-1.652 2.091 2.091 0 011.576-.74zm.151 2.661h.329a.755.755 0 00.764-.745.755.755 0 00-.764-.746h-.329a.766.766 0 00-.54.213.727.727 0 00-.224.524c0 .413.34.75.764.754zM6.738 8.382h5.644a.755.755 0 00.765-.746.755.755 0 00-.765-.745H6.738a.755.755 0 00-.765.737c0 .413.341.75.765.754z" />
     </svg>
    음식주문
   </a>
   <a class="sidebar-link" href="clientInfo.do">
    <svg viewBox="0 0 24 24" fill="currentColor">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M19.761 12.001c0 .814.668 1.475 1.489 1.475.414 0 .75.333.75.743v2.677C22 19.159 20.142 21 17.858 21H6.143C3.859 21 2 19.159 2 16.896v-2.677c0-.41.336-.743.75-.743.822 0 1.49-.662 1.49-1.475 0-.793-.641-1.39-1.49-1.39a.752.752 0 01-.53-.217.74.74 0 01-.22-.525l.002-2.764C2.002 4.842 3.86 3 6.144 3h11.712c2.284 0 4.143 1.842 4.143 4.105L22 9.782a.741.741 0 01-.219.526.753.753 0 01-.531.218c-.821 0-1.489.662-1.489 1.475zm-5.509.647l1.179-1.137a.73.73 0 00-.409-1.25l-1.629-.236-.729-1.462a.737.737 0 00-.662-.41H12a.74.74 0 00-.663.409l-.729 1.463-1.626.235a.735.735 0 00-.6.498.724.724 0 00.187.753l1.179 1.137-.278 1.608a.727.727 0 00.295.719.742.742 0 00.777.054L12 14.27l1.455.757a.733.733 0 00.78-.053.723.723 0 00.296-.718l-.279-1.608z" />
     </svg>
    마이페이지
   </a>
   <a class="sidebar-link" href="#">
    <svg viewBox="0 0 24 24" fill="currentColor">
      <path fill-rule="evenodd" clip-rule="evenodd" d="M10.835 12.007l.002.354c.012 1.404.096 2.657.242 3.451 0 .015.16.802.261 1.064.16.38.447.701.809.905a2 2 0 00.91.219c.249-.012.66-.137.954-.242l.244-.094c1.617-.642 4.707-2.74 5.891-4.024l.087-.09.39-.42c.245-.322.375-.715.375-1.138 0-.379-.116-.758-.347-1.064-.07-.099-.18-.226-.28-.334l-.379-.397c-1.305-1.321-4.129-3.175-5.593-3.79 0-.013-.91-.393-1.343-.407h-.057c-.665 0-1.286.379-1.603.991-.087.168-.17.496-.233.784l-.114.544c-.13.874-.216 2.216-.216 3.688zm-6.332-1.525C3.673 10.482 3 11.162 3 12a1.51 1.51 0 001.503 1.518l3.7-.328c.65 0 1.179-.532 1.179-1.19 0-.658-.528-1.191-1.18-1.191l-3.699-.327z" />
     </svg>
    메세지보내기
   </a>
 </div>
</div>
</div>
<script src="${ctx}/js/main.js"></script>
 <script type="text/javascript">

	function timezeroOk() {
		
		//var time = document.getElementById("time").value;
		var time = '${timefront}';
		
		//alert("[clientSideB.jsp][timezeroOk()] time : " + time);
		
		if(time == 0 || time == null){
			
			alert("잔여시간이 없습니다. 충전해 주세요.");
			location.href = "clientCharge.do";
		} else {
			
			location.href = "clientMain.do";
		}
	};
	
	$(document).ready(function(){
		$.ajax({
		      url: "<c:url value='/ajaxRemainingTime.do'/>",
		      type: "GET",
		      success:function (data) {
		    	  $(".time").text(data);
		      },
		      error: function () {
		         alert("에러!!!!!!!!!");
		      }
		  });
	});
	
	
	setInterval(function(){
		$.ajax({
		      url: "<c:url value='/ajaxRemainingTime.do'/>",
		      type: "GET",
		      success:function (data) {
		    	  $(".time").text(data);
		      },
		      error: function () {
		         alert("에러!!!!!!!!!");
		      }
		  });
		},60000);
</script>
</body>
</html>