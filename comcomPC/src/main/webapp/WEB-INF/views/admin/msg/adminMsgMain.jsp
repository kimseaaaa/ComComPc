<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
   
<!-- adminSide -->
<%@ include file="../../inc/adminSideA.jsp" %>

<link rel="stylesheet" href="${ctx}/css/list.css">

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

<div class="listcontainer">
  <h1>메시지</h1>
  <div>
    <div class="topbar">
      <a href="" class="addbtn">아이디</a>
      <a href="" class="addbtn">좌석번호</a>
      <div class="wrap">
        <div class="search">
          <input type="text" class="searchTerm" placeholder="아이디를 입력해주세요.">
          <button type="submit" class="searchButton">
            <i class="fa fa-search"></i>
          </button>
        </div>
      </div>
    </div> 

    <table class="table">
      <thead>
        <tr>
          <th>아이디</th>
          <th>좌석번호</th>
          <th>시간</th>
          <th>내용</th>
          <th class="dmbtn" ></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>dahae</td>
          <td>08</td>
          <td>16:29</td>
          <td>안녕하세요~</td>
          <td class="delmodbtn">
            <a href="" class="modbtn">보내기</a>
            <a href="" class="delbtn">답변완료</a>
          </td>
        </tr>
        <tr>
          <td>dahae</td>
          <td>08</td>
          <td>16:29</td>
          <td>안녕하세요~</td>
          <td class="delmodbtn">
            <a href="" class="modbtn">보내기</a>
            <a href="" class="delbtn">답변완료</a>
          </td>
        </tr>
        <tr>
          <td>dahae</td>
          <td>08</td>
          <td>16:29</td>
          <td>안녕하세요~</td>
          <td class="delmodbtn">
            <a href="" class="modbtn">보내기</a>
            <a href="" class="delbtn">답변완료</a>
          </td>
        </tr>
        <tr>
          <td>dahae</td>
          <td>08</td>
          <td>2022-07-22 16:29</td>
          <td>안녕하세요~</td>
          <td class="delmodbtn">
            <a href="" class="modbtn">보내기</a>
            <a href="" class="delbtn">답변완료</a>
          </td>
        </tr>
        <tr>
          <td>dahae</td>
          <td>08</td>
          <td>2022-07-13 16:29</td>
          <td>안녕하세요~</td>
          <td class="delmodbtn">
            <a href="" class="modbtn">보내기</a>
            <a href="" class="delbtn">답변완료</a>
          </td>
        </tr>       
        <tr>
          <td>dahae</td>
          <td>08</td>
          <td>2022-06-25 16:29</td>
          <td>안녕하세요~</td>
          <td class="delmodbtn">
            <a href="" class="modbtn">보내기</a>
            <a href="" class="delbtn">답변완료</a>
          </td>
        </tr>
        

      </tbody>
    </table>
    </div>
</div>
<%@ include file="../../inc/adminSideB.jsp" %>