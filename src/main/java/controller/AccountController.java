package controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import exception.SigninException;
import logic.dto.Customer;
import logic.dto.Seller;
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
		mav.addObject("seller", new Seller());
		if (t != "" && t != null) mav.addObject("type", t);
		return mav;
	}
	// 개인 고객 로그인
	@PostMapping("psignin")
	public ModelAndView psignin(@Valid Customer customer, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:signin");
		
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
				bresult.reject("error.input.signin"); // TODO: messages.properties
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
			customer = dbCustomer;
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 타입 검사
		if (customer.getType() == 3 || customer.getType() == 4) {
			throw new SigninException("사업자 회원은 사업자 탭에서 로그인을 진행해주세요", "signin?type=s");
		}
		// 2. 로그인 (세션에 추가)
		session.setAttribute("signinCustomer", customer);
		// 디버그
		System.out.println(customer);
		mav.setViewName("redirect:/main.jsp");
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
			bresult.reject("error.input.signin");
			return mav;
		}
		
		// 2. 로그인 (세션에 추가)
		Seller dbSeller = sellerService.select(seller.getId());
		session.setAttribute("signinSeller", dbSeller);	
		mav.setViewName("redirect:/seller/main");
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
		mav.addObject("customer", new Seller());
		
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
			System.out.println("회원 로그인 실패" + bresult.getModel());
			bresult.reject("error.input.user");
			mav.getModel().putAll(bresult.getModel());
			return mav; 
		}
		// 값을 DB에 insert
		try {
			customerService.signup(customer);
			System.out.println(customer); // 디버깅용
		} catch (Exception e) {
			e.printStackTrace();
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
		mav.addObject("seller", new Seller());
		mav.setViewName("/customer/account/companysignup");
		return mav;
	}
	@PostMapping("ssignup")
	public ModelAndView psignup(@Valid Seller seller, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView("/customer/account/companysignup");
		// 유효성 검사
		if (bresult.hasErrors()) {
			System.out.println("회원 로그인 실패" + bresult.getModel());
			mav.getModel().putAll(bresult.getModel());
			return mav; 
		}
		// 값을 DB에 insert
		try {
			sellerService.signup(seller);
			System.out.println(seller); // 디버깅용
		} catch (Exception e) {
			e.printStackTrace();
		}
		// TODO: 이메일로 인증 메일을 보냈습니다.(뷰랑 컨트롤러 만들기)
		mav.setViewName("redirect:signin?t=s");
		return mav;
	}
	// TODO: 가입이 성공적으로 처리되었습니다.
	
	
	@RequestMapping("usermypage")
	public ModelAndView usermapage(HttpSession session) {
		ModelAndView mav = new ModelAndView();	
		// 세션 로그인이 되어있는 경우(AOP)
		Customer signin = (Customer)session.getAttribute("signin");	//로그인 객체를 참조
		String id = signin.getId();
			
		
	    //TODO: 원래는 session을 사용하지만 AOP로 뺄거니 여기에는 안쓴다.
		mav.addObject("cartcount",customerService.cartcount(id));
		mav.addObject("salecount", customerService.salecount(id));
		
		return mav;
	}
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
