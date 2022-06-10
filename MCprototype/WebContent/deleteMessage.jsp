<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="community.service.DeleteMessageService" %>
<%@ page import="community.service.InvalidPassowrdException" %>
<%
	int messageId = Integer.parseInt(request.getParameter("messageId"));
	String inputedPw = request.getParameter("inputedPw");
	boolean invalidPassowrd = false;
	try {
		DeleteMessageService deleteService = 
				DeleteMessageService.getInstance();
		deleteService.deleteMessage(messageId, inputedPw);
	} catch(InvalidPassowrdException ex) {
		invalidPassowrd = true;
	}
%>
<html>
<head>
	<title>방명록 메시지 삭제함</title>
</head>
<body>
<%  if (!invalidPassowrd) { %>
메시지를 삭제하였습니다.
<%  } else { %>
입력한 암호가 올바르지 않습니다. 암호를 확인해주세요.
<%  }%>
<br/>
<a href="list.jsp">[목록 보기]</a>
</body>
</html>