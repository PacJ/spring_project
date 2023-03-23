package user.my.recommend.dao;

import user.my.recommend.dto.BookmanageDTO;
import user.my.recommend.dto.UserRecommendDTO;

public interface UserRecommendDAO {

	//유저이름
	public String userName(String user_keynum);
	
	//마지막으로 반납한 도서
	public UserRecommendDTO lastBook(String user_keynum);	
	
	//추천도서에 대한 정보
	public BookmanageDTO bookInfo(String isbn);	

}
