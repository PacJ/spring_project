package bookReview.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bookList.dto.BookListDTO;
import bookReview.dto.BookReviewDTO;
import bookReview.dto.PageDTO;
import bookReview.service.BookReviewService;

//http://localhost:8090/myapp/bookList/book.do

@Controller
public class BookReviewController {

	private BookReviewService bookReviewService;
	private PageDTO pdto;

	public BookReviewController() {
		// TODO Auto-generated constructor stub
	}

	public void setBookReviewService(BookReviewService bookReviewService) {
		this.bookReviewService = bookReviewService;
	}

	
	 @RequestMapping(value = "/bookList/book.do", method = RequestMethod.GET)
	 public ModelAndView bookInfo(PageDTO pv, ModelAndView mav) {

		 int totalReviews = bookReviewService.countProcess(); 
		 
		 if(totalReviews>=1) {
			 
			 if(pv.getCurrentPage()==0) {
				 pv.setCurrentPage(1); 
			 }
		 
		 	this.pdto = new PageDTO(pv.getCurrentPage(), totalReviews);
		 	mav.addObject("pv", this.pdto);
		 }
		 
		 
		 mav.addObject("revList", bookReviewService.reviewListProcess(this.pdto));
		 
		 
	 mav.setViewName("/bookList/book"); 
	 return mav; 
	 };
	 
	 
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
