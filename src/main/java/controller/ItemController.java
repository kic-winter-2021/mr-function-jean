package controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.SigninException;
import logic.dto.Board;
import logic.dto.Customer;
import logic.dto.Review;
import logic.service.BoardService;
import logic.service.ItemQuestionService;
import logic.service.ItemReviewService;
import logic.service.ItemService;

// /WEB-INF/view/item/detail.jsp
// 요청 ~ 페이지 또는 뷰
// item/detail 이름의 뷰에만 접근
@Controller
@RequestMapping("item")
public class ItemController {
	@Autowired
	ItemService itemService;
	@Autowired
	ItemReviewService itemReviewService;
	@Autowired
	ItemQuestionService itemQuestionService;
	
	// localhost:8090/
	// 도메인 + 요청 => URL
	// localhost:8090/a/b -> /WEB-INF/view/item/detail.jsp
	@RequestMapping("detail")
	public String detail() {
		
		return "item/detail";	// 뷰, 페이지 /WEB-INF/view/item/detail.jsp
	}	

	@RequestMapping("itemreview")
	public ModelAndView itemreview(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String sessionid = ((Customer)session.getAttribute("signinCustomer")).getId();
		if(!id.equals(sessionid) && id.equals("admin")) {
			throw new SigninException("본인의 상품후기만 열람가능합니다.","usermypage");			
		}
		List<Review> list;
		try {
			mav.addObject("itemreviewcount", itemReviewService.count(id));
			list = itemReviewService.itemreviewlist(id);
			mav.addObject("itemreviewlist", list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping("questionlist")
	public ModelAndView questionlist(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String sessionid = ((Customer)session.getAttribute("signinCustomer")).getId();
		if(!id.equals(sessionid) && id.equals("admin")) {
			throw new SigninException("본인의 상품문의만 열람 가능합니다.","usermypage");
		}
		List<Board> listquestion;
		try {
			mav.addObject("questioncount", itemQuestionService.questioncount(id));
			listquestion = itemQuestionService.listquestion(id);
			mav.addObject("listquestion", listquestion);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
}

