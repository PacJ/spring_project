package bookReview.service;

import java.util.List;

import bookReview.dao.BookReviewDAO;
import bookReview.dto.BookReviewDTO;
import bookReview.dto.PageDTO;

public class BookReviewServiceImp implements BookReviewService{

	private BookReviewDAO bookReviewDao;
	
	public void setBookReviewDao(BookReviewDAO bookReviewDao) {
		this.bookReviewDao = bookReviewDao;
	}
	
	public BookReviewServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	
	@Override
	public void saveProcess(BookReviewDTO dto) {
		bookReviewDao.save(dto);
	}

	@Override
	public void updateProcess(BookReviewDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteProcess(int num) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<BookReviewDTO> reviewListProcess(PageDTO pv) {
		return bookReviewDao.reviewList(pv);
	}

	@Override
	public int countProcess() {
		return bookReviewDao.count();
	}
}
