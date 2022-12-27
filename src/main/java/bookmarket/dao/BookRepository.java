package bookmarket.dao;

import java.util.ArrayList;

import bookmarket.dto.Book;

public class BookRepository {
	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	private static BookRepository instance = new BookRepository();	//
	
	public static BookRepository getInstance() {	//
		return instance;
	}
	
	public BookRepository() {
		Book history = new Book("B1111", "총, 균, 쇠", 11000);
		history.setAuthor("제러드 다이아몬드");
		history.setCategory("사회과학");
		history.setDescription("서울대 도서관 대출 1위 도서 : 문명의 발달을 좌우하는 필수요소에 대한 의미있는 고찰");
		history.setPublisher("문학사상");
		history.setTotalPages(752);
		history.setUnitsinStock(100);
		history.setReleaseDate("2018/03/07");
		history.setCondition("신규도서");
		history.setFilename("B1111.jpg");
		
		Book novel = new Book("B1112", "해리포터와 불의 잔", 35000);
		novel.setAuthor("j.k.롤링");
		novel.setCategory("소설");
		novel.setDescription("해리포터 시리즈의 네 번째 권");
		novel.setPublisher("문학수첩");
		novel.setTotalPages(1200);
		novel.setUnitsinStock(120);
		novel.setReleaseDate("2017/03/07");
		novel.setCondition("중고도서");
		novel.setFilename("B1112.jpg");
		
		Book it = new Book("B1113", "자바의 정석", 22000);
		it.setAuthor("남궁성");
		it.setCategory("IT");
		it.setDescription("코딩을 처음 배우는 사람을 위한 입문서");
		it.setPublisher("도우출판");
		it.setTotalPages(300);
		it.setUnitsinStock(50);
		it.setReleaseDate("2020/03/07");
		it.setCondition("e-book");
		it.setFilename("B1113.jpg");
		
		listOfBooks.add(history);
		listOfBooks.add(novel);
		listOfBooks.add(it);
	}
	
	public ArrayList<Book> getAllProducts() {
		return listOfBooks;
	}
	
	public Book getBookById(String booktId) {
		Book bookById = null;
		
		for (int i =  0; i < listOfBooks.size(); i++) {
			Book book = listOfBooks.get(i);
			if (book != null && book.getBooktid() != null && book.getBooktid().equals(booktId)) {
				bookById = book;
				break;
			}
		}
		return bookById;
	}
	
	public void addBook(Book book) {	//
		listOfBooks.add(book);
	}
	
}
