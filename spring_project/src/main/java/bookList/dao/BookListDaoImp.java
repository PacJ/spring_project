package bookList.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class BookListDaoImp implements BookListDAO{
	private SqlSessionTemplate sqlSession;
	
	public BookListDaoImp() {
		
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
}
