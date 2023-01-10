<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.io.File" %>
<%@ page import="java.sql.*" %>
<%@ include file="../inc/dbconn.jsp" %>

<%
	request.setCharacterEncoding("UTF-8");

	String realPath = request.getServletContext().getRealPath("resources/images");	// 파일이 저장될 경로
	File dir = new File(realPath);	// dir: directory
	if (!dir.exists()) {	// 지정된 경로에 디렉토리(폴더)가 있는지 확인
		dir.mkdirs();	// 해당되는 폴더가 없으면 폴더 생성
	}
	
	String filename = "";
	String encType = "utf-8";	// 인코딩 타입
	int maxSize = 5 * 1024 * 1024;	// 최대 업로드될 파일의 크기 5Mb
	
	MultipartRequest multi = new MultipartRequest(request, realPath, maxSize, encType, new DefaultFileRenamePolicy());

	String booktid = multi.getParameter("booktid");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String author = multi.getParameter("author");
	String description = multi.getParameter("description");
	String publisher= multi.getParameter("publisher");
	String category= multi.getParameter("category");
	String unitsinStock = multi.getParameter("unitsinStock");
	String totalPages = multi.getParameter("totalPages");
	String releaseDate = multi.getParameter("releaseDate");
	String condition = multi.getParameter("condition");
	
	Integer price;
	
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	Integer pages;
	
	if (totalPages.isEmpty())
		pages = 0;
	else
		pages = Integer.valueOf(totalPages);
	
	long stock;
	
	if (unitsinStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsinStock);
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	String sql = "select * from book where booktid = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, booktid);
	rs = pstmt.executeQuery();
	
	if (rs.next()) {
		if (fileName != null) {
			sql = "UPDATE book SET name=?, unitPrice=?, author=?, description=?, publisher=?, category=?, " 
				+ "unitsinStock=?, totalPages=?, releaseDate=?, `condition`=?, filename=? WHERE booktid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setLong(7, stock);
			pstmt.setInt(8, pages);
			pstmt.setString(9, releaseDate);
			pstmt.setString(10, condition);
			pstmt.setString(11, fileName);
			pstmt.setString(12, booktid);
			pstmt.executeUpdate();
		} else {
			sql = "UPDATE book SET name=?, unitPrice=?, author=?, description=?, publisher=?, category=?, " 
					+ "unitsinStock=?, totalPages=?, releaseDate=?, `condition`=? WHERE booktid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setInt(2, price);
			pstmt.setString(3, author);
			pstmt.setString(4, description);
			pstmt.setString(5, publisher);
			pstmt.setString(6, category);
			pstmt.setLong(7, stock);
			pstmt.setInt(8, pages);
			pstmt.setString(9, releaseDate);
			pstmt.setString(10, condition);
			pstmt.setString(11, booktid);
			pstmt.executeUpdate();
		}		
	}

	if (rs != null)
		rs.close();
	if (pstmt != null)
		pstmt.close();
	if (conn != null)
		conn.close();
	
	response.sendRedirect("editBook.jsp?edit=update");
	
%>