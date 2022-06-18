<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.ProductDTO"%>
<%@ page import="service.ProductService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	ProductService productService = ProductService.getInstance();
	List<ProductDTO> productList = new ArrayList<ProductDTO>();
	productList = productService.showProductList();
	
	session.setAttribute("productList", productList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀슐랭 프로토타입</title>
</head>
<body>

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
	${member.mName} 님이 로그인 중입니다. <button onclick="location.href='logout.jsp'">로그아웃</button><br>
</c:if>

<hr>

<h1>빠릿빠릿하게 만들어보자</h1>
mvc적용 안하고 막짜는 중...일단 속공으로 다 짜고 보자(그대로 프로젝트 돌입할 것으로 보임..;) <br>
글편집기는 db단계 수정하고 적용해야할듯? 썸네일 등록도 일단 보류.<br>
사진업로드 구현 중에서 post 적용에서 막힘.(get으로 구현했던걸 폼태그만 바꾸니까 데이터가 안넘어감)<br>
MVC 적용이랑 부트스트랩 적용정도 해보고 넘어가기<br>

<button onclick="location.href='list.jsp'">유동닉 방명록으로</button>

<hr>

<c:forEach var="productList" items="${productList}">
	(썸네일 사진~~~)<br>
	상품명 : ${productList.pName}<br>
	가격 : ${productList.price}<br>
	<br>
</c:forEach>

<c:if test="${member.mLevel == 2}">
<button onclick="location.href='addProduct.jsp'">상품 등록</button><br>
</c:if>

</body>
</html>