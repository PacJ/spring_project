package bookReview.service;

import java.util.List;

import bookReview.dto.BookReviewDTO;
import bookReview.dto.PageDTO;

public interface BookReviewService {
	public int countProcess();
	public List<BookReviewDTO> reviewListProcess(PageDTO pv);
	public void saveProcess(BookReviewDTO dto);
	public void updateProcess(BookReviewDTO dto);
	public void deleteProcess(int num);
	
}
