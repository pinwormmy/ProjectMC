<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="service.ProductService"%>
<%@ page import="com.oreilly.servlet.MultipartRequest,com.oreilly.servlet.multipart.DefaultFileRenamePolicy,java.util.*,java.io.*" %>
<%@ page import="java.sql.*" %>

<jsp:useBean id="productDTO" class="dto.ProductDTO">
	<jsp:setProperty name="productDTO" property="*" />
</jsp:useBean>

<%	

/*
	String realFolder = "";
	String thumbnail = "";
	int maxSize = 1024*1024*5;
	String encType = "UTF-8";
	String savefile = "img";
	ServletContext scontext = getServletContext();
	realFolder = scontext.getRealPath(savefile);
	
	try{
	    MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
		Enumeration<?> files = multi.getFileNames();
		String file1 = (String)files.nextElement();
		thumbnail = multi.getFilesystemName(file1);
	} catch(Exception e) {
	    e.printStackTrace();
	}
	String fullpath = realFolder + "\\" + thumbnail;
	// 파일폴더 자동생성코드 아직 안넣음
*/
	ProductService productService = ProductService.getInstance();
	productService.submitProduct(productDTO);
	
%>


<head>
<title>상품 등록 처리</title>
</head>
<body>
<script>
location.href='index.jsp';
</script>
</body>
</html>
