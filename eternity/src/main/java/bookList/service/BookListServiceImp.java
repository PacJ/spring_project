package bookList.service;

import java.util.List;

import bookList.dao.BookListDAO;
import bookList.dto.BookListDTO;
import bookList.dto.BookReviewDTO;
import bookList.dto.PageDTO;

public class BookListServiceImp implements BookListService{

	private BookListDAO bookListDao;
	
	public BookListServiceImp() {
		
	}
	
	public void setBookListDao(BookListDAO bookListDao) {
		this.bookListDao = bookListDao;
	}
	
	// ISBN으로 book 가져오기
	@Override
	public BookListDTO selectBookProcess(String isbn) {
		return bookListDao.selectBook(isbn);
	}
	
	@Override
	public int revCheckProcess(BookReviewDTO dto) {
		return bookListDao.revCheck(dto);
	}
	
	@Override
	public int countProcess() {
		return bookListDao.count();
	}

	@Override
	public List<BookReviewDTO> reviewListProcess(PageDTO pv) {
		return bookListDao.reviewList(pv);
	}

	@Override
	public void saveProcess(BookReviewDTO dto) {
		bookListDao.save(dto);
	}

	@Override
	public void updateProcess(BookReviewDTO dto) {
		bookListDao.update(dto);
	}

	@Override
	public void deleteProcess(int num) {
		bookListDao.delete(num);
	}


}
