<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.MemberDTO" %>
<%@ page import="service.MemberService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String inputedId = request.getParameter("mId");
	MemberService memberService = MemberService.getInstance();
	boolean result = memberService.checkUniqueId(inputedId);
	pageContext.setAttribute("result", result);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 중복확인</title>
<style>
	button{		
		margin: auto;
		diplay: block;
	}
</style>
</head>
<body>
<br>

<c:if test="${result == true}">
	사용가능한 ID입니다.<br>
	<button onclick="sendResultIdAvailable();">ID 사용</button>
</c:if>

<c:if test="${result == false}">
이미 사용 중인 ID입니다. 딴거 하세요~<br>
<button onclick="window.close()">ID 다시 작성</button> <!-- 닫았다 다시 아이디치고 열고해서 번잡한데 깔끔하게 수정해야함 -->
</c:if>

<script>

	function sendResultIdAvailable(){
		
		opener.document.submitSignUp.isUniqueId.value=true;
		
		self.close();
	}
	
</script>


</body>
</html>