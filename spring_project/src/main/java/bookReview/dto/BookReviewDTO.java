package bookReview.dto;

import java.util.Date;

import user.dto.UserDTO;

public class BookReviewDTO {
	private int reviewKeynum;
	private String isbn;
	private String userId;
	private int starNum;
	private String reviewContents;
	private Date reviewDate;
	
	public BookReviewDTO() {
	}

	public int getReviewKeynum() {
		return reviewKeynum;
	}

	public void setReviewKeynum(int reviewKeynum) {
		this.reviewKeynum = reviewKeynum;
	}


	public int getStarNum() {
		return starNum;
	}

	public void setStarNum(int starNum) {
		this.starNum = starNum;
	}

	public String getReviewContents() {
		return reviewContents;
	}

	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}

	public Date getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(Date reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	
	
}
