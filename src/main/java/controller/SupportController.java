package controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
/* 고객센터, 지원의 요청과 뷰에 대한 컨트롤러
 * 
 */
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.Board;
import logic.Notice;
import logic.NoticeService;

@Controller
@RequestMapping("support")
public class SupportController {
	@Autowired
	private NoticeService noticeService;
	
	// notice 공지사항
	@RequestMapping("notice/list")
	public ModelAndView noticelist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Notice> list;
		try {
			mav.addObject("listcount", noticeService.count());
			list = noticeService.list();
			mav.addObject("noticelist", list) ;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	// '공지하기' 열기
	@RequestMapping("notice/write")
	public String notice(HttpSession session) {
		// 관리자 체크(AOP)
		return "support/notice/write";
	}
	// 'notice form' action
	@RequestMapping("notice/w")
	public ModelAndView writeNotice(@Valid Board board, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// 유효성 검사
		if (bresult.hasErrors()) {
			
			return mav;
		}
		
		
		
		return mav;
	}
}
