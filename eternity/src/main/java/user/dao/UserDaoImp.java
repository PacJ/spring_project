package user.dao;

import org.apache.ibatis.session.SqlSession;

import user.dto.AuthInfo;
import user.dto.UserDTO;

public class UserDaoImp implements UserDAO{
	private SqlSession sqlSession;

	public UserDaoImp() {
	}
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int insertUser(UserDTO dto) {
		return sqlSession.insert("user.addUser", dto);
	}

	@Override
	public UserDTO selectByUserId(AuthInfo authinfo) {
		return sqlSession.selectOne("user.selectByUserId", authinfo);
	}

	@Override
	public void updateUser(UserDTO dto) {
		
	}

	@Override  
	public void deleteUser(UserDTO dto) {
		
	}
	@Override
	public int idcheck(String adminId) {
		// TODO Auto-generated method stub
		return 0;
	}

}
