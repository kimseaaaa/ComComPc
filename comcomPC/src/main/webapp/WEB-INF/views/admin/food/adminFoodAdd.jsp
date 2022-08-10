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

<script type="text/javascript">
	$(document).ready(function(){
	 	if(${msg != null}){
			 alert("${msg}");
		} 
	});
</script>

<div class="wrapper">
    <div class="title">
        음식 추가
    </div>
    <form method="post" name="FooduploadForm" action="<c:url value='/adminFoodAddOk.do'/>"
        enctype="multipart/form-data">

        <div class="inputfield">
            <label>음식명</label>
            <input type="text" id="fname" name="fname" class="input">
        </div>

 	  <div class="inputfield">
            <label>가격</label>
            <input type="text" id="fpri" name="fpri" class="input"  oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');">
        </div>

        <div class="inputfield">
            <label>카테고리</label>
            <div class="custom_select">
                <select class="catselect" id="fcat" name="fcat">
                    <option value="">카테고리를 선택하세요</option>
                    <option value="음료">음료</option>
                    <option value="스낵">스낵</option>
                    <option value="식사">식사</option>
                </select>
            </div>
        </div>

        <div class="inputfield filebox">
            <label>이미지</label>
            <input class="upload-name" value="이미지" placeholder="이미지">
            <label for="file" class="forfile">파일찾기</label>
            <input type="file" id="file" name="file">

            <script type="text/javascript">
                $("#file").on('change', function () {
                    var fileName = $("#file").val();
                    $(".upload-name").val(fileName);
                });
            </script>
        </div>

        <div class="inputfield btns">
            <input type="submit" value="추가" class="form-btn">
            <input type="reset" value="취소" class="form-btn">
            <a class="form-btn" href="adminFoodList.do">목록</a>
        </div>
    </form>
</div>

<%@ include file="../../inc/adminSideB.jsp" %>