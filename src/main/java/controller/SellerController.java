package controller;

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
	ItemService itemservice;
	
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
			itemservice.add(item);
		}catch(Exception e){
			e.printStackTrace();
		}
		mav.setViewName("redirect:registl");
		return mav;
	}
	@RequestMapping("saledetail")
	public ModelAndView saledetail(@Valid Item item,BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		try {
			Item dbItem = itemservice.detail(item.getItemid());
			
			if (bresult.hasErrors()) {
				System.out.println("없음" + bresult.getModel());
				mav.getModel().putAll(bresult.getModel());
				return mav;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		mav.addObject("item",item);
		return mav;
	}
}
