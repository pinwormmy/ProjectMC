<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.MemberDTO"%>
<%@ page import="service.MemberService" %>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>

<%
	String id = request.getParameter("mId");
	String pw = request.getParameter("pw");
	
	MemberDTO member = new MemberDTO();
	MemberService memberService = MemberService.getInstance();	
	member = memberService.login(id, pw);
	
	if(member != null){
	    session.setAttribute("member", member);
	    response.sendRedirect("index.jsp");
	}else{
	    out.println("<script>alert('로그인오류!! ID와 비밀번호 확인바랍니다~!!!'); location.href='index.jsp'; </script>"); 
	}

%>

</body>
</html>