<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${ctx}/css/clientInfo.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<%@ include file="../../inc/clientSideA.jsp" %>
<!-- 자바스크립트 파일 불러오기 -->
<script type="text/javascript" src="${ctx}/js/valid.js" charset="utf-8"></script>
</script>
<div class="wrapper">
    <div class="title">
      My Page
    </div>
    <form class="form" name="clinfoform" action="${ctx}/clientMod.do" method="post" enctype="multipart/form-data">
       <div class="inputfield">
          <label>아이디</label>
          <input type="text" class="input" value="${cldto.id}" name="id" readonly="readonly">
       </div>  
       <input type="hidden" class="input" name="currentPw" value="${cldto.pw}">
       <div class="inputfield">
        <label>현재 비밀번호</label>
        <input type="text" class="input" name="pw" >
       </div> 
       <div class="inputfield">
        <label>새 비밀번호</label>
        <input type="password" class="input" name="newpw">
       </div>  
       <div class="inputfield">
        <label>비밀번호 확인</label>
        <input type="password" class="input" name="confpw">
       </div>  
        <div class="inputfield">
          <label>생년월일</label>
          <input type="text" class="input" value="${cldto.birth}" name="birth" readonly="readonly">
       </div>  
       <div class="inputfield">
        <label>전화번호</label>
        <input type="text" class="input" value="${cldto.tel}" name="tel" placeholder="ex) 010-7958-4715">
     </div>  
     
      
      <div class="inputfield">
        <!-- <input type="submit" value="수정" class="btn" onclick="document.getElementById('clinfoform').submit();"> -->
        <input type="button" value="수정" class="btn" onclick="mypageMod()">
        <input type="reset" value="취소" class="btn"  onclick="document.getElementById('clinfoform').reset();">
      </div>
    </form>
</div>
<%@ include file="../../inc/clientSideB.jsp" %>