package user.my.recommend.dto;

public class UserRecommendDTO {

	private String isbn;
	private String title;
	
	public UserRecommendDTO() {
		// TODO Auto-generated constructor stub
	}

	public UserRecommendDTO(String isbn, String title) {
		super();
		this.isbn = isbn;
		this.title = title;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	} 
	
	
	
}
