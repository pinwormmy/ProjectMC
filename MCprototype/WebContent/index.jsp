<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.ProductDTO"%>
<%@ page import="service.ProductService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>밀슐랭 프로토타입</title>
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet" href="css/responsive.css">
<script src="js/vendor/modernizr-2.6.2.min.js"></script>
<script src="js/vendor/jquery-1.10.2.min.js"></script>
<script src="js/jquery.nav.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/main.js"></script>
</head>
<body>

<c:if test="${member == null}">
	<div class="login">
	<form action="login.gg" method="post">
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
<section id="hero-area">
	<img class="img-responsive" src="images/header.jpg" alt="">
</section>

<h1>밀슐랭 프로토타입 예습</h1>
예상치보다 너무 적게 만들었네...프로젝트때 이 속도 감안해야함<br>
다른것보다 컨트롤러 구조 빨리 파악해야함<br>
그리고 ui구현(디자인) 너무 몰라서 컨트롤러 다음 바로 익히기<br>

<button onclick="location.href='list.jsp'">유동닉 방명록으로</button>
<hr>

<c:forEach var="productList" items="${productList}">
	<img src="images/t_하울정식.jpg"><br>
	상품명 : ${productList.pName}<br>
	가격 : ${productList.price}<br>
	<br>
</c:forEach>

<c:if test="${member.mLevel == 2}">
<button onclick="location.href='addProduct.jsp'">상품 등록</button><br>
</c:if>

</body>
</html>