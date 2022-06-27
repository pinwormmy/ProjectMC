<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="dto.ProductDTO"%>
<%@ page import="service.ProductService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


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
				아이디 : <input type="text" name="mId"> 비밀번호 : <input
					type="password" name="pw">
				<button>로그인</button>
				<a href="signUp.jsp">회원가입</a>
			</form>
		</div>
	</c:if>
	<c:if test="${member != null}">
	${member.mName} 님이 로그인 중입니다. <button
			onclick="location.href='logout.jsp'">로그아웃</button>
		<br>
	</c:if>
	<hr>
	<section id="hero-area">
		<img class="img-responsive" src="images/header.jpg" alt="">
	</section>

	<h1>밀슐랭 프로토타입 보조</h1>
	회원 관리 어느 수준까지 구현할지 물어보기<br> 
	사실상 다 끝났는데, 비밀번호 변경 그리고 회원정보 수정 어떻게 할지 검토<br> 
	다 할줄 알긴 알아야지, 그리고 다른 파트도 마찬가지!!<br> 
	짬짬히 머부터 할까? 그림 업로드 구현해보기<br>	

	<button onclick="location.href='list.jsp'">유동닉 방명록으로</button>
	<hr>
	<ul style="display: flex; flex-direction: row; flex-wrap: wrap; margin: 10px;">
		<c:forEach var="productList" items="${productList}">
			<li style="margin: 10px;"><img src="images/t_하울정식.jpg"><br> 
			상품명 : ${productList.pName}<br> 
		 	가격 : ${productList.price}<br>
				 <br>
			</li>
		</c:forEach>
	</ul>

	<c:if test="${member.mLevel == 2}">
		<button onclick="location.href='addProduct.jsp'">상품 등록</button>
		<br>
	</c:if>

</body>
</html>