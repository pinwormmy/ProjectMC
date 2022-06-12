<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀슐랭 프로토타입</title>
</head>
<body>

<div class="login">
<form action="/login" method="post">
	아이디 : <input type="text" name="mId">
	비밀번호 : <input type="password" name="pw">
	<button>로그인</button>
	<a href="./signUp.jsp">회원가입</a>
</form>
</div>

<!--
<div>
	?? 님이 로그인 중입니다.(아직 미구현)
</div>
-->

<h1>빠릿빠릿하게 만들어보자</h1>

방명록으로 오라클DB 연동 확인.
회원가입 먼저 구현해보기

</body>
</html>