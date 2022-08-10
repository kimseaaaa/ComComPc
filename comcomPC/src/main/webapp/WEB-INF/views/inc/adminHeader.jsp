<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <link rel="stylesheet" href="${ctx}/css/adminHeader.css">
<div class="admin-header">
  <a class="header-item" href="adminSetting.do">매출현황</a>
  <a class="header-item" href="adminClientList.do">회원관리</a>
  <a class="header-item" href="adminFoodList.do?v=<%=System.currentTimeMillis() %>">메뉴관리</a>
  <a class="header-item" href="adminGameList.do">게임관리</a>
</div>