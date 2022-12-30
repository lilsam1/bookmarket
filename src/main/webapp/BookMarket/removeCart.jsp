<%@page import="bookmarket.dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bookmarket.dao.BookRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 장바구니에서 상품을 개별 삭제 */
	String id = request.getParameter("id");
	if (id == null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return;
	}
	
	BookRepository dao = BookRepository.getInstance();
	
	Book book = dao.getBookById(id);
	if (book == null) {
		response.sendRedirect("exceptionNoBookId.jsp");
	}
	
	ArrayList<Book> cartList = (ArrayList<Book>) session.getAttribute("cartlist");
	cartList.remove(book);
	
	response.sendRedirect("cart.jsp");
%>