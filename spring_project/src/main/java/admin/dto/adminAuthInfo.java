package admin.dto;

// 관리자 인증 정보를 저장
public class adminAuthInfo {
		private String adminId;
		private String adminPw;
		
		public adminAuthInfo() {
			
		}

		public adminAuthInfo(String adminId, String adminPw) {
			this.adminId = adminId;
			this.adminPw = adminPw;
		}

		public String getAdminId() {
			return adminId;
		}

		public String getAdminPw() {
			return adminPw;
		}
		
}
