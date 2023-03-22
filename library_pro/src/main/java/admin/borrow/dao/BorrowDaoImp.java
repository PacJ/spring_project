package admin.borrow.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.borrow.dto.BorrowDTO;
import print.dto.PageDTO;

public class BorrowDaoImp implements BorrowDAO{
	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public List<BorrowDTO> printBorrow(PageDTO pv) {
		// TODO Auto-generated method stub
		System.out.println(sqlSession.selectList("printBorrow",pv));
		return sqlSession.selectList("printBorrow",pv);
	}
	@Override
	public int countBorrow() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("countBorrow");
	}
}
