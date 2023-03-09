package bookList.service;

import bookList.dto.BookListDTO;

public interface BookListService {
	public void insertProcess(BookListDTO dto);
	public BookListDTO updateSelectProcess(int num);
	public void deleteProcess(int num, String path);
}
