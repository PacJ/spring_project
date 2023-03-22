package user.dao;

import org.w3c.dom.Element;

import user.dto.AuthInfo;
import user.dto.UserDTO;

public interface UserDAO {

	// 유저 추가
	public int insertUser(UserDTO dto);

	// 유저 ID별로 선택
	public UserDTO selectByUserId(AuthInfo authInfo);

	// 중복확인
	public int idcheck(String user_id);

	public UserDTO selectByUserIdString(String user_id);

	public String getKeynum(String id);

	// 주소 수정
	public void updateAddress(UserDTO dto);

	// 비밀번호 수정
	public void updatePass(UserDTO dto);

	// 유저 삭제
	public void deleteUser(String user_id);
	
	
	public String getTagValue(String tag, Element eElement);
}
