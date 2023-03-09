package bookReview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bookList.dto.BookListDTO;
import bookReview.dto.BookReviewDTO;
import bookReview.service.BookReviewService;

//http://localhost:8090/myapp/bookList/books.do

@Controller
public class BookReviewController {

	private BookReviewService bookReviewService;

	public BookReviewController() {
		// TODO Auto-generated constructor stub
	}

	public void setBookReviewService(BookReviewService bookReviewService) {
		this.bookReviewService = bookReviewService;
	}

	/*
	 * @RequestMapping(value = "/bookList/books.do", method = RequestMethod.GET)
	 * public ModelAndView listExec(@ModelAttribute("bk") BookListDTO bookList,
	 * ModelAndView mav) { mav.addObject("bk", this);
	 * mav.setViewName("/bookList/books"); return mav; }
	 */

	@RequestMapping(value = "/bookList/writeRev.do", method = RequestMethod.GET)
	public ModelAndView writeRev(@ModelAttribute("dto") BookReviewDTO dto, ModelAndView mav) {
		mav.setViewName("bookList/writeRev");
		return mav;
	};

	@RequestMapping(value = "/bookList/writeRev.do", method = RequestMethod.POST)
	public String writeRevExecute(BookReviewDTO dto) {
		
		bookReviewService.saveProcess(dto);
		return "redirect:/bookList/book.do";
	}
}
