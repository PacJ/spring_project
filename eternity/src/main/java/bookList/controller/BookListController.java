package bookList.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import bookList.dto.BookListDTO;
import bookList.dto.PageDTO;
import bookList.service.BookListService;

//http://localhost:8090/myapp/bookList/book.do

@Controller
public class BookListController {

	private BookListService bookListService;
	private PageDTO pdto;
	private BookListDTO bldto;
	
	public BookListController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setBookListService(BookListService bookListService) {
		this.bookListService = bookListService;
	}
	
	// 후기 리스트 출력과정
	@RequestMapping(value = "/books/view", method = RequestMethod.GET)
	public String bookInfo(PageDTO pv, Model model) {
		int totalReviews = bookListService.countProcess();
		String isbn = "9791130689890";
		
		
		
		 
		if(totalReviews>=1) {
			if(pv.getCurrentPage() == 0) {
				pv.setCurrentPage(1);
			}
		}
		
		this.bldto = bookListService.selectBookProcess(isbn);
		this.pdto = new PageDTO(pv.getCurrentPage(), totalReviews);
		
		model.addAttribute("bldto", this.bldto);
		model.addAttribute("pv", this.pdto);
		model.addAttribute("revList", bookListService.reviewListProcess(this.pdto));
	
		return "books/view";
	}
	
	@RequestMapping(value = "/books/writeRev", method = RequestMethod.POST)
	public String writeRevExecute(@RequestParam("isbn") String isbn, bookList.dto.BookReviewDTO dto, HttpServletResponse response, HttpSession session) {
		dto.setIsbn(isbn);
		int revs = bookListService.revCheckProcess(dto);
		
		if(revs > 0) {
			String msg = "후기 등록 실패! 이미 해당 도서에 대한 후기를 남기셨습니다.";
			session.setAttribute("popupMessage", msg);
			return "redirect:/books/view";
		}
		
		String msg = "후기를 등록하였습니다.";
		session.setAttribute("popupMessage", msg);
		bookListService.saveProcess(dto);
		return "redirect:/books/view";
	}
	
	@RequestMapping(value="/books/update", method = RequestMethod.POST)
	public String updateRev(bookList.dto.BookReviewDTO dto) {
		
		bookListService.updateProcess(dto);
		return "redirect:/books/view";
	}
	
	@RequestMapping(value="/books/delete", method = RequestMethod.POST)
	public String deleteRev(@RequestParam("review_keynum") int review_keynum) {
		bookListService.deleteProcess(review_keynum);
		return "redirect:/books/view";
	}
	
	
	
}
