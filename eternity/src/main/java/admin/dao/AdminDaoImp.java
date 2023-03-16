package admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import admin.dto.AdminDTO;
import admin.dto.adminAuthInfo;
import user.dto.UserDTO;

public class AdminDaoImp implements AdminDAO {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int addAdmin(AdminDTO dto) {
		return sqlSession.insert("admin.addAdmin", dto);
	}

	@Override
	public AdminDTO selectByAdminId(adminAuthInfo auth) {
		return sqlSession.selectOne("admin.selectByadmin_id", auth);
	}

	@Override
	public void updateAdmin(AdminDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public int idcheck(String adminId) {
		// TODO Auto-generated method stub
		System.out.println("dao imp 실행됨");
		return sqlSession.selectOne("admin.idcheck", adminId);
	}

	@Override
	public List<AdminDTO> printAdmin() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.printAdmin");
	}

	@Override
	public List<UserDTO> printUser() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.printUser");
	}

	@Override
	public void deleteUserData(String user_id) {
		// TODO Auto-generated method stub
		sqlSession.delete("admin.deleteUser", user_id);

	}

	@Override
	public void deleteAdminData(String admin_id) {
		// TODO Auto-generated method stub
		System.out.println("dao");
		sqlSession.delete("admin.deleteAdmin", admin_id);

	}

	@Override
	public List<UserDTO> searchUserDataById(String user_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.searchUserById", user_id);

	}

	@Override
	public List<AdminDTO> searchAdminDataById(String admin_id) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.searchAdminById", admin_id);
	}

	@Override
	public List<UserDTO> searchUserDataByName(String user_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.searchUserByName", user_name);
	}

	@Override
	public List<AdminDTO> searchAdminDataByName(String admin_name) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("admin.searchAdminByName", admin_name);
	}

}
