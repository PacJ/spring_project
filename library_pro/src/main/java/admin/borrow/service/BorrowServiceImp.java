package admin.borrow.service;

import java.util.List;

import admin.borrow.dao.BorrowDAO;
import admin.borrow.dto.BorrowDTO;
import admin.dao.AdminDAO;
import print.dto.PageDTO;

public class BorrowServiceImp implements BorrowService {

	private BorrowDAO borrowDao;

	// adminServiceBean을 생성하고 properties에서 호출.
	public void setBorrowDao(BorrowDAO borrowDao) {
		this.borrowDao = borrowDao;
	}

	@Override
	public List<BorrowDTO> printBorrowService(PageDTO pv) {
		// TODO Auto-generated method stub
		System.out.println(borrowDao.printBorrow(pv).size());
		return borrowDao.printBorrow(pv);
	}

	@Override
	public int countBorrowService() {
		// TODO Auto-generated method stub
		return borrowDao.countBorrow();
	}
}
