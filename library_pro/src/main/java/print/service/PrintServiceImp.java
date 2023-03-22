package print.service;

import java.util.List;

import admin.bookmanage.dto.BookmanageDTO;
import print.dao.PrintDAO;
import print.dto.PageDTO;

public class PrintServiceImp implements PrintService{
	
	PrintDAO printDao;
	
	public void setPrintDao(PrintDAO dao) {
		this.printDao = dao;
	}
	@Override
	public List<BookmanageDTO> printAll(PageDTO pv) {
		// TODO Auto-generated method stub
		System.out.println("서비스 실행");
		return printDao.printAll(pv);
	}
	@Override
	public int countAll() {
		// TODO Auto-generated method stub
		return printDao.countAll();
	}


	@Override
	public List<BookmanageDTO> searchService(PageDTO pv, String query, String option, String cate) {
		// TODO Auto-generated method stub
		return printDao.search(pv, query, option, cate);
	}
	@Override
	public int countService(String query, String option, String cate) {
		// TODO Auto-generated method stub
		return printDao.count(query, option, cate);
	}
}
