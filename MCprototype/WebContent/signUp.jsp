<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀슐랭 회원가입</title>

</head>
<body>
회원가입 양식

<!-- 데이터 전송 후 처리는 어떻게 해야하나~ 일단 방명록이랑 유사하게 구현 -->

*표시된 항목은 꼭 작성해주셔야 합니다.

<form id="submitSignUp" action="submitSignUp.jsp" method="post">
*ID : <input type="text" name="mId" id="mId"> <button type="button" id="checkDuplicatedId" onclick="checkUniqueId()">중복확인</button> <br>
*비밀번호 : <input type="password" name="pw" id="pw"> <br>
*비밀번호 확인 : <input type="password" name="pw2" id="pw2"> <br>
*이름 : <input type="text" name="mName" id="mName"> <br>
연락처 : <input type="tel" name="phone" id="phone"> <br>
e메일 : <input type="email" name="email" id="email"> <br>
주소 : <input type="text" name="address" id="address" size="40"> <br>
<button type="button" onclick="checkSignupForm();">회원가입</button>
</form>
<!-- 아이디 중복 확인, 비밀번호확인란 일치여부, 이메일 인증 추가 검토 -->

<script type="text/javascript">

	var isUniqueId = false;
	
	function checkUniqueId(){
		var mId = document.getElementById("mId");
		
		if(mId.value == ""){
			alert("ID를 입력하세요!!");
			mId.focus();
			return false;
		}
		
		window.open("checkUniqueId.jsp", "checkUniqueIdWindow", "width=400, height=350");
	}

	function checkSignupForm(){
		var submitSignUp = document.getElementById('submitSignUp');
		var mId = document.getElementById("mId");
		var pw = document.getElementById("pw");
		var pw2 = document.getElementById("pw2");
		var mName = document.getElementById("mName");
		var phone = document.getElementById("phone");
		var email = document.getElementById("email");
		var address = document.getElementById("address");
		
		if(mId.value == ""){
			alert("ID를 입력하세요!!");
			mId.focus();
			return false;
		}
		if(pw.value == ""){
			alert("비밀번호를 입력하세요!!");
			pw.focus();
			return false;
		}
		if(pw2.value == ""){
			alert("비밀번호 확인도 입력하세요!!");
			pw2.focus();
			return false;
		}
		if(pw.value != pw2.value){ // 작동확인
			alert("비밀번호 재입력까지 일치해야합니다.");
			pw.focus();
			return false;
		}
		if(mName.value == ""){
			alert("이름을 입력하세요!!");
			mName.focus();
			return false;
		}
		submitSignUp.submit();
	}
	
</script>

</body>




</html>

