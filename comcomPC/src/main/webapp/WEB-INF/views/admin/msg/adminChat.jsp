<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    
<%@ include file="../../inc/adminSideA.jsp" %>
<link rel="stylesheet" href="../resources/adminChat.css">
 
<script src="main.js"></script>

<section class="msger">  
    <main class="msger-chat">

      <div class="msg left-msg">
        <div class="msg-bubble">
          <div class="msg-info">
            <div class="msg-person">
              <div class="msg-seatnum">72</div>
              <div class="msg-info-name">seaaa</div>
            </div>
            <div class="msg-info-time">12:45</div>
          </div>
          <div class="msg-text">
            Hi, welcome to SimpleChat! Go ahead and send me a message. 😄
          </div>
        </div> 
      </div>
  
      <div class="msg right-msg">
        <div class="msg-bubble">
          <div class="msg-info">
            <div class="msg-info-name">관리자</div>
            <div class="msg-info-time">12:46</div>
          </div>
          <div class="msg-text">
            You can change your name in JS section!
          </div>
        </div>
      </div>

      <div class="msg left-msg">
        <div class="msg-bubble">
          <div class="msg-info">
            <div class="msg-person">
              <div class="msg-seatnum">72</div>
              <div class="msg-info-name">seaaa</div>
            </div>
            <div class="msg-info-time">12:45</div>
          </div>
          <div class="msg-text">
            Hi, welcome to SimpleChat! Go ahead and send me a message. 😄
          </div>
        </div> 
      </div>

      <div class="msg left-msg">
        <div class="msg-bubble">
          <div class="msg-info">
            <div class="msg-person">
              <div class="msg-seatnum">72</div>
              <div class="msg-info-name">seaaa</div>
            </div>
            <div class="msg-info-time">12:45</div>
          </div>
          <div class="msg-text">
            Hi, welcome to SimpleChat! Go ahead and send me a message. 😄
          </div>
        </div> 
      </div>
      <div class="msg right-msg">
        <div class="msg-bubble">
          <div class="msg-info">
            <div class="msg-info-name">관리자</div>
            <div class="msg-info-time">12:46</div>
          </div>
          <div class="msg-text">
            You can change your name in JS section!
          </div>
        </div>
      </div>
      <div class="msg right-msg">
        <div class="msg-bubble">
          <div class="msg-info">
            <div class="msg-info-name">관리자</div>
            <div class="msg-info-time">12:46</div>
          </div>
          <div class="msg-text">
            You can change your name in JS section!
          </div>
        </div>
      </div>

    </main>
  
    <form class="msger-inputarea">
      <input type="text" class="msger-input" placeholder="내용을 입력하세요.">
      <button type="submit" class="msger-send-btn">보내기</button>
    </form>
  </section>
  
  
<%@ include file="../../inc/adminSideB.jsp" %>