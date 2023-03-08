package user.service;

import user.dto.AuthInfo;
import user.dto.UserDTO;

public interface UserService {
	
//	회원가입(유저 추가)
	public AuthInfo addUserProcess(UserDTO dto);
	
//  중복아이디 체크
	public UserDTO checkIdDuplicate(String id);
	
//	로그인 처리
	public AuthInfo loginProcess(UserDTO dto);
	
//	DB에서 유저 정보 수정
	public UserDTO updateUserProcess(String userId);
	
//	업데이트된 사용자 정보를 현재 세션에 적용
	public AuthInfo updateUserProcess(UserDTO dto);
	
//	회원 탈퇴
	public AuthInfo deleteUserProcess(String userId);
	

}
