<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bookmarket.dto.Book" %>
<%@ page import="bookmarket.dao.BookRepository" %>
<%@ page errorPage="exceptionNoBookId.jsp" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css
" rel="stylesheet" >
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		BookRepository dao = BookRepository.getInstance();
		Book book = dao.getBookById(id);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img src="${pageContext.request.contextPath}/resources/images/<%=book.getFilename()%>"
				style="width: 100%" />
			</div>
			<div class="col-md-6">
				<h3><%=book.getName()%></h3>
				<p><%=book.getDescription()%></p>
				<p><b>상품 코드 : </b><span class="badge badge-danger"> <%=book.getBooktid() %></span></p>
				<p><b>작가</b> : <%=book.getAuthor() %></p>
				<p><b>장르</b> : <%=book.getCategory() %></p>
				<p><b>분류</b> : <%=book.getCondition() %></p>
				<p><b>출판사</b> : <%=book.getPublisher() %></p>
				<p><b>출판일</b> : <%=book.getReleaseDate() %></p>
				<p><b>페이지수</b> : <%=book.getTotalPages() %></p>
				<p><b>재고</b> : <%=book.getUnitsinStock() %></p>
				<h4><%=book.getUnitPrice() %>원</h3>
				<a href="#" class="btn btn-info"> 도서 주문 &raquo;</a>
				<a href="./books.jsp" class="btn btn-secondary"> 도서 목록 &raquo;</a>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>