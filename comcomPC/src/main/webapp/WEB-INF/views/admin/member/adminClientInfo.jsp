<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ include file="../../inc/adminSideA.jsp" %>
<link rel="stylesheet" href="${ctx}/css/adminClientInfo.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<%@ include file="../../inc/adminHeader.jsp" %>

<script type="text/javascript">
   $(document).ready(function(){
       if(${msg != null}){
          alert("${msg}");
      } 
   });
</script>


<div class="wrapper">
    <div class="title">
      회원정보
    </div>
    <form class="form" id="clmodform" action="${ctx}/adminClientMod.do" method="post" enctype="multipart/form-data">
       <div class="inputfield">
          <label>아이디</label>
          <input type="text" class="input" value="${cldto.id}" name="id" readonly="readonly">
       </div>
       <div class="inputfield">
        <label>비밀번호</label>
        <div class="pw"><input type="text" class="input" value="${cldto.pw}" name="pw">
        	<!-- <input type="submit" class="btn" value="초기화"> -->
        	<a class="btn" href="adminPwReset.do?id=${cldto.id}">초기화</a>
        </div>
       </div> 
       <div class="inputfield">
          <label>생년월일</label>
          <input type="text" class="input" value="${cldto.birth}" name="birth">
       </div>  
       <div class="inputfield">
        <label>전화번호</label>
        <input type="text" class="input" value="${cldto.tel}" name="tel">
       </div>  
       <div class="inputfield">
        <label>총 사용금액</label>
        <input type="text" class="input"  value="${cldto.totpri}" name="totpri" readonly="readonly">
       </div>
       <div class="inputfield">
        <label>남은 시간</label>
        <input type="text" class="input"  value="${cldto.mytime}" name="mytime" readonly="readonly">
       </div>
       <div class="inputfield">
        <label>사용중인 좌석</label>
        <input type="text" class="input" value="${cldto.seatnum}" name="seatnum" readonly="readonly">
       </div>
       <div class="inputfield">
        <label>메모</label>
        <textarea class="textarea" value="${cldto.memo}"></textarea>
     </div> 

        <input type="hidden" class="input" value="${cldto.memo}" name="memo"></input>

      
      <div class="inputfield">
        <a href="adminClientDel.do?id=${cldto.id}" class="btn">삭제</a>
        <input type="submit" value="수정" class="btn" onclick="document.getElementById('clmodform').submit();">
        <input type="reset" value="취소" class="btn"  onclick="document.getElementById('clmodform').reset();">
        <a href="adminClientList.do" class="btn">목록</a>
      </div>
    </form>
</div>
<%@ include file="../../inc/adminSideB.jsp" %>