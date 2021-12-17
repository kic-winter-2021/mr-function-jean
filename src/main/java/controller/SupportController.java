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

import exception.UpdateException;
import logic.dto.Board;
import logic.dto.Customer;
import logic.service.BoardService;
import logic.service.CustomerService;

@Controller
@RequestMapping("support")
public class SupportController {
	@Autowired
	BoardService boardService;
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("faq/list")
	public ModelAndView listFaq(String category) {
		ModelAndView mav = new ModelAndView();
		List<Board> list;
		if (category == null || category.trim().equals("")) category = null;
		try {
			mav.addObject("listcount", boardService.count(Board.FAQ, category));
			list = boardService.list(Board.FAQ, category);
			mav.addObject("faqlist", list) ;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	@GetMapping({"faq/write", "notice/write"})
	public ModelAndView writeAdmin(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", new Board());
		return mav;
	}
	// 'notice form' action
	@PostMapping("faq/write")
	public ModelAndView writeFaqForm(@Valid Board board, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// 유효성 검사
		if (bresult.hasErrors()) {
			System.out.println("Binding error is occured in faqForm." + mav.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			boardService.insert(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:list");
		return mav;
	}
	@GetMapping({"faq/detail","faq/update"})
	public ModelAndView faqdetail(Integer num ,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Board dbboard = boardService.detail(num);
		mav.addObject("board", dbboard);
		return mav;
		
	}
	@PostMapping("faq/update")
	public ModelAndView faqdetail(@Valid Board board,BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		if(!board.getCustomerid().equals("admin")) { //signin.getId()
			throw new UpdateException("수정은 관리자만 가능합니다","list");
		}
		
		try {
			boardService.updatefaq(board);
			System.out.println(board);
			mav.setViewName("redirect:list");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	@RequestMapping("faq/delete")
	public ModelAndView delete(Integer num,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		try {
			boardService.delete(num);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:list");
		return mav;
	}
	// notice 공지사항
	@RequestMapping("notice/list")
	public ModelAndView listNotice(Integer pageNum, String category, String searchtype, String searchcontent) {
		ModelAndView mav = new ModelAndView();
		List<Board> list = null;
		// 페이징
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		if (category == null || category.trim().equals("")) category = null;
		if (searchtype == null || searchcontent == null || searchtype.trim().equals("") || searchcontent.trim().equals("")) {
			searchtype = null;
			searchcontent = null;
		}
		int limit = Board.PAGESIZE;	// 10 한 페이지에 보여질 게시물의 건수
		int listcount = boardService.count(Board.NOTICE, category, searchtype, searchcontent); // 전체 게시물 등록 건수
		System.out.println(" 공지사항| 글 수: " + listcount);
		try {
			list = boardService.list(Board.NOTICE, pageNum, limit, category, searchtype, searchcontent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		int maxpage = (int)((double)listcount/limit + 0.95); // 최대 필요한 페이지 수
		int startpage = (int)((pageNum/10.0 + 0.9) - 1 ) * 10 + 1; // 화면에 표시할 페이지의 시작번호
		int endpage = startpage + 9;
		if (endpage > maxpage) endpage = maxpage; // 화면에 표시할 페이지의 끝번호
		
		int boardno = listcount - (pageNum - 1 ) * limit; // 화면에 표시될 게시물 번호. 의미 없음		
		
		// 모델 추가
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("noticelist", list);
		mav.addObject("boardno", boardno);
		
		return mav;
	}
	// 'notice form' action
	@PostMapping("notice/write")
	public ModelAndView writeNoticeForm(@Valid Board board, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// 유효성 검사
		if (bresult.hasErrors()) {
			System.out.println("Binding error is occured in noticeForm." + mav.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			boardService.insert(board);
			System.out.println(board);
		} catch (Exception e) {
			e.printStackTrace();
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
	public ModelAndView listQuestion(Integer pageNum, String category, String searchtype, String searchcontent) {
		ModelAndView mav = new ModelAndView();
		List<Board> list = null;
		// 페이징
		if (pageNum == null || pageNum.toString().equals("")) {
			pageNum = 1;
		}
		if (category == null || category.trim().equals("")) category = null;
		if (searchtype == null || searchcontent == null || searchtype.trim().equals("") || searchcontent.trim().equals("")) {
			searchtype = null;
			searchcontent = null;
		}
		int limit = Board.PAGESIZE;	// 10 한 페이지에 보여질 게시물의 건수
		int listcount = boardService.count(Board.QUESTION, category, searchtype, searchcontent); // 전체 게시물 등록 건수
		System.out.println(" 문의하기| 글 수: " + listcount);
		try {
			list = boardService.list(Board.QUESTION, pageNum, limit, category, searchtype, searchcontent);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int maxpage = (int)((double)listcount/limit + 0.95); // 최대 필요한 페이지 수
		int startpage = (int)((pageNum/10.0 + 0.9) - 1 ) * 10 + 1; // 화면에 표시할 페이지의 시작번호
		int endpage = startpage + 9;
		if (endpage > maxpage) endpage = maxpage; // 화면에 표시할 페이지의 끝번호
		
		int boardno = listcount - (pageNum - 1 ) * limit; // 화면에 표시될 게시물 번호. 의미 없음		
		
		// 모델 추가
		mav.addObject("pageNum", pageNum);
		mav.addObject("maxpage", maxpage);
		mav.addObject("startpage", startpage);
		mav.addObject("endpage", endpage);
		mav.addObject("listcount", listcount);
		mav.addObject("questionlist", list);
		mav.addObject("boardno", boardno);
		
		return mav;
	}
	@GetMapping("q/write")
	public ModelAndView writeQuestion(HttpSession session) { // 회원만 작성 가능
		ModelAndView mav = new ModelAndView();
		mav.addObject("board", new Board());
		return mav;
	}
	@PostMapping("q/write")
	public ModelAndView writeQuestionForm(@Valid Board board, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		System.out.println(board);
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			boardService.insert(board);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:list");
		return mav;
	}
}