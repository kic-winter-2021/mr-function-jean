package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.dto.Customer;
import logic.dto.Seller;
import logic.service.CustomerService;

@Controller
@RequestMapping("customer/account")	// customer/account
public class AccountController {
	@Autowired
	CustomerService customerService;
	
	@GetMapping("*")
	public ModelAndView getCustomer() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("customer", new Customer());
		return mav;
	}
	// 개인 고객 로그인
	@PostMapping("psignin")
	public ModelAndView psignin(@Valid Customer customer, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 1. 유효성 검사 (입력했는지, 현재 있는 아이디인지)
		// 1-1 입력 검사
		if (bresult.hasErrors()) {
			System.out.println("Error is occured in personal Signin." + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		// 1-2 현재 있는 아이디 검사
		try {
			// 입력된 customer의 아이디로 DB의 사용자 정보를 가져와.
			Customer dbCustomer = customerService.select(customer.getId());
			// 없어 -> 리턴(에러 메세지 반환) bresult message 추가
			if (dbCustomer == null) {
				System.out.println(customer.getId() + "없음");
				bresult.reject("error.signin.customer"); // TODO: messages.properties
				mav.getModel().putAll(bresult.getModel());
				return mav;
			}
			// 있어 -> 비밀번호 비교.
			if (!customer.getPassword().equals(dbCustomer.getPassword())) {
				System.out.println("비번틀림");
				// 비밀번호가 다르다면
				bresult.reject("error.password.customer");
				mav.getModel().putAll(bresult.getModel());
				return mav;
			}
			// 디버그
			System.out.println(dbCustomer);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 2. 로그인 (세션에 추가)
		session.setAttribute("signinCustomer", customer);
		mav.setViewName("redirect:main");
		return mav;
	}
	// 사업자 고객 로그인
	@PostMapping("ssignin")
	public ModelAndView ssignin(@Valid Seller seller, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 1. 유효성 검사 (입력했는지, 현재 있는 아이디인지)
		if (bresult.hasErrors()) {
			System.out.println("Error is occured in seller Signin." + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		
		// 2. 로그인 (세션에 추가)
		session.setAttribute("signinSeller", seller);
		
		return mav;
	}
}
