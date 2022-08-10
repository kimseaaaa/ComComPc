<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
   
<!-- adminSide -->
<%@ include file="../../inc/adminSideA.jsp" %>

<!-- adminHeader -->
<%@ include file="../../inc/adminHeader.jsp" %>

<link rel="stylesheet" href="${ctx}/css/add.css">

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script> -->

<div class="wrapper">
  <div class="title">
    게임 추가
  </div>
  
  <form class="form" action="${ctx}/adminGameAddOk.do" method="post" enctype="multipart/form-data">
    <div class="inputfield">
      <label>게임명</label>
      <input type="text" class="input" name="gname" id="gname" >
    </div> 

    <div class="inputfield">
      <label>유통사</label>
      <input type="text" class="input" placeholder="" name="gcomp">
    </div>

    <div class="inputfield">
      <label>카테고리</label>
      <div class="custom_select">
        <select class="catselect" name="gcat">
          <option value="">카테고리를 선택하세요</option>
          <option value="RTS">RTS</option>
          <option value="슈팅">슈팅</option>
          <option value="스포츠">스포츠</option>
          <option value="보드">보드</option>
          <option value="아케이드">아케이드</option>
          <option value="대전&격투">대전&격투</option>
          <option value="RPG">RPG</option>
          <option value="어드벤처">어드벤처</option>
          <option value="시뮬레이션">시뮬레이션</option>
        </select>
      </div>
    </div>  

    <div class="inputfield">
      <label>유료/무료</label>
      <div class="accounttype">
        <input type="radio" value="유료" id="radioOne" name="gfee" checked/>
        <label for="radioOne" class="radio" >유료</label>
        <input type="radio" value="무료" id="radioTwo" name="gfee"/>
        <label for="radioTwo" class="radio">무료</label>
      </div>
    </div>  

    <div class="inputfield filebox">
      <label>이미지</label>
      <input class="upload-name" value="이미지" placeholder="이미지">
      <label for="file" class="forfile">파일찾기</label> 
      <input type="file" id="file" name="filegimg">

      <script type="text/javascript">
        $("#file").on('change',function(){
          var fileName = $("#file").val();
          $(".upload-name").val(fileName);
        });
      </script>


    </div>

     
      
    <div class="inputfield btns">
      <input type="submit" value="추가" class="form-btn" id="submit">
      <input type="reset" value="취소" class="form-btn">
      <a href="adminGameList.do" class="form-btn">목록</a>
    </div>
  </form>
</div>
<%@ include file="../../inc/adminSideB.jsp" %>