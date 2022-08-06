<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
   
<!-- adminSide -->
<%@ include file="../../inc/adminSideA.jsp" %>
<!-- adminHeader -->
<%@ include file="../../inc/adminHeader.jsp" %>

<link rel="stylesheet" href="${ctx}/css/mod.css">
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<script type="text/javascript">
	$(document).ready(function(){
	 	if(${msg != null}){
			 alert("${msg}");
		} 
	});
</script>

<div class="wrapper">
    <div class="title">
        음식 정보
    </div>
    <div class="viewform">
        <div class="imgviewfode">
            <img src="<c:out value='${ctx}/FoodImg/${fDto.fimg}'/>" />
        </div>
        <form method="post" id="modform" class="form" action="<c:url value='/adminFoodMod.do?fcode=${fDto.fcode}'/>" enctype="multipart/form-data">
            <div class="inputfield">
                <label>음식명</label>
                <input type="text" class="input" value="${fDto.fname}" name="fname">
            </div>

			<div class="inputfield">
                <label>가격</label>
                <input type="text" class="input" value="${fDto.fpri}" name="fpri" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
            </div>

            <div class="inputfield">
                <label>카테고리</label>
                <div class="custom_select">
                    <select class="catselect" name="fcat">
                        <option value="">카테고리를 선택하세요</option>
                        <option value="음료" ${fDto.fcat eq'음료' ? 'selected' :''}>음료</option>
                        <option value="스낵" ${fDto.fcat eq'스낵' ? 'selected' :''}>스낵</option>
                        <option value="식사" ${fDto.fcat eq'식사' ? 'selected' :''}>식사</option>
                    </select>
                </div>
            </div>
            
            <div class="inputfield">
                <label>Best 메뉴</label>
                <div class="radio">
                	<input type="radio" class = "form-check-input" name="fbest" value=1 ${fDto.fbest eq 1 ? 'checked':''}/> 
                	<label for="fbest">BEST</label>&nbsp;&nbsp;&nbsp;
					<input type="radio" class = "form-check-input" name="fbest" value=0 ${fDto.fbest eq 0 ? 'checked':''}/> 
					<label for="fbest">None</label>
                </div>
            </div>
            
            <div class="inputfield filebox">
                <label>이미지</label>
                <input class="upload-name" name="oldFile" value="${fDto.fimg}">
                <label for="file" class="forfile">파일찾기</label>
                <input type="file" id="file" name="file">

                <script type="text/javascript">
                    $("#file").on('change', function () {
                        var fileName = $("#file").val();
                        $(".upload-name").val(fileName);
                    });
                </script>
            </div>
        </form>
    </div>

	<div class="inputfield btns">
	    <input type="submit" value="수정" class="form-btn" onclick="document.getElementById('modform').submit();">
	    <a href="adminFoodDel.do?fcode=${fDto.fcode}&fimg=${fDto.fimg}" class="form-btn">삭제</a>
	    <input type="reset" value="취소" class="form-btn" onclick="document.getElementById('modform').reset();">
	    <a href="adminFoodList.do" class="form-btn">목록</a>
	</div>
</div>

<%@ include file="../../inc/adminSideB.jsp" %>