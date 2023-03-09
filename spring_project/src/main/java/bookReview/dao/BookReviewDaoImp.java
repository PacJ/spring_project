package bookReview.dao;

import org.mybatis.spring.SqlSessionTemplate;

import bookReview.dto.BookReviewDTO;

public class BookReviewDaoImp implements BookReviewDAO{
	private SqlSessionTemplate sqlSession;
	
	public BookReviewDaoImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void save(BookReviewDTO dto) {
		sqlSession.insert("review.addReview", dto);
	}

	@Override
	public void update(BookReviewDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		
	}

}
