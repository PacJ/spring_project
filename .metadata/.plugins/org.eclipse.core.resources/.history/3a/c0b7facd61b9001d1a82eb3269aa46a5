package admin.service;

import admin.dto.AdminDTO;
import user.dto.AuthInfo;
import user.dto.UserDTO;

public interface AdminService {
	//	회원가입(관리자 추가)
	public AuthInfo addAdminProcess(AdminDTO dto);
	
	//	로그인 처리
	public AuthInfo loginProcess(AdminDTO dto);
	
	//	DB에서 관리자 정보 수정
	public AdminDTO updateAdminProcess(String adminId);
	
	//	업데이트된 관리자 업로를 현재 세션에 적용
	public AuthInfo updateAdminProcess(AdminDTO dto);
	
	// 관리자 탈퇴
	public AuthInfo deleteAdminProcess(String adminId);
}
