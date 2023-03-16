package bookList.service;

import java.util.List;

import bookList.dto.BookListDTO;
import bookList.dto.BookReviewDTO;
import bookList.dto.PageDTO;

public interface BookListService {
	public BookListDTO selectBookProcess(String isbn);
	public int countProcess();
	public List<BookReviewDTO> reviewListProcess(PageDTO pv);
	public void saveProcess(BookReviewDTO dto);
	public void updateProcess(BookReviewDTO dto);
	public void deleteProcess(int num);
	
}
