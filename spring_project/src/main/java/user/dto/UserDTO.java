package user.dto;

import java.util.Date;

public class UserDTO {
	private String userId;
	private String userPw;
	private String userName;
	private String userAddress;
	private String userPreference;
	private String userSex;
	private int userAge;
	private Date signDate;
	
	public UserDTO() {
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserSex() {
		return userSex;
	}

	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}

	public int getUserAge() {
		return userAge;
	}

	public void setUserAge(int userAge) {
		this.userAge = userAge;
	}

	public Date getSignDate() {
		return signDate;
	}

	public void setSignDate(Date signDate) {
		this.signDate = signDate;
	}

	public String getUserPreference() {
		return userPreference;
	}

	public void setUserPreference(String userPreference) {
		this.userPreference = userPreference;
	}
	
	public boolean matchPassword(String userPw) {
		return this.userPw.equals(userPw);
	}
}

