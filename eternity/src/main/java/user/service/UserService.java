package user.service;

import user.dto.AuthInfo;
import user.dto.UserDTO;

public interface UserService {
	
//	회원가입(유저 추가)
	public AuthInfo addUserProcess(UserDTO dto);

//	로그인 처리
	public UserDTO loginProcess(AuthInfo authinfo);
	
//	DB에서 유저 정보 수정
	public UserDTO updateUserProcess(String userId);
	
//	업데이트된 사용자 정보를 현재 세션에 적용
	public AuthInfo updateUserProcess(UserDTO dto);
	
//	회원 탈퇴
	public AuthInfo deleteUserProcess(String userId);
	
	//중복확인
	public int idcheck(String userId);

}
