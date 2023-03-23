package user.my.recommend.service;

import java.util.List;

import user.my.recommend.dao.UserRecommendDAO;
import user.my.recommend.dto.BookmanageDTO;
import user.my.recommend.dto.UserRecommendDTO;

public class UserRecommendServiceImp implements UserRecommendService {
	
	private UserRecommendDAO reDAO;
	
	public UserRecommendServiceImp() {
		// TODO Auto-generated constructor stub
	}
	
	public void setReDAO(UserRecommendDAO reDAO) {
		this.reDAO = reDAO;
	}

	//유저이름
	@Override
	public String userNameProcess(String user_keynum) {
		return reDAO.userName(user_keynum);
	}
	
	//마지막으로 반납한 도서 isbn, title
	@Override
	public UserRecommendDTO lastBookProcess(String user_keynum) {
		return reDAO.lastBook(user_keynum);
	}

	@Override
	public BookmanageDTO bookInfoProcess(String isbn) {
		return reDAO.bookInfo(isbn);
	}


}
