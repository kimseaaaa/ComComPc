<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
   
<!-- adminSide -->
<%@ include file="../../inc/adminSideA.jsp" %>

<!-- adminHeader -->
<%@ include file="../../inc/adminHeader.jsp" %>

<link rel="stylesheet" href="${ctx}/css/mod.css">

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<!-- <script src="//code.jquery.com/jquery-3.3.1.min.js"></script> -->

<div class="wrapper">
  <div class="title">
    게임 정보
  </div>
  <div class="viewform" >
    <div class="imgview">
      <img src="${ctx}/gameimg/${gdto.gimg}"/>
    </div>
    <form class="form" id="modform" action="adminGameMod.do" method="post" enctype="multipart/form-data">

      <div class="inputfield">
        <label>코드</label>
        <input type="text" class="input" value="${gdto.gcode}" name="gcode" readonly="readonly">
      </div> 

      <div class="inputfield">
        <label>게임명</label>
        <input type="text" class="input" value="${gdto.gname}" name="gname">
      </div> 
      
      <div class="inputfield">
        <label>유통사</label>
        <input type="text" class="input" value="${gdto.gcomp}" name="gcomp">
      </div>

      <div class="inputfield">
        <label>최근 업데이트일</label>
        <input type="date" class="input" id="date" value="<fmt:formatDate value='${gdto.gupdate}' pattern='yyyy-MM-dd'/>">
     	<input type="hidden" id="chdate" name="gupdate"/> 
      </div>
      
      <div class="inputfield">
        <label>카테고리</label>
        <div class="custom_select">
          <select class="catselect" name="gcat">
            <option value="">카테고리를 선택하세요</option>
            <option value="RTS"  ${gdto.gcat=="RTS" ? 'selected' : ''}>RTS</option>
            <option value="슈팅" ${gdto.gcat=="슈팅" ? 'selected' : ''}>슈팅</option>
            <option value="스포츠" ${gdto.gcat=="스포츠" ? 'selected' : ''}>스포츠</option>
            <option value="보드" ${gdto.gcat=="보드" ? 'selected' : ''}>보드</option>
            <option value="아케이드" ${gdto.gcat=="아케이드" ? 'selected' : ''}>아케이드</option>
            <option value="대전&격투" ${gdto.gcat=="대전&격투" ? 'selected' : ''}>대전&격투</option>
            <option value="RPG" ${gdto.gcat=="RPG" ? 'selected' : ''}>RPG</option>
            <option value="어드벤처" ${gdto.gcat=="어드벤처" ? 'selected' : ''}>어드벤처</option>
            <option value  ="시뮬레이션" ${gdto.gcat=="시뮬레이션" ? 'selected' : ''}>시뮬레이션</option>
          </select>
        </div>
      </div>  

      <div class="inputfield">
        <label>유료/무료</label>
        <div class="accounttype" name="gname">
          <input type="radio" value="유료" id="radioOne" name="gfee" ${gdto.gfee=="유료" ? 'checked' : ''}/>
          <label for="radioOne" class="radio" >유료</label>
          <input type="radio" value="무료" id="radioTwo" name="gfee" ${gdto.gfee=="무료" ? 'checked' : ''}/>
          <label for="radioTwo" class="radio" chec>무료</label>
        </div>
      </div>  

      <div class="inputfield filebox">
        <label>이미지</label>
        <input class="upload-name" value="${gdto.gimg}" name="gimg">
        <label for="file" class="forfile">파일찾기</label> 
        <input type="file" id="file" name="filegimg" value="${gdto.filegimg}">
        <input type="hidden" value="${gdto.gimg}" name="pregimg">
        
      </div>
      
      
        <script type="text/javascript">
          $("#file").on('change',function(){
            var fileName = $("#file").val();
            $(".upload-name").val(fileName);
          });
          
          $("#date").on('change',function(){
        	  var update = $("#date").val();
        	  var chdate = new Date(update);
        	  $("#chdate").val(chdate);
          });
          
          $(document).ready(function(){
        	  var update = $("#date").val();
        	  var chdate = new Date(update);
        	  $("#chdate").val(chdate);
        	});
        </script>

    </form>
  </div>
      
        
    <div class="inputfield btns">
      <input type="submit" value="수정" class="form-btn" onclick="document.getElementById('modform').submit();">
      <a href="adminGameDel.do?gcode=${gdto.gcode}&gimg=${gdto.gimg}" class="form-btn">삭제</a>
      <input type="reset" value="취소" class="form-btn"  onclick="document.getElementById('modform').reset();">
      <a href="adminGameList.do" class="form-btn">목록</a>
    </div>
    
</div>
<%@ include file="../../inc/adminSideB.jsp" %>