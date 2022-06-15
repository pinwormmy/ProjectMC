<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.MemberDTO" %>
<%@ page import="member.service.MemberService" %>
<%
	request.setCharacterEncoding("utf-8");

	String inputedId = request.getParameter("inputedId");
	MemberService memberService = MemberService.getInstance();
	boolean result = memberService.checkUniqueId(inputedId);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>
</head>
<body>

</body>
</html>