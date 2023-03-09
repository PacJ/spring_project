package bookList.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class BookListDaoImp implements BookListDAO{
	private SqlSessionTemplate sqlSession;
	
	public BookListDaoImp() {
		
	}

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int readCount(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

}
