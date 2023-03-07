package user.controller;


import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import user.dao.UserDAO;
import user.dao.UserDaoImp;
import user.dto.AuthInfo;
import user.dto.UserDTO;
import user.service.UserService;

//http://localhost:8090/myapp/user/signup.do

@Controller
public class UserController {

	private UserService userService;
	
	public UserController() {
		
	}
	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	//홈페이지
	
	//회원가입 폼
	@RequestMapping(value="/user/signup.do", method=RequestMethod.GET)
	public ModelAndView addMember(ModelAndView mav) {
		mav.setViewName("user/signup");
		return mav;
	}
	
	//회원가입 시 addUserProcess로 회원을 추가 한 후,
	//세션에 인증정보 저장 후 홈으로 redirect
	@RequestMapping(value="/user/signup.do", method=RequestMethod.POST)
	public String addMember(UserDTO userDTO, HttpSession session) {
		AuthInfo authInfo = userService.addUserProcess(userDTO);
		session.setAttribute("authInfo", authInfo);
		return "redirect:/home.do";
	}
	
	//사용자 로그인
	@RequestMapping(value = "/user/login.do", method = RequestMethod.GET)
	public String loginUser() {
		return "user/login";
	}
	
	//로그인 처리
	@RequestMapping(value = "/user/login.do", method = RequestMethod.POST)
	public String loginUser(UserDTO dto, HttpSession session, HttpServletResponse resp) {
		
		try {
			AuthInfo authInfo = userService.loginProcess(dto);
			session.setAttribute("authInfo", authInfo);
			System.out.println(authInfo);
			return "redirect:/home.do";
		} catch (Exception e) {
			resp.setContentType("text/html;charset=UTF-8");
			try {
				PrintWriter out = resp.getWriter();
				out.print("<script>alert('아이디 비밀번호 불일치'); history.go(-1);</script>");
				out.flush();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		return null;
	}
	
	//로그아웃
	@RequestMapping(value="/user/logout.do")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/home.do";
	}
	
	//나의 도서관
	@RequestMapping(value = "/user/mylibrary.do", method=RequestMethod.GET)
	public ModelAndView myLibrary(ModelAndView mav, HttpSession session) {
		mav.setViewName("user/mylibrary");
		return mav;
	}
	
	//아이디 중복 확인
	@RequestMapping(value="/user/idCheck.do")
	@ResponseBody
	public String idCheck(String id, HttpServletResponse resp) {
		resp.setContentType("text/plain");
			UserDAO userdao = null;
			UserDTO user = userdao.selectByUserId(id);
		      if(user == null) {
		          return "사용가능";
		       }
		       
	      System.out.println("암살시도가 있었습니다");
	      return "이미 등록이 된 아이디입니다.";
	}
	/*
	 * @RequestMapping(value="/user/books.do", method=RequestMethod.GET) public
	 */
}
