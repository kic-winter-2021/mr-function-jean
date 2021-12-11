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
	@RequestMapping("*")
	public ModelAndView Reister(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
	@RequestMapping("seller/register")
	public ModelAndView register(@Valid Regist regist,BindingResult bresult,HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		if(bresult.hasErrors()) {
			System.out.println("상품을 등록해주세요" + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		try {
			itemservice.add(regist);
		}catch(Exception e){
			e.printStackTrace();
		}
		session.setAttribute("registerRegist", regist);
		mav.setViewName("redirect:main");
		return mav;
	}
}
