package user.dto;


public class AuthInfo {
	private String userId;
	private String userPassword;
	private String userName;
	
	public AuthInfo() {
		
	}

	public AuthInfo(String userId, String userPassword) {
		this.userId = userId;
		this.userPassword = userPassword;
	}
	
	public AuthInfo(String userId, String userPassword, String userName) {
		this.userId = userId;
		this.userPassword = userPassword;
		this.userName = userName;
	}
	
	public String getUserId() {
		return userId;
	}

	public String getUserPassword() {
		return userPassword;
	}
	
	public String getUserName() {
		return userName;
	}

}
