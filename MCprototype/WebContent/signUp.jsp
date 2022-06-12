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

<form action="/submitSignUp">
ID : <input type="text" name="mId"> <br>
비밀번호 : <input type="password" name="pw"> <br>
비밀번호 확인 : <input type="password" name="pw2"> <br>
이름 : <input type="text" name="mName"> <br>
연락처 : <input type="tel" name="phone"> <br>
e메일 : <input type="email" name="email"> <br>
주소 : <input type="text" name="address" size="40"> <br>
<button>회원가입</button>
</form>
<!-- 아이디 중복 확인, 비밀번호확인란 일치여부, 이메일 인증 추가 검토 -->

</body>
</html>