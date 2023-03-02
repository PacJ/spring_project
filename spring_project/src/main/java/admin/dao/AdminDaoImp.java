package admin.dao;

import org.apache.ibatis.session.SqlSession;

import admin.dto.AdminDTO;
import user.dto.AuthInfo;

public class AdminDaoImp implements AdminDAO{

	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int addAdminProcess(AdminDTO dto) {
		return sqlSession.insert("admin.addAdmin", dto);
	}

	@Override
	public void updateAdminProcess(AdminDTO dto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteAdmin(AdminDTO dto) {
		// TODO Auto-generated method stub
		
	}


	

}
