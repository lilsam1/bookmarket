<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >

<meta charset="UTF-8">
<title>도서 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String booktid = request.getParameter("booktid");
	
		String sql = "select * from book where booktid = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, booktid);
		rs = pstmt.executeQuery();
		if (rs.next()) {
	%>
	<div class="container">
		<div class="text-right">
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
		<form name="newProduct" action="./processUpdateBook.jsp" class="form-horizontal" method="post"
		enctype="multipart/form-data">
			<input type="hidden" id="booktid" name="booktid" class="form-control" value="<%=rs.getString("booktid")%>">
			<div class="form-group row">
				<label class="col-sm-3">도서명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control"
					value="<%=rs.getString("name")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control"
					value="<%=rs.getInt("unitPrice")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">상세 정보</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" 
					class="form-control"><%=rs.getString("description")%></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">저자</label>
				<div class="col-sm-3">
					<input type="text" name="author" class="form-control"
					value="<%=rs.getString("author")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">장르</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control"
					value="<%=rs.getString("category")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">출판사</label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control"
					value="<%=rs.getString("publisher")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">분류</label>
				<div class="col-sm-3">
					<input type="text" name="condition" class="form-control" 
					value="<%=rs.getString("condition")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">재고 수</label>
				<div class="col-sm-3">
					<input type="text" id="unitsinStock" name="unitsinStock" class="form-control"
					value="<%=rs.getLong("unitsinStock")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">총 페이지 수</label>
				<div class="col-sm-3">
					<input type="text" id="totalPages" name="totalPages" class="form-control"
					value="<%=rs.getLong("totalPages")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">출판일</label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control"
					value="<%=rs.getString("releaseDate")%>">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">상태</label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New" <% if (rs.getString("condition").equals("New")) out.print("checked");%>> 신규 도서 
					<input type="radio" name="condition" value="Old" <% if (rs.getString("condition").equals("Old")) out.print("checked");%>> 중고 도서 
					<input type="radio" name="condition" value="eBook" <% if (rs.getString("condition").equals("eBook")) out.print("checked");%>> e-book 
				</div>
			</div>
			<div class="form-group row">
			<label class="col-sm-3">이미지</label>
				<div class="col-sm-7">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="수정" >
				</div>
			</div>
		</form>
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
</body>
</html>