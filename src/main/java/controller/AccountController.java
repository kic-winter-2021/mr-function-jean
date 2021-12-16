package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.UserException;
import logic.dto.Customer;
import logic.service.CustomerService;
import logic.service.SellerService;

@Controller
@RequestMapping("customer/account")	// customer/account
public class AccountController {
	@Autowired
	CustomerService customerService;
	@Autowired
	SellerService sellerService;
	
	@GetMapping("*")
	public ModelAndView getCustomer() {
		ModelAndView mav = new ModelAndView();
		mav.addObject("customer", new Customer());
		return mav;
	}
	@GetMapping("signin")
	public ModelAndView signinLoader(String t) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("customer", new Customer());
		if (t != "" && t != null) mav.addObject("type", t);
		return mav;
	}
	// 로그인
	@PostMapping("signin")
	public ModelAndView signin(@Valid Customer customer, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		// 1. 유효성 검사 (입력했는지, 현재 있는 아이디인지)
		// 1-1 입력 검사
		if (bresult.hasErrors()) {
			System.err.println("SIGNIN ERROR" + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		
		// 1-2 현재 있는 아이디 검사
		Customer dbCustomer = customerService.selectOne(customer.getId());
		if (dbCustomer == null ||										// 현재 입력한 아이디와 동일한 계정이 없는 경우
			!customer.getPassword().equals(dbCustomer.getPassword())) { // 비밀번호가 틀린 경우
			bresult.reject("error.input.signin");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}		
		// 타입 검사
		if (customer.isSeller() != dbCustomer.isSeller()) { // 입력 타입 오류
			if (dbCustomer.isSeller()) throw new UserException("사업자 회원은 사업자 탭에서 로그인을 진행해주세요", "signin?type=s");
			else throw new UserException("일반 회원은 기본 탭에서 로그인을 진행해주세요", "signin?type=p");
		}
		session.setAttribute("signinUser", dbCustomer);	
		System.out.println(dbCustomer);
		if (customer.isSeller()) mav.setViewName("redirect:/seller/main");
		else mav.setViewName("redirect:/main.jsp");
		return mav;
	}
	@RequestMapping("agree")
	public ModelAndView agree(String t, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 모델에 type값 넣어주기
		mav.addObject("type", t);
		return mav;
	}
	@GetMapping("psignup")
	public ModelAndView getCustomer(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 세션은 로그인 여부만 확인
		mav.addObject("customer", new Customer());
		
		return mav;
	}
	@PostMapping("psignup")
	public ModelAndView psignup(@Valid Customer customer, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 유효성 검사
		if (bresult.hasErrors()) {
			for (ObjectError e : bresult.getGlobalErrors()) {
				System.out.println(e);
			}
			System.out.println("회원가입 실패" + bresult.getModel());
			bresult.reject("error.input.customer");
			mav.getModel().putAll(bresult.getModel());
			return mav; 
		}
		// 값을 DB에 insert
		try {
			customerService.signup(customer);
			System.out.println(customer); // 디버깅용
		} catch (DataIntegrityViolationException e) { // DB 무결성 오류
			e.printStackTrace();
			bresult.reject("error.duplicate.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		// TODO: 이메일로 인증 메일을 보냈습니다.(뷰랑 컨트롤러 만들기)
		mav.setViewName("redirect:signin?t=p");
		return mav;
	}
	// TODO: 동일한 아이디 있는지 검사 -> 다른 데에서 처리...아이디 중복 검사
	// TODO: 비밀번호 확인은 -> 페이지에서 JS로 확인.
	@GetMapping("ssignup")
	public ModelAndView getSeller(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 세션은 로그인 여부만 확인
		mav.addObject("customer", new Customer());
		mav.addObject("sellertypes", Customer.SELLERTYPE);
		return mav;
	}
	@PostMapping("ssignup")
	public ModelAndView ssignup(@Valid Customer customer, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		// 유효성 검사
		if (bresult.hasErrors()) {
			System.out.println("회원 로그인 실패" + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav; 
		}
		// 값을 DB에 insert
		try {
			customerService.signup(customer);
			System.out.println(customer); // 디버깅용
		} catch (DataIntegrityViolationException e) { // DB 무결성 오류
			e.printStackTrace();
			bresult.reject("error.duplicate.user");
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		// TODO: 이메일로 인증 메일을 보냈습니다.(뷰랑 컨트롤러 만들기)
		mav.setViewName("redirect:signin?t=s");
		return mav;
	}
	// TODO: 가입이 성공적으로 처리되었습니다.
	
	
	

	@GetMapping("search")
	public ModelAndView searchLoader(String u) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("customer", new Customer());
		mav.addObject("url", u);
		return mav;
	}
	@PostMapping("{url}search")
	public ModelAndView search(Customer customer, BindingResult bresult, @PathVariable String url) {
		ModelAndView mav = new ModelAndView();
		String code = "";
		String title = "";
		
		if (url.equals("id")) {
			code = "error.userid.search";
			title = "아이디";
		} else if (url.equals("pw")) {
			code = "error.password.search";
			title = "비밀번호";
			// 아이디 유효성 검사
			if(customer.getId() == null || customer.getId().equals("")) {
				bresult.rejectValue("id","error.required");
			}
		}
		
		// 유효성 검사
		if (customer.getEmail() == null || customer.getEmail().equals("")) bresult.rejectValue("email","error.required");
		if (customer.getPhoneno() == null || customer.getPhoneno().equals("")) bresult.rejectValue("phoneno", "error.required");
		if (bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		
		String result = customerService.getSearch(customer, url);
		if (result == null) {
			bresult.reject(code);
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		mav.addObject("result", result);
		mav.addObject("title", title);
		mav.setViewName("/customer/account/search2");
		return mav;
	}
}