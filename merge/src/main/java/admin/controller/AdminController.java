package admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//http://localhost:8090/myapp/admin

@Controller
public class AdminController {
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String main() {
		return "admin";
	}
	
	@RequestMapping(value = "/admin/user")
	public String user() {
		return "admin/user";
	}
	
	@RequestMapping(value = "/admin/admin")
	public String admin() {
		return "admin/admin";
	}

}
