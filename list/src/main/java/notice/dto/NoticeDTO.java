package notice.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class NoticeDTO {
	
	private int num;
	private char fix; // 중요공지여부 (Y/N)
	private String subject;
	private String content;
	private String upload_file; //파일 첨부
	private String upload_img; //사진 첨부
	private Date regdate;
	private int readcount;
	
	//로그인 세션 처리 시 수정할 예정
	private String adminid;
	private String adminname;
	
	private String datecheck; //작성날짜 확인용  //게시판 list에 New 띄울건데 안쓰면 지워도됨
	
	private int prenum; //이전글 번호
	private String presub; //이전글 제목
	private int nextnum; //이전글 번호
	private String nextsub; //다음글 제목
	
	//write페이지에서 파일첨부를 받아 처리해주는 멤버변수
	private MultipartFile filename;
	//write페이지에서 사진첨부를 받아 처리해주는 멤버변수
	private MultipartFile imgname;
	
	public NoticeDTO() {
		// TODO Auto-generated constructor stub
	}

	public NoticeDTO(int num, char fix, String subject, String content, String upload_file, String upload_img,
			Date regdate, int readcount, String adminid, String adminname, String datecheck, int prenum, String presub,
			int nextnum, String nextsub, MultipartFile filename, MultipartFile imgname) {
		super();
		this.num = num;
		this.fix = fix;
		this.subject = subject;
		this.content = content;
		this.upload_file = upload_file;
		this.upload_img = upload_img;
		this.regdate = regdate;
		this.readcount = readcount;
		this.adminid = adminid;
		this.adminname = adminname;
		this.datecheck = datecheck;
		this.prenum = prenum;
		this.presub = presub;
		this.nextnum = nextnum;
		this.nextsub = nextsub;
		this.filename = filename;
		this.imgname = imgname;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public char getFix() {
		return fix;
	}

	public void setFix(char fix) {
		this.fix = fix;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUpload_file() {
		return upload_file;
	}

	public void setUpload_file(String upload_file) {
		this.upload_file = upload_file;
	}

	public String getUpload_img() {
		return upload_img;
	}

	public void setUpload_img(String upload_img) {
		this.upload_img = upload_img;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getAdminid() {
		return adminid;
	}

	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}

	public String getAdminname() {
		return adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	public String getDatecheck() {
		return datecheck;
	}

	public void setDatecheck(String datecheck) {
		this.datecheck = datecheck;
	}

	public int getPrenum() {
		return prenum;
	}

	public void setPrenum(int prenum) {
		this.prenum = prenum;
	}

	public String getPresub() {
		return presub;
	}

	public void setPresub(String presub) {
		this.presub = presub;
	}

	public int getNextnum() {
		return nextnum;
	}

	public void setNextnum(int nextnum) {
		this.nextnum = nextnum;
	}

	public String getNextsub() {
		return nextsub;
	}

	public void setNextsub(String nextsub) {
		this.nextsub = nextsub;
	}

	public MultipartFile getFilename() {
		return filename;
	}

	public void setFilename(MultipartFile filename) {
		this.filename = filename;
	}

	public MultipartFile getImgname() {
		return imgname;
	}

	public void setImgname(MultipartFile imgname) {
		this.imgname = imgname;
	}

	
	

}
