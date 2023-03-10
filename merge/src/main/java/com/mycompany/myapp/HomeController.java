package com.mycompany.myapp;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


// http://localhost:8090/myapp

@Controller
public class HomeController {
	
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main() {
		return "";
	}
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping(value = "/signup")
	public String signup() {
		return "signup";
	}
	
	@RequestMapping(value = "/notice")
	public String notice() {
		return "notice";
	}
}




