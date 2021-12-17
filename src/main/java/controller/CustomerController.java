package controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import exception.UserException;
import logic.dto.Board;
import logic.dto.Cart;
import logic.dto.Customer;
import logic.dto.Review;
import logic.dto.Sale;
import logic.service.CustomerService;
import logic.service.SaleService;

@Controller
@RequestMapping("customer")
public class CustomerController {
	@Autowired
	CustomerService customerService;
	@Autowired
	SaleService saleService;
	
	// 세션의 유저 읽고 쓰기
	static Customer getUser (HttpSession session) { return (Customer)session.getAttribute("signinUser");}
	static void setUser (HttpSession session, Customer customer) { session.setAttribute("signinUser", customer); }

	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:account/signin";
	}
	@RequestMapping("menubar")
	public String menubar() {
		return null;
	}
	/**
	 * 마이페이지 
	 * @param session	
	 * @return
	 */
	@RequestMapping("mypage")
	public ModelAndView mypage(HttpSession session) {
		ModelAndView mav = new ModelAndView();	
		String signinId = getUser(session).getId();	//로그인 객체를 참조
		mav.addObject("cartcount", customerService.countCart(signinId));
		mav.addObject("salecount", customerService.countSale(signinId));
		return mav;
	}
	/**
	 * 정보 수정
	 * @param id
	 * @param session
	 * @return
	 */
	@GetMapping("editinfo")
	public ModelAndView editInfo(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Customer customer = customerService.selectOne(id);
		mav.addObject("customer", customer);			
		return mav;
	}
	
	@PostMapping("editinfo")
	public ModelAndView editInfo(@Valid Customer customer, BindingResult bresult, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		if(bresult.hasErrors()) {
			mav.getModel().putAll(bresult.getModel());
			return mav;
		}
		Customer signin = getUser(session);
		System.out.println(signin.getId() + " " + customer.getId());
		// 동일 아이디 체크
		if(!signin.getId().equals(customer.getId())) {
			throw new UserException("본인의 경우만 수정 가능합니다.","mypage");
		}		
		// 비밀번호 체크
		if(!signin.getPassword().equals(customer.getPassword())) {
			throw new UserException("비밀번호가 틀립니다.","mypage");
		}
		try {
			customerService.update(customer);			
			session.setAttribute("signinUser", customer);				
			mav.setViewName("redirect:mypage");
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	@RequestMapping("buyinfo")
	public ModelAndView buyInfo(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		//본인 또는 admin만 이페이지를 열 수 있게 검사
		String signinId = ((Customer)session.getAttribute("signinUser")).getId();
		if(!(id.equals(signinId) || id.equals("admin"))) {
			throw new UserException("본인의 주문목록만 열람가능합니다.","mypage");			
		}
		List<Sale> list;		
		try {
			mav.addObject("listcount", saleService.count(id));
			list = saleService.listByCustomerId(id);
			mav.addObject("salelist", list);
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return mav;
	}
	@RequestMapping("myreview")
	public ModelAndView itemreview(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String sessionid = ((Customer)session.getAttribute("signinUser")).getId();
		if(!id.equals(sessionid) && id.equals("admin")) {
			throw new UserException("본인의 상품후기만 열람가능합니다.","mypage");			
		}
		List<Review> list;
		try {
			mav.addObject("listcount", customerService.countItemReview(id));
			list = customerService.listItemReview(id);
			mav.addObject("itemreviewlist", list);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	
	@RequestMapping("myquestion")
	public ModelAndView questionlist(String id, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String sessionid = ((Customer)session.getAttribute("signinUser")).getId();
		if(!id.equals(sessionid) && id.equals("admin")) {
			throw new UserException("본인의 상품문의만 열람 가능합니다.","mypage");
		}
		List<Board> listquestion;
		try {
			mav.addObject("listcount", customerService.countItemQuestion(id));
			listquestion = customerService.listItemQuestion(id);
			mav.addObject("iqlist", listquestion);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	/* 비밀번호 변경 */
	@GetMapping("updatepassword")
	public ModelAndView updatePassword(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = null;
		try {
			id = ((Customer)session.getAttribute("signinUser")).getId();
			mav.addObject(customerService.getPasswordById(id));
		} catch (NullPointerException e) {
			System.out.println("로그인 세션 종료");
			throw new UserException("로그아웃 상태입니다", "/customer/account/signin");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mav;
	}
	@PostMapping("updatepw")
	public ModelAndView updatePassword(@RequestParam Map<String, String> req, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		String newpw = req.get("newpw");
		// 비밀번호 검사
		Customer signin = (Customer)session.getAttribute("signinUser");
		
		try {
			// 이전 비밀번호 비교 -> js로 처리
			//String oldpw = req.get("oldpw");
			customerService.updatePassword(signin.getId(), newpw);
			// 세션 갱신
			session.setAttribute("signinUser", signin);
			System.out.println(signin.getId() + " 비밀번호 변경(" + req.get("oldpw") + " -> " + newpw + ")");
		} catch (Exception e) {
			e.printStackTrace();
		}
		mav.setViewName("redirect:myinfo");
		return mav;
	}
}
