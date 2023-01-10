<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../resources/css/bootstrap.min.css" >
<meta charset="UTF-8">
<title>도서 편집</title>
<script type="text/javascript">
	function deleteConfirm(booktid) {
		if (confirm("해당 도서를 삭제합니다") == true)
			location.href = "./deleteBook.jsp?booktid="  + booktid;
		else
			return;
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
	<jsp:include page="../inc/menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 편집</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
		<%@ include file="../inc/dbconn.jsp"%>
			<%
				String sql = "select * from book";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="${pageContext.request.contextPath}/resources/images/<%=rs.getString("filename")%>" style="width : 100%">
				<h3><%=rs.getString("name")%></h3>
				<p><%=rs.getString("description")%></p>
				<p><%=rs.getString("unitPrice")%>원
				<p>
					<%
						if (edit.equals("update")) {
					%>
					<a href="./updateBook.jsp?booktid=<%=rs.getString("booktid")%>" class="btn btn-success" role="button">
					수정 &raquo;</a>
					<%
						} else if  (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("booktid")%>')" class="btn btn-danger" role="button">
					삭제 &raquo;</a>
					<%
						}
					%>
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
		</div>
		<hr>
	</div>
	<jsp:include page="../inc/footer.jsp" />
</body>
</html>