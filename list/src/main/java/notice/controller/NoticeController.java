package notice.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import notice.dto.NoticeDTO;
import notice.dto.PageDTO;
import notice.file.FileUpload;
import notice.service.NoticeService;

// http://localhost:8090/myapp/notice/notice

@Controller
public class NoticeController {

	private NoticeService noticeService;
	private PageDTO pdto;

	public NoticeController() {
		// TODO Auto-generated constructor stub
	}

	public void setNoticeService(NoticeService noticeService) {
		this.noticeService = noticeService;
	}
	
	@RequestMapping(value="/notice/notice")
	public ModelAndView listExecute(PageDTO pv, ModelAndView mav) {
		int totalCount = noticeService.countProcess();
		if(totalCount>=1) {
			if(pv.getCurrentPage()==0)
				pv.setCurrentPage(1);
			this.pdto = new PageDTO(pv.getCurrentPage(), totalCount);
			mav.addObject("pv", this.pdto);
		}
		
		mav.addObject("aList", noticeService.listProcess(this.pdto));
		mav.addObject("topList", noticeService.toplistProcess());
		mav.setViewName("notice/notice");
		return mav;
	}

	@RequestMapping("/notice/info")
	public ModelAndView viewExcute(@ModelAttribute("pv") PageDTO pv, int num, ModelAndView mav) {
		NoticeDTO bdto = noticeService.contentProcess(num);
		
		//사진링크가져오기
		if(!(bdto.getUpload_img() == null)) {
			String srcImg = "\\myapp\\resources\\images\\"+bdto.getUpload_img(); 
			//System.out.println(srcImg);
			mav.addObject("srcImg", srcImg);
		}
		mav.addObject("dto", bdto); //게시글내용
		mav.addObject("pn", noticeService.preNextProcess(num)); //이전글,다음글
		mav.addObject("currentPage", pv.getCurrentPage());
		mav.setViewName("/notice/info");
		return mav;
	}	

	@RequestMapping(value="/notice/write", method=RequestMethod.GET)
	public ModelAndView writeExcute(@ModelAttribute("dto") NoticeDTO dto, @ModelAttribute("pv") PageDTO pv, ModelAndView mav) {
		mav.setViewName("/notice/write");
		return mav;
	}	

	@RequestMapping(value="/notice/write", method=RequestMethod.POST)
	public String writeProExcute(NoticeDTO dto, HttpServletRequest req) {
		MultipartFile file = dto.getFilename();
		MultipartFile img = dto.getImgname();

		//첨부파일이 있으면
		if(!file.isEmpty()) {
			UUID random = FileUpload.saveCopyFile(file, req);
			dto.setUpload_file(random + "_" + file.getOriginalFilename());	
		}

		//사진첨부가 있으면
		if(!img.isEmpty()) {
			UUID random = FileUpload.saveCopyImg(img, req);
			dto.setUpload_img(random + "_" + img.getOriginalFilename());	
		}

		noticeService.insertProcess(dto);

		return "redirect:/notice/notice";
	}

	@RequestMapping("/notice/contentdownload")
	public ModelAndView downloadExecute(int num, ModelAndView mav) {
		mav.addObject("num", num);
		mav.setViewName("download");
		return mav;
	}

	@RequestMapping(value="/notice/update", method=RequestMethod.GET)
	public ModelAndView updateExecute(int num, int currentPage, ModelAndView mav) {
		mav.addObject("dto", noticeService.updateSelectProcess(num));
		mav.addObject("currentPage", currentPage);
		mav.setViewName("/notice/update");
		return mav;
	}

	@RequestMapping(value = "/notice/update", method=RequestMethod.POST)                              
	public String updateExecute(NoticeDTO dto, int currentPage, HttpServletRequest req, RedirectAttributes ratt) {
		MultipartFile file = dto.getFilename();
		MultipartFile img = dto.getImgname();

		//첨부파일이 있으면
		if(!file.isEmpty()) {
			UUID random = FileUpload.saveCopyFile(file, req);
			dto.setUpload_file(random + "_" + file.getOriginalFilename());	
		}

		//사진첨부가 있으면
		if(!img.isEmpty()) {
			UUID random = FileUpload.saveCopyImg(img, req);
			dto.setUpload_img(random + "_" + img.getOriginalFilename());	
		}
		noticeService.updateProcess(dto, FileUpload.urlPath(req), FileUpload.urlPathImg(req));

		//return "redirect:/board/list.do?currentPage=" + currentPage;

		ratt.addAttribute("currentPage", currentPage);
		return "redirect:/notice/notice";
	}

	@RequestMapping("/notice/delete")
	public String deleteExecute(int num, int currentPage, HttpServletRequest req, RedirectAttributes ratt) {

		ratt.addAttribute("currentPage", currentPage);
		noticeService.deleteProcess(num, FileUpload.urlPath(req), FileUpload.urlPathImg(req));
		return "redirect:/notice/notice";
	}
}
