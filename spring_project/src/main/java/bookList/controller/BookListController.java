package bookList.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import bookList.dto.BookListDTO;
import bookList.service.BookListServiceImp;
import bookReview.dto.BookReviewDTO;
import bookReview.dto.PageDTO;
import bookReview.service.BookReviewServiceImp;

//http://localhost:8090/myapp/bookList/books.do

@Controller
public class BookListController {

	private BookListServiceImp bookListService;
	private BookReviewServiceImp bookReviewService;
	private PageDTO pdto;

	public BookListController() {

	}

	public void setBookListService(BookListServiceImp bookListService) {
		this.bookListService = bookListService;
	}

	public void setBookReviewService(BookReviewServiceImp bookReviewService) {
		this.bookReviewService = bookReviewService;
	}
	
//	 @RequestMapping(value = "/bookList/book.do", method = RequestMethod.GET)
//	 public ModelAndView bookInfo(PageDTO pv, ModelAndView mav) {
//
//		 int totalReviews = bookReviewService.countProcess(); 
//		 
//		 if(totalReviews>=1) {
//			 if(pv.getCurrentPage()==0) {
//				 pv.setCurrentPage(1); 
//			 }
//		 	this.pdto = new PageDTO(pv.getCurrentPage(), totalReviews);
//		 	mav.addObject("pv", this.pdto);
//		 }
//		 
//		 mav.addObject("revList", bookReviewService.reviewListProcess(this.pdto));
//		 
//	 mav.setViewName("/bookList/book"); 
//	 return mav; 
//	 };
	 

	/*
	 * @RequestMapping(value = "/bookList/writeRev.do", method = RequestMethod.GET)
	 * public ModelAndView writeRev(@ModelAttribute("dto") BookReviewDTO dto,
	 * ModelAndView mav) { mav.setViewName("bookList/writeRev"); return mav; };
	 * 
	 * @RequestMapping(value = "/bookList/writeRev.do", method = RequestMethod.POST)
	 * public String writeRevExecute() { return "redirect:/bookList/books.do"; }
	 */
}
