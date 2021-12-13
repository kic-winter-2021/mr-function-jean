package controller;

import java.util.List;

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
		mav.setViewName("redirect:registl");
		return mav;
	}
	//seller/saledetail?itemid=1234
	//리스트 페이지 선택 -> 상세정보
	//
	
	@RequestMapping("saledetail")
	public ModelAndView saledetail(String itemid,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Item dbitem = null;
		try {
			dbitem = itemService.detail(itemid);
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.addObject("item",dbitem);
		return mav;
	}
	//registlist 구현
	@RequestMapping("registl")
	public ModelAndView registl(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		List<Item> list;
		try{
			mav.addObject("listcount", itemService.count());
			list = itemService.list();
			mav.addObject("registl",list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
}
