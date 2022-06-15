<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.MemberDTO" %>
<%@ page import="member.service.MemberService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	request.setCharacterEncoding("utf-8");

	String inputedId = request.getParameter("inputedId"); // 안 받아와짐 ㅜㅜ
	System.out.println("아디 잘 받아온거 테스트" + inputedId);
	MemberService memberService = MemberService.getInstance();
	boolean result = memberService.checkUniqueId(inputedId);
	pageContext.setAttribute("result", result);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>
</head>
<body>

<c:if test="${result == true}">사용가능한 ID입니다.</c:if>
<c:if test="${result == true}">이미 사용 중인 ID입니다. 딴거 하세요~</c:if>

</body>
</html>