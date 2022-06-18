<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="dto.CommunityDTO"%>
<%@ page import="community.service.MessageListView"%>
<%@ page import="community.service.GetMessageListService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String pageNumberStr = request.getParameter("page");
int pageNumber = 1;
if (pageNumberStr != null) {
    pageNumber = Integer.parseInt(pageNumberStr);
}

GetMessageListService messageListService = GetMessageListService.getInstance();
MessageListView viewData = messageListService.getMessageList(pageNumber);
%>
<c:set var="viewData" value="<%=viewData%>" />

<html>
<head>
<title>방명록</title>
</head>
<body>

(자유게시판으로 만들어야하는데 시간없어서 패스)<br>

<button onclick="location.href='index.jsp'">메인으로</button>

	<form action="writeMessage.jsp" method="post">
		이름: <input type="text" name="mId"> <br> 
		암호: <input type="password" name="postPw"> <br> 
			<input type="hidden" name="title" value="테스트라 제목이 없다"> 
		메시지:	<textarea name="content" cols="30" rows="3"></textarea>
		<br> <input type="submit" value="메시지 남기기" />
	</form>
	<hr>
	<c:if test="${viewData.isEmpty()}">
등록된 메시지가 없습니다.
</c:if>

	<c:if test="${!viewData.isEmpty()}">

		<table border="1">
			<c:forEach var="message" items="${viewData.messageList}">
				<tr>
					<td>메시지 번호: ${message.cNo} <br /> 손님 이름: ${message.mId} <br />
						메시지: ${message.content} <br /> <a
						href="confirmDeletion.jsp?cNo=${message.cNo}">[삭제하기]</a>
					</td>
				</tr>
			</c:forEach>
		</table>

		<c:forEach var="pageNum" begin="1" end="${viewData.pageTotalCount}">
			<a href="list.jsp?page=${pageNum}">[${pageNum}]</a>
		</c:forEach>

	</c:if>
</body>
</html>