package bookReview.dao;

import java.util.List;

import bookReview.dto.BookReviewDTO;
import bookReview.dto.PageDTO;

public interface BookReviewDAO {
	
	// 총 후기 갯수(row)구하기
	public int count();
	
	// 데이터(row)목록 Select, list로 받아오기
	public List<BookReviewDTO> reviewList(PageDTO pv);
	
	// 후기 읽기
	public BookReviewDTO review(int num);
	
	// 후기 작성
	public void save(BookReviewDTO dto);
	
	// 후기 수정
	public void update(BookReviewDTO dto);
	
	// 후기 삭제
	public void delete(int num);
}
