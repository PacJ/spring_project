package user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import admin.dto.AdminDTO;
import admin.dto.adminAuthInfo;
import user.dao.UserDAO;
import user.dto.AuthInfo;
import user.dto.UserDTO;
import user.notice.dto.NoticeDTO;
import user.notice.service.NoticeService;
import user.service.UserService;

//http://localhost:8090/myapp

@Controller
public class UserController {

	private UserService userService;
	private UserDAO userdao;
	private NoticeService userNoticeService;

	public UserController() {

	}

	public void setUserNoticeService(NoticeService userNoticeService) {
		this.userNoticeService = userNoticeService;
	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mav) {
		NoticeDTO mainOneDTO = userNoticeService.latestOneProcess(); // 공지사항
		List<NoticeDTO> mainFiveDTO = userNoticeService.latestFiveProcess(); // 공지사항 5개 출력
		// System.out.println(mainDTO.getNum());
		// System.out.println(mainDTO.getTitle());

		// mav.addObject("currentPage", 1);
		mav.addObject("latestOne", mainOneDTO); // 추가
		mav.addObject("latestFive", mainFiveDTO); // 추가

		return mav;

	}

	// 회원가입 폼
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String addMember(HttpSession session) {
		if (session.getAttribute("adminauthInfo") != null) {
			return "redirect:/"; // 관리자가 로그인이 되어있다면 회원가입 불가
		}
		return "signup";
	}

	// 회원가입 시 addUserProcess로 회원을 추가 한 후,
	// 세션에 인증정보 저장 후 홈으로 redirect
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String addMember(UserDTO userDTO, HttpSession session) {

		System.out.println(userDTO.getUser_id());
		System.out.println(userDTO.getUser_password());
		System.out.println(userDTO.getUser_name());

		System.out.println(userDTO.getUser_age());
		System.out.println(userDTO.getUser_address());
		System.out.println(userDTO.getUser_sex());
		AuthInfo authInfo = userService.addUserProcess(userDTO); // 사용자 추가
		String keynum = userService.getKeynum(authInfo.getUser_id());
		System.out.println(keynum);
		session.setAttribute("authInfo", authInfo); // authInfo 세션에 추가
		session.setAttribute("keynum", keynum);
		return "redirect:/";
	}

	// 사용자 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginUser(HttpSession session) {
		if (session.getAttribute("adminauthInfo") != null) {
			return "redirect:/"; // 관리자 로그인했다면 사용자 로그인 불가
		}
		return "login";
	}

	// 로그인 처리
	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUser(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw,
			HttpSession session, HttpServletResponse resp, Model model) {

		AuthInfo login = new AuthInfo(user_id, user_pw);
		UserDTO dto = userService.loginProcess(login);
		if (dto == null) {
			String popupState = "on";
			String popupContent = "아이디 또는 비밀번호가 틀렸습니다.";
			model.addAttribute("popupState", popupState);
			model.addAttribute("popupContent", popupContent);

			return "login";
		}
		String keynum = userService.getKeynum(login.getUser_id());
		System.out.println(keynum);
		// authInfo 세션에 추가
		session.setAttribute("keynum", keynum);

		session.setAttribute("authInfo", login);
		session.setAttribute("userDTO", dto);
		return "redirect:/";
	}

	// 로그아웃
	@RequestMapping(value = "/logout")
	public String logoutMember(HttpSession session) {
		System.out.println(session.getAttribute("keynum"));
		session.invalidate(); // 세션값 지움
		return "redirect:/"; // 홈으로 리다이렉트
	}

	// 나의 도서관
	@RequestMapping(value = "/mylibrary", method = RequestMethod.GET)
	public ModelAndView myLibrary(ModelAndView mav, HttpSession session) {

		mav.setViewName("mylibrary");
		return mav;
	}

	// 아이디 중복체크
	@RequestMapping(value = "/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam("id") String id) {
		System.out.println("컨트롤러 실행");
		System.out.println(id);
		int cnt = userService.idcheck(id);
		String a = String.valueOf(cnt);
		return a;

	}

	@RequestMapping(value = "/info")
	public String info(HttpSession session) {

		return "info";
	}

	@RequestMapping(value = "/books/view")
	public String booksView() {
		return "books/view";
	}

	@RequestMapping(value = "/request")
	public String request(HttpSession session) {
		if (session.getAttribute("adminauthInfo") != null) {
			return "redirect:/";
		}
		return "request";
	}
	@RequestMapping(value = "/my")
	public String my() {
		return "my";
	}



	// 주소 변경 처리
	@RequestMapping(value = "/my/changeAdd", method = RequestMethod.POST)
	public String updateAddress(UserDTO dto, HttpSession session) {
		AuthInfo authInfo = userService.updateAddressProcess(dto);
		
		AuthInfo avsca= (AuthInfo) session.getAttribute("authInfo");
		System.out.println(avsca.getUser_password());
		System.out.println(dto.getUser_password());
		session.setAttribute("authInfo", authInfo);

		return "redirect:/my";
	}

	// 비밀번호 변경 처리
	@RequestMapping(value = "/my/changePwd", method = RequestMethod.POST)
	public String updatePass(UserDTO dto, HttpSession session) {
		AuthInfo authInfo = userService.updatePassProcess(dto);
		session.setAttribute("authInfo", authInfo);

		return "redirect:/my";
	}

	// 회원 탈퇴 폼
//	@RequestMapping(value="/my/withdraw", method=RequestMethod.GET)
//	public ModelAndView withdraw(ModelAndView mav, HttpSession session) {
//		AuthInfo authInfo = (AuthInfo)session.getAttribute("authInfo");
//		mav.addObject("userDTO", userService.selectUserProcess(authInfo.getUser_id()));
//		mav.setViewName("my/withdraw");
//		return mav;
//	}

	// 회원 탈퇴 요청
	@RequestMapping(value = "/my/delete", method = RequestMethod.POST)
	public String deleteUser(HttpSession session, Model mod) {
		AuthInfo authInfo = (AuthInfo) session.getAttribute("authInfo");
//		if(!userBookListService.CurrBorrowListProcesss(authInfo.getUser_id()).isEmpty()) {
//			System.out.println(!userBookListService.CurrBorrowListProcesss(authInfo.getUser_id()).isEmpty());
//			String popupState = "on";
//			String popupMessage = "넌 못지나간다";
//			
//			mod.addAttribute("popupState", popupState);
//			mod.addAttribute("popupMessage", popupMessage);
//			return "redirect:/my/withdraw";
//		}

		System.out.println(authInfo.getUser_id());
		userService.deleteUserProcess(authInfo.getUser_id());
		session.invalidate();
		return "redirect:/";
	}
	
	//추천도서별 검색버튼
	   @RequestMapping(value = "my/searchRecommend")
	   public String searchRecommendBook(RedirectAttributes redirectAttributes, @RequestParam("isbn") String isbn) {
	      System.out.println(isbn);
	      redirectAttributes.addAttribute("isbn", isbn);
	      return "redirect:/books/search";	
	   }
	   
	   //추천도서별 도서신청
	   @RequestMapping(value = "my/requestRecommend")
	   public String requestRecommendBook() {
	      return "redirect:request/request";
	   }

}
