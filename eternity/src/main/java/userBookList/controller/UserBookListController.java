package userBookList.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bookList.dto.BookListDTO;
import user.dto.AuthInfo;
import user.dto.UserDTO;
import user.service.UserService;
import userBookList.dto.UserBookListDTO;
import userBookList.service.UserBookListService;

@Controller
public class UserBookListController {
	
	private UserService userService;
	private UserBookListService userBookListService;
	
	public UserBookListController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setUserBookListService(UserBookListService userBookListService) {
		this.userBookListService = userBookListService;
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	//my/user 불러오기
	@RequestMapping(value = "my/user", method = RequestMethod.GET)
	public ModelAndView ShowMyUser(ModelAndView mav, HttpSession session, String user_id) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		
		System.out.println(authInfo.getUser_id());
		// 사용자 정보 조회
		UserDTO dto = userService.selectUserProcess(authInfo.getUser_id());
		mav.addObject("userDTO", dto);
		
		// 현재 대출/예약중인 도서 조회
		List<UserBookListDTO> CurrBookList = userBookListService.CurrBorrowListProcesss(dto.getUser_id());
		mav.addObject("CurrBookList", CurrBookList);
		
		// 대출 내역 조회
		List<UserBookListDTO> PastBookList = userBookListService.PastBorrowListProcesss(dto.getUser_id());
		mav.addObject("PastBookList", PastBookList);
		mav.setViewName("my/user");
	    return mav;
	}
	
	// 대출 신청
	@RequestMapping(value = "books/loan", method = RequestMethod.POST)
	public ModelAndView Borrow(HttpSession session, BookListDTO bdto, ModelAndView mav) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		UserBookListDTO udto = new UserBookListDTO();
		
		String LL = bdto.getLoan_state();
		System.out.println(LL);
		if(LL.equals("N")) {
			BookListDTO nbdto = userBookListService.TestProcess();
			mav.addObject("bdto", nbdto);
			String msg = "대출 실패! 대출 가능 상태가 아닙니다.";
			session.setAttribute("popupMessage", msg);
			mav.setViewName("redirect:/books/view");
			return mav;
		}
		
		System.out.println(authInfo.getUser_id());
		//대출 신청 프로세스
		udto.setUser_id(authInfo.getUser_id());
		udto.setBook_keynum(bdto.getBook_keynum());
		udto.setBook_category(bdto.getCategory_s());
		
		boolean chk = userBookListService.BorrowProcess(udto);
		//대출 성공시 프로세스
		if(chk == true) {	
			String msg = "대출 성공!";
			session.setAttribute("popupMessage", msg);
			BookListDTO nbdto = userBookListService.TestProcess();
			mav.addObject("bldto", nbdto);
			mav.setViewName("redirect:/books/view");
		}else {
			String msg = "대출 실패! 최대 대출/예약 권수를 초과합니다.";
			session.setAttribute("popupMessage", msg);
			//대출 실패시 프로세스
			BookListDTO nbdto = userBookListService.TestProcess();
			mav.addObject("bldto", nbdto);
			mav.setViewName("redirect:/books/view");
		}
		return mav;
		
	}
	
	// 대출 신청
//		@RequestMapping(value = "books/loan", method = RequestMethod.POST)
//		public String Borrow(HttpSession session, BookListDTO bdto, Model mod) {
//			AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
//			UserBookListDTO udto = new UserBookListDTO();
//			
//			String LL = bdto.getLoan_state();
//			if(LL == "N") {
//				
//			}
//			
//			//대출 신청 프로세스
//			udto.setUser_id(authInfo.getUser_id());
//			udto.setBook_keynum(bdto.getBook_keynum());
//			udto.setBook_category(bdto.getCategory_s());
//			
//			boolean chk = userBookListService.BorrowProcess(udto);
//			//대출 성공시 프로세스
//			if(chk == true) {	
//				BookListDTO nbdto = userBookListService.TestProcess();
//				mod.addAttribute("bdto", nbdto);
//				mod.addAttribute("script", "alert('대출 성공!');");
//			}else {
//				//대출 실패시 프로세스
//				BookListDTO nbdto = userBookListService.TestProcess();
//				mod.addAttribute("bdto", nbdto);
//				mod.addAttribute("script", "alert('대출 실패! 최대 대출 권수를 초과합니다.');");
//			}
//			return "books/borrowtest";
//			
//		}
	
	
	// 
	
	
	// 대출 연장
	@RequestMapping(value = "my/extend", method = RequestMethod.POST)
	public String ReturnExtend(ModelAndView mav, int borrow_keynum, int book_keynum, HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		userBookListService.ExtendReturnProcess(borrow_keynum, book_keynum);
		System.out.println("연장 완료");
		List<UserBookListDTO> UserBookList = userBookListService.CurrBorrowListProcesss(authInfo.getUser_id());
		mav.addObject("UserBookList", UserBookList);
		List<UserBookListDTO> PastBookList = userBookListService.PastBorrowListProcesss(authInfo.getUser_id());
		mav.addObject("PastBookList", PastBookList);
		mav.setViewName("my/user");
	    return "redirect:/my/user";
	}
	
	// 반납 요청
	@RequestMapping(value = "my/return", method = RequestMethod.POST)
	public String Return(ModelAndView mav, int borrow_keynum, HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		// 도서 반납 프로세스 - 
		UserBookListDTO udto = userBookListService.ReturnProcess(borrow_keynum);
		System.out.println("반납 완료");
		
		//예약자가 있는지 확인
		if(udto == null) {
			System.out.println("예약자 없어");
			return "redirect:/my/user";
		}
		//예약자 정보로 신규 대출 후 기존 예약 취소
		userBookListService.BorrowProcess(udto);
		userBookListService.CancelReserveProcess(udto.getBorrow_keynum());
		
		List<UserBookListDTO> UserBookList = userBookListService.CurrBorrowListProcesss(authInfo.getUser_id());
		mav.addObject("UserBookList", UserBookList);
		List<UserBookListDTO> PastBookList = userBookListService.PastBorrowListProcesss(authInfo.getUser_id());
		mav.addObject("PastBookList", PastBookList);
		mav.setViewName("my/user");
	    return "redirect:/my/user";
	}
	
	// 예약 신청
	@RequestMapping(value = "books/borrow", method = RequestMethod.POST)
	public ModelAndView Reserve(ModelAndView mav, HttpSession session, BookListDTO bdto) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		UserBookListDTO udto = new UserBookListDTO();
		Date DD = userBookListService.ReturnDueDateProcess(bdto.getBook_keynum());
		
		session.setAttribute("popupShown", false);
		
		System.out.println(bdto.getBook_keynum());
		
		String BB = bdto.getBorrow_state();
		if(BB.equals("N")) {
			BookListDTO nbdto = userBookListService.TestProcess();
			mav.addObject("bldto", nbdto); mav.addObject("script","alert('예약 실패! 예약 가능 상태가 아닙니다.');");
			mav.setViewName("redirect:/books/view");
			return mav;
		}
		udto.setUser_id(authInfo.getUser_id());
		udto.setBook_keynum(bdto.getBook_keynum());
		udto.setBook_category(bdto.getCategory_s());
		udto.setBorrow_date(DD);
		//적함성 검사 프로세스
		int chk = userBookListService.ReserveProcess(udto);
		if(chk == 3) {
			String msg = "예약 성공!";
			session.setAttribute("popupMessage", msg);
		//예약 성공시 프로세스
			BookListDTO nbdto = userBookListService.TestProcess();
			mav.addObject("bldto", nbdto);
			mav.setViewName("redirect:/books/view");
			return mav;
		}else if(chk == 1){
			String msg = "예약 실패! 최대 대출/예약 권수를 초과합니다.";
			session.setAttribute("popupMessage", msg);
			BookListDTO nbdto = userBookListService.TestProcess();
			mav.addObject("bldto", nbdto);
			mav.setViewName("redirect:/books/view");
			return mav;
		}else if(chk == 2){
			String msg = "예약 실패! 이미 대출하고 계시는 책입니다.";
			session.setAttribute("popupMessage", msg);
			BookListDTO nbdto = userBookListService.TestProcess();
			mav.addObject("bldto", nbdto);
			mav.setViewName("redirect:/books/view");
			return mav;
		}
		else {
			String msg = "로그인을 하십시오.";
			session.setAttribute("popupMessage", msg);
			BookListDTO nbdto = userBookListService.TestProcess();
			mav.addObject("bldto", nbdto);
			mav.setViewName("redirect:/books/view");
			return mav;
		}
	}
	
	//예약 취소
	@RequestMapping(value = "my/cancelReserve", method = RequestMethod.POST)
	public String CancelReserve(ModelAndView mav, int borrow_keynum, HttpSession session) {
		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		userBookListService.CancelReserveProcess(borrow_keynum);
		System.out.println("예약 취소 완료");
		List<UserBookListDTO> UserBookList = userBookListService.CurrBorrowListProcesss(authInfo.getUser_id());
		mav.addObject("UserBookList", UserBookList);
		List<UserBookListDTO> PastBookList = userBookListService.PastBorrowListProcesss(authInfo.getUser_id());
		mav.addObject("PastBookList", PastBookList);
		mav.setViewName("my/user");
	    return "redirect:/my/user";
	}
	
	//테스트 페이지 보기
	
	@RequestMapping(value = "books/borrowtest", method = RequestMethod.GET)
	public ModelAndView ViewTest(ModelAndView mav, HttpSession session) {
//		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
		BookListDTO bdto = userBookListService.TestProcess();
		mav.addObject("bdto", bdto);
		mav.setViewName("books/borrowtest");
		return mav;
	}

}
