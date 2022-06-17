<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<title>밀슐랭 회원가입</title>

</head>
<body>
	회원가입 양식

	*표시된 항목은 꼭 작성해주셔야 합니다.

	<form id="submitSignUp" name="submitSignUp" action="submitSignUp.jsp" method="post">
		*ID : <input type="text" name="mId" id="mId">
		<button type="button" id="btn_checkId" onclick="checkUniqueId();">중복확인</button><br> 
		<input type="hidden" name="isUniqueId" value="false">
		*비밀번호 : <input type="password" name="pw" id="pw"> <br>
		*비밀번호 확인 : <input type="password" name="pw2" id="pw2"> <br>
		*이름 : <input type="text" name="mName" id="mName"> <br>
		연락처 : <input type="tel" name="phone" id="phone"> <br> e메일
		: <input type="email" name="email" id="email"> <br> 주소 :
		<input type="text" name="address" id="address" size="40"> <br>
		<button type="button" onclick="checkSignupForm();">회원가입</button>
		<button type="button" onclick="location.href='index.jsp'">취소</button>
	</form>
	<!-- 아이디랑 비번에 정규표현식 적용,이메일 인증 추가 검토, 카카오api주소 등록 검토 -->

	<script type="text/javascript">
	
		var submitSignUpForm = document.submitSignUp;
		
		function checkUniqueId() {					

			var mId = document.getElementById("mId");
			if (mId.value == "") {
				alert("ID를 입력하세요!!");
				mId.focus();
				return false;
			}
			window.open('checkUniqueId.jsp?mId=' + mId.value, '중벅확인', 'width=500, height=100');
		}
		
		function checkSignupForm() {
			
			if (submitSignUpForm.mId.value == "") {
				alert("ID를 입력하세요!!");
				submitSignUpForm.mId.focus();
				return false;
			}
			if (submitSignUpForm.pw.value == "") {
				alert("비밀번호를 입력하세요!!");
				submitSignUpForm.pw.focus();
				return false;
			}
			if (submitSignUpForm.pw2.value == "") {
				alert("비밀번호 확인도 입력하세요!!");
				submitSignUpForm.pw2.focus();
				return false;
			}
			if (submitSignUpForm.pw.value != pw2.value) {
				alert("비밀번호 재입력까지 일치해야합니다.");
				submitSignUpForm.pw.focus();
				return false;
			}
			if (submitSignUpForm.mName.value == "") {
				alert("이름을 입력하세요!!");
				submitSignUpForm.mName.focus();
				return false;
			}
			if (submitSignUpForm.isUniqueId.value != 'true') { // boolean 지정하고 쓴게 아니라 문자열로 확인하게 되버림 ㅡㅡ; 한참 헤맷네 그지같은 js
				alert("아이디 중복확인 통과해야 합니다~~");
				submitSignUpForm.mId.focus();
				return false;
			}
			
			submitSignUpForm.submit();
		}
	</script>
</body>
</html>

