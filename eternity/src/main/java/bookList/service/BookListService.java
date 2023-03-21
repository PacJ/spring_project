package bookList.service;

import java.util.List;

import bookList.dto.BookListDTO;
import bookList.dto.BookReviewDTO;
import bookList.dto.PageDTO;

public interface BookListService {
	
	// ISBN으로 책 불러오기
	public BookListDTO selectBookProcess(String isbn);
	
	// 총 후기 수 출력
	public int countProcess();
	
	// 후기 리스트 불러오기
	public List<BookReviewDTO> reviewListProcess(PageDTO pv);
	
	// 후기 추가(저장)
	public void saveProcess(BookReviewDTO dto);
	
	// 후기 수정
	public void updateProcess(BookReviewDTO dto);
	
	// 후기 삭제
	public void deleteProcess(int num);
	
	// 후기 존재 여부(해당 책의)
	public int revCheckProcess(BookReviewDTO dto);
}
