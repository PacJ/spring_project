package user.notice.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import user.notice.dto.NoticeDTO;
import user.notice.dto.PageDTO;
import user.notice.file.FileUpload;
import user.notice.service.NoticeService;

// http://localhost:8090/myapp/notice/notice

@Controller
public class NoticeController {

	private NoticeService userNoticeService;
	private PageDTO pdto;

	public NoticeController() {
		// TODO Auto-generated constructor stub
	}

	public void setUserNoticeService(NoticeService userNoticeService) {
		this.userNoticeService = userNoticeService;
	}
	
	//공지사항 리스트
	@RequestMapping(value="/notice/notice")
	public ModelAndView listExecute(PageDTO pv, ModelAndView mav) {
		int totalCount = userNoticeService.countProcess();
		mav.addObject("totalCount", totalCount);
		
		if(totalCount>=1) {
			if(pv.getCurrentPage()==0)
				pv.setCurrentPage(1);
			this.pdto = new PageDTO(pv.getCurrentPage(), totalCount);
			mav.addObject("pv", this.pdto);
			mav.addObject("Number", pdto.getNumber());
		}else {
			mav.addObject("totalCount", totalCount);
		}
		
		
		mav.addObject("aList", userNoticeService.listProcess(this.pdto)); //공지사항 전체 추가
		mav.addObject("topList", userNoticeService.toplistProcess()); //toplist 추가
		mav.setViewName("notice/notice");
		return mav;
	}
	
	//게시글검색
	@RequestMapping(value = "/notice/search", method = RequestMethod.GET)
	   public String searchadmin(Model model, PageDTO pv, @RequestParam("option") String option,
	         @RequestParam("searchword") String searchword) {
		
	      List<NoticeDTO> dtos = null;
	      
		  System.out.println(option);
		  System.out.println(searchword);
		  
	      // 페이지네이션을 위한 결과 개수 가져오기
	      int totalCount = userNoticeService.searchCountProcess(option, searchword);
	      model.addAttribute("totalCount", totalCount);
	      System.out.println("totalCount : "+totalCount);
	      
	      if (totalCount >= 1) {
	         if (pv.getCurrentPage() == 0) 
	            pv.setCurrentPage(1);
	         this.pdto = new PageDTO(pv.getCurrentPage(), totalCount, searchword, option);
	         model.addAttribute("searchPv", this.pdto); //검색결과에 맞춘 pv 추가
	         model.addAttribute("Number", pdto.getNumber()); // 번호 추가
	         System.out.println("현재페이지 :"+ pdto.getCurrentPage());
	          System.out.println("총 레코드수 :"+ pdto.getTotalCount());
	          System.out.println("총 페이지수 :"+ pdto.getTotalPage());
	          System.out.println("시작 레코드 번호 :"+ pdto.getStartRow());
	          System.out.println("끝 레코드 번호 :"+ pdto.getEndRow());
	          System.out.println("한 블록의 시작 페이지 번호 :"+ pdto.getStartPage());
	          System.out.println("한 블록의 끝 페이지 번호 :"+ pdto.getEndPage());
	          System.out.println("리스트에서 출력번호(rownum) :"+ pdto.getNumber());

	      }
	      dtos = userNoticeService.searchListProcess(this.pdto);
	      model.addAttribute("aList", dtos); //검색 결과 리스트 추가
	      model.addAttribute("query",searchword); //검색어 
	      model.addAttribute("option",option); //검색 옵션
	      return "notice/notice";
	   }	

	//공지사항 게시글 보기
	@RequestMapping("/notice/info")
	public ModelAndView viewExcute(@ModelAttribute("pv") PageDTO pv, int num, ModelAndView mav) {
		NoticeDTO bdto = userNoticeService.contentProcess(num);
		
		//사진링크가져오기
		if(!(bdto.getUpload_img() == null)) {
			String srcImg = "/myapp/resources/assets/setimg/"+bdto.getUpload_img(); 
			//System.out.println(srcImg);
			mav.addObject("srcImg", srcImg);
		}
		mav.addObject("dto", bdto); //게시글내용
		mav.addObject("pn", userNoticeService.preNextProcess(num)); //이전글,다음글
		mav.addObject("currentPage", pv.getCurrentPage());
		mav.setViewName("notice/view");
		return mav;
	}	

	//첨부파일 다운로드
	@RequestMapping("/notice/contentdownload")
	public ModelAndView downloadExecute(int num, ModelAndView mav) {
		mav.addObject("num", num);
		mav.setViewName("download");
		return mav;
	}

	///////////////////////////////////////////////////

	
	
}//class
