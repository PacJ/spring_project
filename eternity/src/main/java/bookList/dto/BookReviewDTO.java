package bookList.dto;

import java.util.Date;

public class BookReviewDTO {
	private int review_keynum;
	private String isbn;
	private String user_id;
	private int star_num;
	private String review_contents;
	private Date review_date;
	
	public BookReviewDTO() {
	}

	public int getReview_keynum() {
		return review_keynum;
	}

	public void setReview_keynum(int review_keynum) {
		this.review_keynum = review_keynum;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getStar_num() {
		return star_num;
	}

	public void setStar_num(int star_num) {
		this.star_num = star_num;
	}

	public String getReview_contents() {
		return review_contents;
	}

	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}

	public Date getReview_date() {
		return review_date;
	}

	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	
	
}
