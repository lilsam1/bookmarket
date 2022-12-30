<%@page import="bookmarket.dto.Book" %>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
	String cartId = session.getId();
%>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" >
<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td alingn="left"><span class="btn btn-danger" onclick="deleteCart();">삭제하기</span></td>
					<td align="right"><a href="./shippingInfo.jsp?cartId=<%= cartId%>" class="btn btn-success">주문하기</a></td>
				</tr>
			</table>
		</div>
		<div style="padding-top: 50px">
			<table class="table table-hover" >
				<tr>
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
				<%
					int sum = 0;
					ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
					if (cartList == null) {
						cartList = new ArrayList<Book>();
						session.setAttribute("cartlist", cartList);
					}
					
					for (int i = 0; i < cartList.size(); i++) {	// 상품리스트 하나씩 출력
						Book book = cartList.get(i);
						int total = book.getUnitPrice() * book.getQuantity();
						sum = sum + total;
				%>
				<tr>
					<td><%=book.getBooktid()%> - <%=book.getName() %></td>
					<td><%=book.getUnitPrice()%></td>
					<td><%=book.getQuantity()%></td>
					<td><%=total %></td>
					<td><span class="badge badge-danger" onclick="removeCartByID('<%=book.getBooktid()%>')">삭제</span></td>
				</tr>
				<%
					}
				%>
				<tr>
					<th></th>
					<th></th>
					<th>총액</th>
					<th><%=sum%></th>
					<th></th>
				</tr>
			</table>
			<a href="./books.jsp" class="btn btn-secondary"> &laquo; 쇼핑 계속하기</a>
		</div>
		<form name="frmCart" method="post">
			<input type="hidden" name="id">
		</form>
		<script>
			const frm = document.frmCart;
			let removeCartByID = function(ID) {
				if(confirm('삭제하시겠습니까?')) {
					frm.id.value = ID;
					frm.action = "removeCart.jsp";
					frm.submit();
				}
			}
			let deleteCart = function() {
				if(confirm('삭제하시겠습니까?')) {
					frm.action = "deleteCart.jsp";
					frm.submit();
				}
			}
		</script>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>