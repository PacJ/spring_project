package admin.borrow.dao;

import java.util.List;

import admin.borrow.dto.BorrowDTO;
import print.dto.PageDTO;

public interface BorrowDAO {
	public List<BorrowDTO> printBorrow(PageDTO pv);
	public int countBorrow();
}
