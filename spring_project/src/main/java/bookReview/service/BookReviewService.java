package bookReview.service;

import bookReview.dto.BookReviewDTO;

public interface BookReviewService {
	public void saveProcess(BookReviewDTO dto);
	public void updateProcess(BookReviewDTO dto);
	public void deleteProcess(int num);
}
