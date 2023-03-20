package user.service;



import user.dao.UserDAO;
import user.dto.AuthInfo;
import user.dto.UserDTO;


// 유저 관련 서비스: 회원가입,	로그인, 정보수정, 회원탈퇴. DB에 정보를 insert, select, update, delete 한다.
// AuthInfo: 회원의 정보값을 세션에 저장 하기 위해 사용.
public class UserServiceImp implements UserService{
	private UserDAO userDao;
	
	public UserServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setUserDao(UserDAO userDao) {
		this.userDao = userDao;
	}
	
	// 유저 추가
	@Override
	public AuthInfo addUserProcess(UserDTO dto) {
		userDao.insertUser(dto);
		
		return new AuthInfo(dto.getUser_id(), dto.getUser_password());
	}

   // 유저 로그인
   @Override
   public UserDTO loginProcess(AuthInfo authInfo) {
      UserDTO user = userDao.selectByUserId(authInfo);
      return user;
   }

	//유저 ID별로 선택
	@Override
	public UserDTO selectUserProcess(String user_id) {
		return userDao.selectByUserIdString(user_id);
	}
	
    // 회원가입시 유저 아이디 중복 체크
	//public UserDTO
	// 유저 정보 수정
	@Override
	public UserDTO updateUserProcess(String userId) {
		// TODO Auto-generated method stub
		return null;
	}

	// 유저 수정(유저 정보를 세션에 저장하기 위해 인증 정보 형태로 리턴)
	// 유저 정보 수정
	@Override
	public AuthInfo updateUserProcess(UserDTO dto) {
		userDao.updateUser(dto);
		UserDTO user = userDao.selectByUserIdString(dto.getUser_id());
		return new AuthInfo(user.getUser_id(), user.getUser_password(), user.getUser_name());
	}

	// 유저 삭제
	@Override
	public void deleteUserProcess(String userId) {
		userDao.deleteUser(userId);
	}
	
	@Override
	public int idcheck(String userId) {
		// TODO Auto-generated method stub
		System.out.println("서비스 실행됨");
		System.out.println(userId);
		return userDao.idcheck(userId);
	}


}
