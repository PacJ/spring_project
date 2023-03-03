package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import admin.service.AdminService;

//	http://localhost:8090/myapp/admin/adminSignup.do

@Controller
public class AdminController {
	
	private AdminService adminService;
	
	public AdminController() {

	}
	
	public void setAdminService(AdminService adminService) {
		this.adminService = adminService;
	}
	
	//관리자 회원가입 폼
	@RequestMapping(value="/admin/adminSignup.do", method=RequestMethod.GET)
	public ModelAndView addAdmin(ModelAndView mav) {
		mav.setViewName("admin/adminSignup");
		return mav; 
};

}