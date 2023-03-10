package bookReview.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import bookReview.dto.BookReviewDTO;
import bookReview.dto.PageDTO;

public class BookReviewDaoImp implements BookReviewDAO{
	private SqlSessionTemplate sqlSession;
	
	public BookReviewDaoImp() {
		// TODO Auto-generated constructor stub
	}

	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 총 후기 수
	@Override
	public int count() {
		return sqlSession.selectOne("review.count");
	}
	
	// 저장
	@Override
	public void save(BookReviewDTO dto) {
		sqlSession.insert("review.addReview", dto);
	}

	// 출력
	@Override
	public List<BookReviewDTO> reviewList(PageDTO pv) {
		return sqlSession.selectList("review.list", pv);
	}
	
	// 후기 수정
	@Override
	public void update(BookReviewDTO dto) {
		// TODO Auto-generated method stub
		
	}

	// 후기 삭제
	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

	// 후기 return
	@Override
	public BookReviewDTO review(int num) {
		// TODO Auto-generated method stub
		return null;
	}



}
