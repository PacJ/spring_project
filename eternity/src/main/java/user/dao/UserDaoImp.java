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
	public void deleteUser(String userId) {
		sqlSession.delete("user.deleteUser", userId);
	}
	
	@Override
	public int idcheck(String adminId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public UserDTO selectByUserIdString(String user_id) {
		return sqlSession.selectOne("user.selectByUserIdString", user_id);
	}

}
