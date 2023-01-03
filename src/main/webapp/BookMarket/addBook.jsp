<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css
" rel="stylesheet" >
<script src="./resources/js/validation.js"></script>
<meta charset="UTF-8">
<title>도서 등록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 등록</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-right">
			<a href="logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
		</div>
		<form name="newBook" action="./processAddBook.jsp" class="form-horizontal" method="post"
		enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-3">도서 코드</label>
				<div class="col-sm-3">
					<input type="text" id="booktid" name="booktid" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">도서명</label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">가격</label>
				<div class="col-sm-3">
					<input type="text" id="unitPrice" name="unitPrice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">상세 정보</label>
				<div class="col-sm-5">
					<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">저자</label>
				<div class="col-sm-3">
					<input type="text" name="author" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">장르</label>
				<div class="col-sm-3">
					<input type="text" name="category" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">출판사</label>
				<div class="col-sm-3">
					<input type="text" name="publisher" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">재고 수</label>
				<div class="col-sm-3">
					<input type="text" id="unitsinStock" name="unitsinStock" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">총 페이지수</label>
				<div class="col-sm-3">
					<input type="text" name="totalPages" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">출판일</label>
				<div class="col-sm-3">
					<input type="text" name="releaseDate" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-3">상태</label>
				<div class="col-sm-7">
					<input type="radio" name="condition" value="New"> 신규 도서
					<input type="radio" name="condition" value="Old"> 중고 도서
					<input type="radio" name="condition" value="eBook"> e-book
				</div>
			</div>
			
			<div class="form-group row">
			<label class="col-sm-3">이미지</label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록" >
				</div>
			</div>
		</form>
	</div>
</body>
</html>