<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.model.MemberDTO" %>
<%@ page import="member.service.MemberService" %>

<jsp:useBean id="memberDTO" class="member.model.MemberDTO">
	<jsp:setProperty name="memberDTO" property="*" />
</jsp:useBean>

<%
	MemberService memberService = MemberService.getInstance();
	memberService.submitSignUp(memberDTO);
%>

<html>
<head>
	<title>밀슐랭 회원가입</title>
</head>
<body>
회원가입 완료. 환영합니다~
<br/>
<a href="index.jsp">[처음으로]</a>
</body>
</html>