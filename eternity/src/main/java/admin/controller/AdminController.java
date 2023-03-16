package admin.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import admin.dto.AdminDTO;
import admin.dto.adminAuthInfo;
import admin.service.AdminService;
import user.dto.UserDTO;

//http://localhost:8090/myapp/admin

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String main(HttpSession session) {
		if (session.getAttribute("authInfo") != null) {
			System.out.println("authInfo존재");
			return "redirect:/home";
		}
		return "admin";
	}

	@RequestMapping(value = "/admin/login", method = RequestMethod.GET)
	public String login(HttpSession session) {
		if (session.getAttribute("authInfo") != null) {
			System.out.println("authInfo존재");
			return "redirect:/home";
		}
		return "redirect:/home";
	}

	@RequestMapping(value = "/admin/adminSignup", method = RequestMethod.GET)
	public String signup(HttpSession session) {
		if (session.getAttribute("authInfo") != null) {
			System.out.println("authInfo존재");
			return "redirect:/home";
		}
		return "redirect:/home";
	}

	@RequestMapping(value = "/admin/adminSignup", method = RequestMethod.POST)
	public String processAdminSignup(AdminDTO dto, HttpSession session) {
		// 회원가입 처리 로직
		adminAuthInfo adminauthInfo = adminService.addAdminProcess(dto);
		session.setAttribute("adminauthInfo", adminauthInfo);
		session.setAttribute("adminName", dto.getadmin_name());
		return "admin/user"; // 회원가입 후 이동할 페이지
	}

	@RequestMapping(value = "admin/login", method = RequestMethod.POST)
	public String processLogin(@RequestParam("loginId") String loginId, @RequestParam("loginPw") String loginPw,
			HttpSession session, HttpServletResponse resp) {

		adminAuthInfo login = new adminAuthInfo(loginId, loginPw);
		AdminDTO dto = adminService.loginProcess(login);
		if (dto != null) {
			session.setAttribute("adminauthInfo", login);
			session.setAttribute("adminName", dto.getadmin_name());
			return "redirect:/admin/user";
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

		return "admin/user"; // 로그인 후 이동할 페이지
	}
	// 로그아웃

	@RequestMapping(value = "/admin/logout")
	public String logoutUser(HttpSession session) {
		session.invalidate();
		return "redirect:/admin";
	}

	// 아이디 중복체크
	@RequestMapping(value = "admin/idcheck", method = RequestMethod.POST)
	@ResponseBody
	public String idCheck(@RequestParam("id") String id) {
		System.out.println("컨트롤러 실행");
		System.out.println(id);
		int cnt = adminService.idcheck(id);
		String a = String.valueOf(cnt);
		return a;

	}

	@RequestMapping(value = "/admin/user", method = RequestMethod.GET)
	public String user(Model model) {
		List<UserDTO>dtos= null;
		
		if(model.getAttribute("searchdtos")!=null) {
			System.out.println("sd 있음");
			
		}else{
			dtos=adminService.printUserService();
			System.out.println("없음");
			model.addAttribute("dtos", dtos);
		}
		return "admin/user";
	}
	@RequestMapping(value = "/admin/user", method = RequestMethod.POST)
	public String userPost() {
	    // POST 요청에 대한 처리
	    return "redirect:/admin/user";
	}

	@RequestMapping(value = "/admin/admin")
	public String admin(Model model) {
	List<AdminDTO>dtos= null;
		
		if(model.getAttribute("searchadmindtos")!=null) {
			System.out.println("sd 있음");
			
		}else{
			dtos=adminService.printAdminService();
			System.out.println("없음");
			model.addAttribute("dtos", dtos);
		}
		return "admin/admin";
	}
	@RequestMapping(value = "/admin/admin", method = RequestMethod.POST)
	public String adminPost() {
	    // POST 요청에 대한 처리
	    return "redirect:/admin/admin";
	}

	@RequestMapping(value = "/admin/notice")
	public String notice() {
		return "admin/notice";
	}

	@RequestMapping(value = "/admin/books")
	public String books() {
		return "admin/books";
	}

	@RequestMapping(value = "/admin/borrow")
	public String borrow() {
		return "admin/borrow";
	}

	@RequestMapping(value = "/admin/review")
	public String review() {
		return "admin/review";
	}

	@RequestMapping(value = "/admin/request")
	public String request() {
		return "admin/request";
	}

	@RequestMapping(value = "/admin/deleteUser")
	public String deleteUser(@RequestParam("user_id") String user_id) {
		adminService.deleteUserService(user_id);
		System.out.println(user_id);

		return "redirect:/admin/user";
	}

	@RequestMapping(value = "/admin/deleteAdmin")
	public String deleteUser(@RequestParam("admin_id") String admin_id, HttpSession session) {
		adminService.deleteAdminService(admin_id);
		System.out.println(admin_id);
		session.invalidate();
		return "redirect:/home";
	}

	@RequestMapping(value = "/admin/searchUser" ,method=RequestMethod.POST)
	public String searchuser(Model model,@RequestParam("option") String option, @RequestParam("search") String search) {
		List<UserDTO> dtos=null;
		if (option ==null){

		}else {

			if(option.charAt(0)=='i') {
				dtos=adminService.searchUserIdService(search);
				for(int i = 0 ; i < dtos.size();i++) {
					System.out.println(dtos.get(i).getUser_id());
				}
				
				
			}else {
				 dtos=adminService.searchUserNameService(search);
				for(int i = 0 ; i < dtos.size();i++) {
					System.out.println(dtos.get(i).getUser_id());
				}
				
			}
		}
		model.addAttribute("searchdtos", dtos);
		
		return "admin/user";
	}@RequestMapping(value = "/admin/searchAdmin" ,method=RequestMethod.POST)
	public String searchadmin(Model model,@RequestParam("option") String option, @RequestParam("search") String search) {
		List<AdminDTO> dtos=null;
		if (option ==null){

		}else {

			if(option.charAt(0)=='i') {
				dtos=adminService.searchAdminIdService(search);
				for(int i = 0 ; i < dtos.size();i++) {
					System.out.println(dtos.get(i).getadmin_id());
				}
				
				
			}else {
				 dtos=adminService.searchAdminNameService(search);
				for(int i = 0 ; i < dtos.size();i++) {
					System.out.println(dtos.get(i).getadmin_id());
				}
				
			}
		}
		model.addAttribute("searchadmindtos", dtos);
		
		return "admin/admin";
	}

}
