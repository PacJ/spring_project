package user.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

//http://localhost:8090/myapp

@Controller
public class UserController {
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
	
	@RequestMapping(value = "/notice/notice")
	public String notice() {
		return "notice/notice";
	}
	
	@RequestMapping(value = "/info")
	public String info() {
		return "info";
	}
	
	@RequestMapping(value = "/books/list")
	public String booksList() {
		return "books/list";
	}
	
	@RequestMapping(value = "/books/new")
	public String booksNew() {
		return "books/new";
	}
	
	@RequestMapping(value = "/my/map")
	public String map() {
		return "my/map";
	}
}
