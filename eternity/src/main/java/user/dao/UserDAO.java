package user.dao;

import user.dto.AuthInfo;
import user.dto.UserDTO;

public interface UserDAO {
	
	// 유저 추가
	public int insertUser(UserDTO dto);
	
	// 유저 ID별로 선택
	public UserDTO selectByUserId(AuthInfo authInfo);
	
	// 유저 ID별로 선택(String)
	public UserDTO selectByUserIdString(String user_id);
	
	// 유저 정보 수정
	public void updateUser(UserDTO dto);
	
	// 유저 삭제
	public void deleteUser(String userId);
	
	//중복 확인
	public int idcheck(String adminId);
	
	
}
