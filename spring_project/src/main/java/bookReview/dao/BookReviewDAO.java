package bookReview.dao;

import bookReview.dto.BookReviewDTO;

public interface BookReviewDAO {
	public void save(BookReviewDTO dto);
	public void update(BookReviewDTO dto);
	public void delete(int num);
}
