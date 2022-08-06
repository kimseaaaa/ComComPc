function adLoginChk(){
   if(document.adminLoginForm.id.value.length == 0){
      alert("아이디를 입력해 주세요");
      adminLoginForm.id.focus();
      return;
   }
	   
	if(document.adminLoginForm.pw.value.length == 0){
	      alert("비밀번호를 입력해 주세요");
	      adminLoginForm.pw.focus();
	return;
   }
   
   document.adminLoginForm.submit();
}

function clLoginChk(){
   if(document.clientLoginForm.id.value.length == 0){
      alert("아이디를 입력해 주세요");
      clientLoginForm.id.focus();
      return;
   }
	   
	if(document.clientLoginForm.pw.value.length == 0){
	      alert("비밀번호를 입력해 주세요");
	      clientLoginForm.pw.focus();
	return;
   }
   
   document.clientLoginForm.submit();
}


function clJoinChk(){
   if(document.joinForm.id.value.length == 0){
      alert("아이디를 입력해 주세요");
      joinForm.id.focus();
      return;
   }
   
   if(document.joinForm.id.value.length < 3){
      alert("아이디는 최소 3글자 이상이어야 합니다.");
      joinForm.id.focus();
      return;
   }
   if(document.joinForm.pw.value.length == 0){
      alert("비밀번호를 입력하세요!!");
      joinForm.pw.focus();
      return;
   }
   if(document.joinForm.pw.value != document.joinForm.pwOk.value){
      alert("비밀번호가 일치하지 않습니다!!");
      joinForm.pwOk.focus();
      return;
   }
   if(document.joinForm.birth.value.length == 0){
      alert("생년월일을 입력하세요!!");
      joinForm.birth.focus();
      return;
   }
   if(document.joinForm.tel.value.length == 0){
      alert("전화번호를 입력하세요!!");
      joinForm.tel.focus();
      return;
   }
   
   if(document.joinForm.tel.value.length > 13){
      alert("전화번호 에러!!!!");
      joinForm.id.focus();
      return;
   }
   
   if(document.joinForm.checkOk.value == 0){
      alert("아이디 중복체크 해주세요!!");
      joinForm.id.focus();
      return;
   }

   document.joinForm.submit();
}


function mypageMod(){
   if(document.clinfoform.pw.value.length == 0){
      alert("기존 비밀번호를 입력하세요!!");
      joinForm.pw.focus();
      return;
      }	
      
	if(document.clinfoform.currentPw.value != document.clinfoform.pw.value){
	      alert("기존 비밀번호가 일치하지 않습니다!!");
	      joinForm.pw.focus();
	      return;
	   }
      /*
   if(document.clinfoform.pw.value =! ){
      alert("기존 비밀번호를 입력하세요!!");
      joinForm.pw.focus();
      return;
      }
      */
      
/*   if(document.clinfoform.newpw.value.length == 0){
      alert("새 비밀번호를 입력하세요!!");
      joinForm.newpw.focus();
      return;
   } */
   
   
   if(document.clinfoform.newpw.value != document.clinfoform.confpw.value){
      alert("새 비밀번호가 일치하지 않습니다!!");
      joinForm.confpw.focus();
      return;
   }
   
   
   
   
   document.clinfoform.submit();
}
