<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="bookmarket.dto.Book" %>
<%@ page import="bookmarket.dao.BookRepository" %>

<%
	// 아이디 값 파라미터
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("Products.jsp");
		return;
	}
	
	BookRepository dao = BookRepository.getInstance();
	
	Book book = dao.getBookById(id);
	if (book == null) {
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	// 요청 파리미터 아이디의 상품을 담은 장바구니를 초기화 하도록 작성
	ArrayList<Book> list = (ArrayList<Book>) session.getAttribute("cartlist");
	if (list == null) {
		list = new ArrayList<Book>();
		session.setAttribute("cartlist", list);
	}
	
	int cnt = 0;	// 기존 장바구니에 담긴 상품인지 확인하기 위한 용도
	Book goodsQnt = new Book();
	for (int i = 0; i < list.size(); i++) {
		goodsQnt = list.get(i);
		if (goodsQnt.getBooktid().equals(id)) {	// 해당되는 물건이 장바구니에 있으면
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if (cnt == 0) {
		book.setQuantity(1);
		list.add(book);
	}
	
	response.sendRedirect("book.jsp?id=" + id);
%>