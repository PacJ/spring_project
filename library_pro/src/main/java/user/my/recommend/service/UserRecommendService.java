package user.my.recommend.service;

import user.my.recommend.dto.BookmanageDTO;
import user.my.recommend.dto.UserRecommendDTO;

public interface UserRecommendService {

	//유저이름 가져오기
	public String userNameProcess(String user_keynum); 
	
	//마지막 도서 isbn, 제목 가져오기
	public UserRecommendDTO lastBookProcess(String user_keynum); 
	
	//마지막 도서 isbn, 제목 가져오기
	public BookmanageDTO bookInfoProcess(String isbn); 
}
