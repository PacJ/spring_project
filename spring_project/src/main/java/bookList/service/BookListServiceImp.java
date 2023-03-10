package bookList.service;

import bookList.dao.BookListDAO;
import bookList.dto.BookListDTO;

public class BookListServiceImp implements BookListService{
	private BookListDAO bookListDao;
	
	public BookListServiceImp() {
		// TODO Auto-generated constructor stub
	}

	public void setBookListDao(BookListDAO bookListDao) {
		this.bookListDao = bookListDao;
	}
	
	@Override
	public void insertProcess(BookListDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BookListDTO updateSelectProcess(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteProcess(int num, String path) {
		// TODO Auto-generated method stub
		
	}

}
