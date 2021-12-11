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
import logic.dto.Faq;
import logic.service.FaqService;

@Controller
@RequestMapping("support")
public class SupportController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private FaqService faqService; 
	
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
		// TODO: 관리자 체크(AOP)
		return "support/notice/write";
	}
	// 'notice form' action
	@RequestMapping("notice/w")
	public ModelAndView writeNotice(@Valid Notice notice, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// 유효성 검사
		if (bresult.hasErrors()) {
			System.out.println("Binding error is occured in noticeForm." + mav.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			noticeService.write(notice);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: Exception page 추가 + Handler 추가
			//throw new BoardException("공지사항 등록에 실패하였습니다.", "write");
		}
		
		mav.setViewName("redirect:list");
		return mav;
	}
	@RequestMapping("faq/list")
	public ModelAndView faqlist(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Faq> list;
		try {
			mav.addObject("listcount", faqService.count());
			list = faqService.list();
			mav.addObject("faqlist", list) ;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	@RequestMapping("faq/write")
	public String faq(HttpSession session) {
		// TODO: 관리자 체크(AOP)
		return "support/faq/write";
	}
	// 'notice form' action
	@RequestMapping("faq/w")
	public ModelAndView writefaq(@Valid Faq faq, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// 유효성 검사
		if (bresult.hasErrors()) {
			System.out.println("Binding error is occured in faqForm." + mav.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			faqService.write(faq);
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: Exception page 추가 + Handler 추가
			//throw new BoardException("공지사항 등록에 실패하였습니다.", "write");
		}
		mav.setViewName("redirect:list");
		return mav;
		
}

}