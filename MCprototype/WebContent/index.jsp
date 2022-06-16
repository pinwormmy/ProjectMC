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

<% 
	String member = (String)session.getAttribute("member");
	pageContext.setAttribute("member", member);
%>

<c:if test="${member == null}">
	<div class="login">
	<form action="login.jsp" method="post">
		아이디 : <input type="text" name="mId">
		비밀번호 : <input type="password" name="pw">
		<button>로그인</button>
		<a href="signUp.jsp">회원가입</a>
	</form>
	</div>
</c:if>
<c:if test="${member != null}">
	${member} 님이 로그인 중입니다. <button onclick="location.href='logout.jsp'">로그아웃</button><br>
</c:if>

<hr>

<h1>빠릿빠릿하게 만들어보자</h1>

방명록으로 오라클DB 연동 확인.
회원가입 먼저 구현해보기


</body>
</html>