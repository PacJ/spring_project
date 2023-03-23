package user.my.recommend.controller;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import user.dto.AuthInfo;
import user.my.recommend.dto.BookmanageDTO;
import user.my.recommend.dto.UserRecommendDTO;
import user.my.recommend.service.UserRecommendService;
import user.request.dto.UserRequestDTO;

//http://localhost:8090/myapp

@Controller
public class UserRecommendController {
	
	private UserRecommendService reService;
	private UserRequestDTO rdto;
    private static final Map<String, String> CACHE = new HashMap<>();
	
	public UserRecommendController() {
		// TODO Auto-generated constructor stub
	}
	
	public void setReService(UserRecommendService reService) {
		this.reService = reService;
	}
	
	//recommend페이지
	@RequestMapping(value = "/my/recommend")
	public ModelAndView recommendView(HttpSession session, ModelAndView mav) {
		if (session.getAttribute("adminauthInfo") != null) {
			mav.setViewName("redirect:/");
			return mav;
		}
		CloseableHttpClient httpClient = HttpClients.createDefault();
		
		AuthInfo authInfo= (AuthInfo) session.getAttribute("authInfo");
		String user_keynum = (String) session.getAttribute("keynum");
		
		System.out.println("recommend 접속 keynum : "+user_keynum);
		
		//유저이름
		String userName = reService.userNameProcess(user_keynum);
		mav.addObject("userName", userName);	
		
		//마지막으로 대출한 책 isbn, 제목
		UserRecommendDTO rdto = reService.lastBookProcess(user_keynum);
		mav.addObject("lastBookTitle", rdto.getTitle());	
		
		/////////////////////////////////////////////////
		//파이썬 작업 시작
		String inputIsbn = rdto.getIsbn();
		System.out.println("user가 마지막으로 읽은 책 : "+inputIsbn);

		String result ="";
        if (CACHE.containsKey(inputIsbn)) {
        	result = CACHE.get(inputIsbn);
            System.out.println("캐시된 결과: " + result);
        } else {
            try {
                URI uri = new URI("http://localhost:5000/recommendation?isbn=" + inputIsbn);
                HttpGet httpGet = new HttpGet(uri);
                CloseableHttpResponse httpResponse = httpClient.execute(httpGet);
                String responseString = EntityUtils.toString(httpResponse.getEntity());
                System.out.println("API 결과: " + responseString);
                httpResponse.close();
                CACHE.put(inputIsbn, responseString);
                result =  responseString;
            } catch (URISyntaxException e) {
                System.err.println("잘못된 URI 구문: " + e.getMessage());
            } catch (IOException e) {
                System.err.println("I/O 오류 발생: " + e.getMessage());
            }
        }
		//////////////////////////////////
        System.out.println(result.getClass().getName());

        String[] dataArray = result.replaceAll("\\s", "")
                .replaceAll("[\\[\\]\"]", "")
                .split(",");
        
        List<BookmanageDTO> reList = new ArrayList<BookmanageDTO>();
        for (int i =0; i<=4; i++) {
        	String recommendIsbn = dataArray[i];
        	System.out.println(recommendIsbn);
        	reList.add(reService.bookInfoProcess(recommendIsbn));
        }
        System.out.println(reList.get(0));
        
        mav.addObject("recommendList", reList);	
		mav.setViewName("my/recommend");
		return mav;
	}

}
