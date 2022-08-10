<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ include file="../inc/adminSideA.jsp" %>    

<link rel="stylesheet" href="${ctx}/css/adminDashboard.css">

<div class="dashboard">
   <section class="dash-top-lists">
   <div class="request-list">
      <h3 class="request-title">주문 목록</h3>
         <ul class="list-items">
            <li>
               <div class="orderbox">
                  <div class="obseatnum">
                     <span class="seatnum">72</span>
                     <span class="id">dahae</span>   
                  </div>
                  <div class="obmsg">
                     <div class="obchat">
                        신라면 X 2
                     </div>
                     <div class="obbtn">
                        <input value="전달완료" class="btn"/>

                     </div>
                  </div>
               </div>
            </li>   
            <li>
               <div class="orderbox">
                  <div class="obseatnum">
                     <span class="seatnum">72</span>
                     <span class="id">dahae</span>   
                  </div>
                  <div class="obmsg">
                     <div class="obchat">
                        신라면 X 2
                     </div>
                     <div class="obbtn">
                        <input value="전달완료" class="btn"/>
                     </div>
                  </div>
               </div>
            </li>
            <li>
               <div class="orderbox">
                  <div class="obseatnum">
                     <span class="seatnum">72</span>
                     <span class="id">dahae</span>   
                  </div>
                  <div class="obmsg">
                     <div class="obchat">
                        신라면 X 2
                     </div>
                     <div class="obbtn">
                        <input value="전달완료" class="form-btn"/>
                     </div>
                  </div>
               </div>
            </li>
            <li>
               <div class="orderbox">
                  <div class="obseatnum">
                     <span class="seatnum">72</span>
                     <span class="id">dahae</span>   
                  </div>
                  <div class="obmsg">
                     <div class="obchat">
                        신라면 X 2
                     </div>
                     <div class="obbtn">
                        <input value="전달완료" class="form-btn"/>

                     </div>
                  </div>
               </div>
            </li>
            <li>
               <div class="orderbox">
                  <div class="obseatnum">
                     <span class="seatnum">72</span>
                     <span class="id">dahae</span>   
                  </div>
                  <div class="obmsg">
                     <div class="obchat">
                        신라면 X 2
                     </div>
                     <div class="obbtn">
                        <input value="전달완료" class="btn"/>
                        <input type="number">
1
                     </div>
                  </div>
               </div>
            </li>
            <li>
               <div class="orderbox">
                  <div class="obseatnum">
                     <span class="seatnum">72</span>
                     <span class="id">dahae</span>   
                  </div>
                  <div class="obmsg">
                     <div class="obchat">
                        신라면 X 2
                     </div>
                     <div class="obbtn">
                        <input value="전달완료" class="btn"/>

                     </div>
                  </div>
               </div>
            </li>
            <li>
               <div class="orderbox">
                  <div class="obseatnum">
                     <span class="seatnum">72</span>
                     <span class="id">dahae</span>   
                  </div>
                  <div class="obmsg">
                     <div class="obchat">
                        신라면 X 2
                     </div>
                     <div class="obbtn">
                        <input value="전달완료" class="btn"/>

                     </div>
                  </div>
               </div>
            </li>
            <li>
               <div class="orderbox">
                  <div class="obseatnum">
                     <span class="seatnum">72</span>
                     <span class="id">dahae</span>   
                  </div>
                  <div class="obmsg">
                     <div class="obchat">
                        신라면 X 2
                     </div>
                     <div class="obbtn">
                        <input value="전달완료" class="btn"/>

                     </div>
                  </div>
               </div>
            </li>
            <li>
               <div class="orderbox">
                  <div class="obseatnum">
                     <span class="seatnum">72</span>
                     <span class="id">dahae</span>   
                  </div>
                  <div class="obmsg">
                     <div class="obchat">
                        신라면 X 2
                     </div>
                     <div class="obbtn">
                        <input value="전달완료" class="btn"/>

                     </div>
                  </div>
               </div>
            </li>         
         </ul>
   </div>   
   
<!-- **************메시지목록************* -->
   <div class="request-list">
      <h3 class="request-title">메시지 목록</h3>
      <ul class="Msg list-items">
      <c:forEach var = "content" items="${latestMsg}">
      	<c:forEach var = "msg" items="${msgmap}">
      		<c:if test="${msg.key eq content.cfrom && content.cfrom!='관리자'}">
      			<li>
		            <div class="orderbox">
		               <div class="obseatnum">
		                  <div class="seatnum">${content.seatnum}</div>
		                  <div class="id">${msg.key}</div>   
		               </div>
		               <div class="obmsg">
		                  <div class="obchat">
		                  	<div class="msgContent">${content.ccontent}</div>
		                  </div>
		                  <div class="obbtn">
		                  	<div class="msgCnt"><i class="fas fa-comment"></i>
		                  		<div>${msg.value}</div>
		                  	</div>
		                  	<a href="adminChat.do?cto=${msg.key}"><input value="보내기" class="form-btn"/></a>
		                  	<a href="msgCheckOk.do?cfrom=${msg.key}"><input value="전달완료" class="form-btn"/></a>
		                  </div>
		               </div>
		            </div>
		         </li>
	         	</c:if>
         	</c:forEach>
         </c:forEach>
      </ul>
   </div>
   </section>
   
   <!-- **************************************** -->

   <section class="lists-games">
    <div class="container">
      <h1>게임 순위</h1>
        <table class="table">
         <thead>
          <tr>
           <th>순위</th>
           <th>게임명</th>
           <th>유통사</th>
           <th>점유율</th>
          </tr>
         </thead>
         <tbody>
         <c:forEach var="grdto" items="${gamerank}">
	         <tr>
	            <td>${grdto.ranking}</td>
	            <td>${grdto.grname}</td>
	            <td>${grdto.grcomp}</td>
	            <td>${grdto.grshare}</td>
	         </tr>
         </c:forEach>
         </tbody>
        </table>
     </div>
     
     
     <div class="container">
      <h1>신규게임</h1>
        <table class="table">
         <thead>
           <tr>
            <th>등록일</th>
            <th>게임명</th>
            <th>점유율</th>
           </tr>
         </thead>
         <tbody>
         <c:forEach var="gndto" items="${gamenew}">
           <tr>
	           <td>${gndto.gnrelease}</td>
	           <td>${gndto.gnname}</td>
	           <td>${gndto.gnshare}%</td>
           </tr>
         </c:forEach>
         </tbody>
        </table>
     </div>
   </section>
   </div>
<%@ include file="../inc/adminSideB.jsp" %>   