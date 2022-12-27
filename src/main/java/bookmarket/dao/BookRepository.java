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
		Book history = new Book("B1111", "��, ��, ��", 11000);
		history.setAuthor("������ ���̾Ƹ��");
		history.setCategory("��ȸ����");
		history.setDescription("����� ������ ���� 1�� ���� : ������ �ߴ��� �¿��ϴ� �ʼ���ҿ� ���� �ǹ��ִ� ����");
		history.setPublisher("���л��");
		history.setTotalPages(752);
		history.setUnitsinStock(100);
		history.setReleaseDate("2018/03/07");
		history.setCondition("�űԵ���");
		history.setFilename("B1111.jpg");
		
		Book novel = new Book("B1112", "�ظ����Ϳ� ���� ��", 35000);
		novel.setAuthor("j.k.�Ѹ�");
		novel.setCategory("�Ҽ�");
		novel.setDescription("�ظ����� �ø����� �� ��° ��");
		novel.setPublisher("���м�ø");
		novel.setTotalPages(1200);
		novel.setUnitsinStock(120);
		novel.setReleaseDate("2017/03/07");
		novel.setCondition("�߰���");
		novel.setFilename("B1112.jpg");
		
		Book it = new Book("B1113", "�ڹ��� ����", 22000);
		it.setAuthor("���ü�");
		it.setCategory("IT");
		it.setDescription("�ڵ��� ó�� ���� ����� ���� �Թ���");
		it.setPublisher("��������");
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
