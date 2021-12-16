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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.dto.Faq;
import logic.dto.Notice;
import logic.dto.Question;
import logic.service.NoticeService;
import logic.service.QuestionService;
import logic.service.FaqService;

@Controller
@RequestMapping("support")
public class SupportController {
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private QuestionService questionService;
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
	@GetMapping("notice/write")
	public String writeNotice(HttpSession session) {
		// TODO: 관리자 체크(AOP)
		return "support/notice/write";
	}
	// 'notice form' action
	@PostMapping("notice/write")
	public ModelAndView writeNoticeForm(@Valid Notice notice, BindingResult bresult, HttpSession session) {
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

	/* 문의하기 */
	/**
	 * listQuestion 문의 목록 불러오기
	 * - 문의 내용 가져오기. DB board 중 (article)type=3 불러오기
	 */
	@RequestMapping("q/list")
	public ModelAndView listQuestion() {
		ModelAndView mav = new ModelAndView();
		
		// TODO: 문의하기 페이징
		List<Question> list;
		try {
			mav.addObject("listcount", questionService.count()); // 목적이 글 개수를 찾는 문장
			
			list = questionService.list();
			mav.addObject("questionlist", list);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return mav;
	}
	@GetMapping("q/write")
	public ModelAndView writeQuestion(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("question", new Question());
		return mav;
	}
	@PostMapping("q/write")
	public ModelAndView writeQuestionForm(@Valid Question question, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println(question);
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			questionService.write(question);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:list");
		return mav;
	}

	@RequestMapping("faq/list")
	public ModelAndView listFaq(HttpSession session) {
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
	@GetMapping("faq/write")
	public String writeFaq(HttpSession session) {
		return "support/faq/write";
	}
	// 'notice form' action
	@PostMapping("faq/write")
	public ModelAndView writeFaqForm(@Valid Faq faq, BindingResult bresult, HttpSession session) {
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