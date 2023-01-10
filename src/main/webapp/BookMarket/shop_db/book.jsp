<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookmarket.dto.Book" %>
<%@ page import="bookmarket.dao.BookRepository" %>
<%@ page errorPage="exceptionNoBookId.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css
" rel="stylesheet" >
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")) {
			document.addForm.submit();
		}
		else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="../inc/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%@ include file="../inc/dbconn.jsp" %>
	<%
		String id = request.getParameter("id");
		BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById(id);
	%>
	<%
		String booktid = request.getParameter("booktid");
		
		String sql = "select * from book where booktid = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, booktid);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("filename")%>"
				style="width: 100%" />
			</div>
			<div class="col-md-6">
				<h3><%=rs.getString("name")%></h3>
				<p><%=rs.getString("description")%></p>
				<p><b>상품 코드 : </b><span class="badge badge-danger"> <%=rs.getString("booktid") %></span></p>
				<p><b>작가</b> : <%=rs.getString("author")%></p>
				<p><b>장르</b> : <%=rs.getString("category")%></p>
				<p><b>분류</b> : <%=rs.getString("condition")%></p>
				<p><b>출판사</b> : <%=rs.getString("publisher")%></p>
				<p><b>출판일</b> : <%=rs.getString("releaseDate")%></p>
				<p><b>페이지수</b> : <%=rs.getString("totlaPages")%></p>
				<p><b>재고</b> : <%=rs.getString("unitsinStock")%></p>
				<h4><%=rs.getString("unitPrice")%>원</h3>
				<form name="addForm" action="./addCart.jsp?id=<%=book.getBooktid()%>" method="post">
				<a href="#" class="btn btn-info" onclick="addToCart()"> 도서 주문 &raquo;</a>
				<a href="./cart.jsp" class="btn btn-warning" > 장바구니 &raquo;</a>
				<a href="./books.jsp" class="btn btn-secondary"> 도서 목록 &raquo;</a>
				</form>
			</div>
		</div>
		<%
				}
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		%>
		<hr>
	</div>
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>