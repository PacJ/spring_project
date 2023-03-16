package user.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import admin.dto.AdminDTO;
import admin.dto.adminAuthInfo;
import user.dao.UserDAO;
import user.dto.AuthInfo;
import user.dto.UserDTO;
import user.service.UserService;

//http://localhost:8090/myapp/home

@Controller
public class UserController {

	private UserService userService;
	private UserDAO userdao;

	public UserController() {

	}

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = "/home", method = RequestMethod.GET)
	public String main() {
		return "home";
	}

	// 회원가입 폼
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public String addMember(HttpSession session) {
		if (session.getAttribute("adminauthInfo") != null) {
			return "redirect:/home.do";
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
		AuthInfo authInfo = userService.addUserProcess(userDTO);
		session.setAttribute("authInfo", authInfo);
		return "redirect:/home.do";
	}

	// 사용자 로그인
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginUser(HttpSession session) {
		if (session.getAttribute("adminauthInfo") != null) {
			return "redirect:/home.do";
		}
		return "login";
	}

	// 로그인 처리
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String loginUser(@RequestParam("user_id") String user_id, @RequestParam("user_pw") String user_pw,
			HttpSession session, HttpServletResponse resp) {
		
		AuthInfo login = new AuthInfo(user_id, user_pw);
		UserDTO dto = userService.loginProcess(login);
		if (dto != null) {
			session.setAttribute("authInfo", login);
			return "redirect:/home";
		} else {
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out;
			try {
				out = resp.getWriter();
				out.print("<script>alert('아이디 비밀번호 불일치'); history.go(-1);</script>");
				out.flush();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

		return null; // 로그인 후 이동할 페이지
	}

	// 로그아웃
	@RequestMapping(value = "/logout")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
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

	@RequestMapping(value = "/notice/notice")
	public String notice() {
		return "notice/notice";
	}

	@RequestMapping(value = "/notice/view")
	public String noticeView() {
		return "notice/view";
	}

	@RequestMapping(value = "/info")
	public String info() {
		return "info";
	}

	@RequestMapping(value = "/books/list")
	public String booksList() {
		return "books/list";
	}

	@RequestMapping(value = "/books/view")
	public String booksView() {
		return "books/view";
	}

	@RequestMapping(value = "/request")
	public String request(HttpSession session) {
		if (session.getAttribute("adminauthInfo") != null) {
			return "redirect:/home.do";
		}
		return "request";
	}

	@RequestMapping(value = "/my")
	public String my(HttpSession session) {

		if (session.getAttribute("adminauthInfo") != null) {
			return "redirect:/home.do";
		}
		return "my";
	}
}
