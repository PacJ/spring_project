package userBookList.dto;

public class recBookDTO {
	private String bookname;
	private String isbn;
	private String author;
	private String pubYear;
	
	public recBookDTO(String bookname, String isbn, String author, String pubYear) {
		this.bookname = bookname;
		this.isbn = isbn;
		this.author = author;
		this.pubYear = pubYear;
	}

	public String getBookname() {
		return bookname;
	}

	public void setBookname(String bookname) {
		this.bookname = bookname;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getPubYear() {
		return pubYear;
	}

	public void setPubYear(String pubYear) {
		this.pubYear = pubYear;
	}
	
	
}
