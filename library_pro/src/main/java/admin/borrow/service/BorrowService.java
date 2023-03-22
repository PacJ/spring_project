package admin.borrow.service;

import java.util.List;

import admin.borrow.dto.BorrowDTO;
import print.dto.PageDTO;

public interface BorrowService {
	public List<BorrowDTO> printBorrowService(PageDTO pv);
	public int countBorrowService();
}
