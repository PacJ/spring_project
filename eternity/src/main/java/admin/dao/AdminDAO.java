package admin.dao;

import java.util.List;

import admin.dto.AdminDTO;
import admin.dto.adminAuthInfo;
import user.dto.UserDTO;



public interface AdminDAO {
	
	// 관리자 추가
	public int addAdmin(AdminDTO dto);
	public AdminDTO selectByAdminId(adminAuthInfo auth);
	//관리자 수정(비밀번호 변경)
	public void updateAdmin(AdminDTO dto);
	
	// 관리자 삭제

	public int idcheck(String adminId);
	public List<AdminDTO> printAdmin();
	public List<UserDTO> printUser();
	public void deleteUserData(String user_id);
	public void deleteAdminData(String admin_id);
	public List<UserDTO>searchUserDataById(String user_id);
	public List<AdminDTO> searchAdminDataById(String admin_id);
	public List<UserDTO> searchUserDataByName(String user_name);
	public List<AdminDTO> searchAdminDataByName(String admin_name);
	
}
