package bookReview.dao.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bookReview.dto.BookReviewDTO;
import bookReview.dto.PageDTO;
import bookReview.service.BookReviewService;
import user.dao.UserDAO;
import user.dao.UserDaoImp;
import user.dto.AuthInfo;
import user.dto.UserDTO;
import user.service.UserService;
import user.service.UserServiceImp;


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

	//	후기 리스트 출력과정
	 @RequestMapping(value = "/bookList/book.do", method = RequestMethod.GET)
	 public String bookInfo(PageDTO pv, Model model) {
		 int totalReviews = bookReviewService.countProcess();
		 bookReview.dto.BookListDTO bldto = new bookReview.dto.BookListDTO();
		 
		 if(totalReviews>=1) {
			 if(pv.getCurrentPage()==0) {
				 pv.setCurrentPage(1); 
			 }
		 }
		 
		 
		 this.pdto = new PageDTO(pv.getCurrentPage(), totalReviews);
			/* model.addAttribute("reviewKeynum", reviewKeynum); */
		 
		 model.addAttribute("bldto", bldto);
		 model.addAttribute("pv", this.pdto);
		 model.addAttribute("revList", bookReviewService.reviewListProcess(this.pdto));
		
		 return "bookList/book";
	 };
	 
	
	@RequestMapping(value = "/bookList/writeRev.do", method = RequestMethod.POST)
	public String writeRevExecute(BookReviewDTO dto, HttpServletResponse response) {
		
		bookReviewService.saveProcess(dto);
		return "redirect:/bookList/book.do";
	}
	
	@RequestMapping(value="/bookList/update.do", method = RequestMethod.POST)
	public String updateRev(BookReviewDTO dto) {
		
		bookReviewService.updateProcess(dto);
		return "redirect:/bookList/book.do";
	}
	
	@RequestMapping(value="/bookList/delete.do", method = RequestMethod.POST)
	public String deleteRev(@RequestParam("reviewKeynum") int reviewKeynum) {
		bookReviewService.deleteProcess(reviewKeynum);
		return "redirect:/bookList/book.do";
	}
}
