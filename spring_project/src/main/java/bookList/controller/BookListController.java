package bookList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bookList.dto.BookListDTO;
import bookList.service.BookListServiceImp;
import bookReview.dto.BookReviewDTO;

//http://localhost:8090/myapp/bookList/books.do

@Controller
public class BookListController {
	
	private BookListServiceImp bookListService;
	
	public BookListController() {
	
	}

	
	public void setBookListService(BookListServiceImp bookListService) {
		this.bookListService = bookListService;
	}
	
	@RequestMapping(value = "/bookList/book.do", method = RequestMethod.GET)
	public ModelAndView listExec(@ModelAttribute("bk") BookListDTO bookList, ModelAndView mav) {
		/* mav.addObject("bk", this); */
		mav.setViewName("/bookList/book");
		return mav;
	}
	
	/*
	 * @RequestMapping(value = "/bookList/writeRev.do", method = RequestMethod.GET)
	 * public ModelAndView writeRev(@ModelAttribute("dto") BookReviewDTO dto,
	 * ModelAndView mav) { mav.setViewName("bookList/writeRev"); return mav; };
	 * 
	 * @RequestMapping(value = "/bookList/writeRev.do", method = RequestMethod.POST)
	 * public String writeRevExecute() { return "redirect:/bookList/books.do"; }
	 */
}
