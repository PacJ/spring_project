package user.dao;

import user.dto.UserDTO;

public interface UserDAO {
	
	// 유저 추가
	public int insertUser(UserDTO dto);
	
	// 유저 ID별로 선택
	public UserDTO selectByUserId(String id);
	
	// 유저 정보 수정
	public void updateUser(UserDTO dto);
	
	// 유저 삭제
	public void deleteUser(UserDTO dto);
	
}
