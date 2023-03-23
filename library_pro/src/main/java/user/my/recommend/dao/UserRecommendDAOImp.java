package user.my.recommend.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import user.my.recommend.dto.BookmanageDTO;
import user.my.recommend.dto.UserRecommendDTO;

public class UserRecommendDAOImp implements UserRecommendDAO {

	private SqlSessionTemplate sqlSession;
	
	public UserRecommendDAOImp() {
		// TODO Auto-generated constructor stub
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//유저이름
	@Override
	public String userName(String user_keynum) {
		return sqlSession.selectOne("userRecommend.userName", user_keynum);
	}

	//마지막으로 반납한 도서
	@Override
	public UserRecommendDTO lastBook(String user_keynum) {
		return sqlSession.selectOne("userRecommend.lastBook", user_keynum);
	}

	@Override
	public BookmanageDTO bookInfo(String isbn) {
		return sqlSession.selectOne("userRecommend.bookInfo", isbn);
	}


}
