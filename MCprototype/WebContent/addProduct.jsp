<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="dto.ProductTypeDTO"%>
<%@ page import="service.ProductService"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<% 
	ProductService productService = ProductService.getInstance();
	List<ProductTypeDTO> productTypeList = new ArrayList<ProductTypeDTO>();
	productTypeList = productService.loadProductType();
	
	session.setAttribute("productType", productTypeList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>

<form action="submitProduct.jsp">
	
	<select name="typeCode" required>
			<option value="" disabled selected>-- 선택 --</option>
		<c:forEach var="pType" items="${productType}">
			<option value="${pType.typeCode}">${pType.tName}</option>
		</c:forEach>
	</select><br>	
	브랜드 : <input type="text" name="brand"><br>
	상품명 : <input type="text" name="pName"><br>
	가격 : <input type="text" name="price"><br>
	수량 : <input type="text" name="quantity"><br>
	+그림 올리기<br>
	<div class="selectThumbnail">
		<label for="thumbnailPath">썸네일 이미지용</label><br> 
		<input type="file" id="thumbnail" name="thumbnail" />
		<div class="showThumbnailImage">
			<img src="" />
	</div>

		<script>
			$("#thumbnail").change(
				function() {
					if (this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".showThumbnailImage img").attr("src", data.target.result).width(300);
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
		</script>
	</div>
	
	<button>상품등록</button>
	<button onclick="location.href='index.jsp'">취소</button><br>
</form>
</body>
</html>