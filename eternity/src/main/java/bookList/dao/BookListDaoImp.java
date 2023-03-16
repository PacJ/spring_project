package bookList.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import bookList.dto.BookListDTO;
import bookList.dto.BookReviewDTO;
import bookList.dto.PageDTO;

public class BookListDaoImp implements BookListDAO{
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public BookListDTO selectBook(String isbn) {
		return sqlSession.selectOne("bookList.isbn", isbn);
	}
	
	// 총 후기 수
	@Override
	public int count() {
		return sqlSession.selectOne("bookList.count");
	}

	// 후기 출력
	@Override
	public List<BookReviewDTO> reviewList(PageDTO pv) {
		return sqlSession.selectList("bookList.reviewList", pv);
	}

	// 후기 저장
	@Override
	public void save(BookReviewDTO dto) {
		sqlSession.insert("bookList.addReview", dto);
	}

	// 후기 수정
	@Override
	public void update(BookReviewDTO dto) {
		sqlSession.selectList("bookList.updateReview", dto);
	}

	// 후기 삭제
	@Override
	public void delete(int num) {
		sqlSession.delete("bookList.deleteReview", num);
	}


}
