package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.UpdateException;
import logic.dto.Customer;
import logic.dto.Item;
import logic.dto.Regist;
import logic.dto.Seller;
import logic.service.ItemService;
import logic.service.SellerService;

@Controller
@RequestMapping("seller")
public class SellerController {
	@Autowired
	SellerService sellerService;
	@Autowired
	ItemService itemService;
	
	@GetMapping("*")
	public ModelAndView info(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject(new Seller());
		return mav;
	}
	
	// TODO: 사용자 정보 변경
	@PostMapping("updateForm")
	public ModelAndView updateForm(@Valid Seller seller, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// TODO: seller AOP
		// 1) 유효성 검사
		if (bresult.hasErrors()) {
			System.out.println("Errors in updateForm" + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		// 2) 세션 정보로 DB 불러오기
		
		return mav;
	}
	// TODO: 물품 등록 열기
	@GetMapping("register")
	public ModelAndView register(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("item", new Item()); // 문자열 (키값/벨류값)
		return mav;
	}
	
	@PostMapping("register")// 동일한 요청이 있을시에 POST / GET / 나뉘어서 받음
	public ModelAndView registerForm(@Valid Item item,BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(bresult.hasErrors()) {
			System.out.println("상품을 등록해주세요" + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			itemService.add(item);
		}catch(Exception e){
			e.printStackTrace();
		}
		mav.setViewName("redirect:registl?id=" + "admin");
		return mav;
	}
	//seller/saledetail?itemid=1234
	//리스트 페이지 선택 -> 상세정보
	//
	
	@GetMapping({"saledetail","detailupdate"})
	public ModelAndView saledetail(String itemid,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Item dbitem = itemService.detail(itemid);
		mav.addObject("item",dbitem);
		return mav;
	}
	//등록 상품 내용 수정하기 21.12.13
	@PostMapping("detailupdate")
	public ModelAndView detailupdate(@Valid Item item,BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		
		if(!item.equals(item)) {
			throw new UpdateException("같은 사용자가 아닙니다.","detailupdate?itemid="+itemid);
		}
		try {
			
			mav.setViewName("redirect:saledetail?itemid="+itemid);
		}catch(Exception e) {
			e.printStackTrace();
			throw new UpdateException("게시글 수정을 실패 했습니다.","detailupdate?itemid="+itemid);
		}
		
		return mav;
	}
	//registlist 구현
	/*
	 * 판매자 아이디에 대해서 등록한 상품 보기
	 * 필요한 입력 :sellerid
	 * 그럼 어디서? 1. GET요청의 파라미터
	 * 			2. 어차피 seller로 로그인 되어있으므로 session의 아이디를 받는다.
	 * 컨트롤러의 매개변수로 id를 받아야해 
	 * 컨트롤러에서 세션에 접근해서 사용자의 정보만 불러와
	 * 요청? paramkey=paramvalue 
	 * @RequestPara("paramkey")
	 */
	@GetMapping("registl")
	public ModelAndView registl(String id,HttpSession session) {
		ModelAndView mav = new ModelAndView();
	
		List<Item> list;
		try{
			mav.addObject("listcount", itemService.count(id));
			list = itemService.list(id);
			mav.addObject("registl",list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	
}
