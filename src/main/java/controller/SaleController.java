package controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import logic.dto.Cart;
import logic.dto.Customer;
import logic.service.CustomerService;
import logic.service.SaleService;

@Controller
@RequestMapping("sale")
public class SaleController {
	@Autowired
	CustomerService customerService;
	@Autowired
	SaleService saleService;
	/*
	 * 로그인된 사용자의 장바구니 목록 보기
	 */
	@RequestMapping("cart")
	public ModelAndView cart(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		
		Customer signin = (Customer)session.getAttribute("signinUser");
		Cart cart = null;
		// 비회원 처리
		if (signin == null) {
			// session cart
			cart = (Cart)session.getAttribute("cart");
			mav.addObject("cart", cart);
			return mav;
		}
		// session id로 cart 조회
		try {
			mav.addObject("cartcount", customerService.countCart(signin.getId()));
			cart = customerService.getCart(signin.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 세션과 모델에 카트 추가.
		signin.setCart(cart);
		mav.addObject("cart", cart);
		
		return mav;
	}
	@RequestMapping("nonUserCart")
	public String nonUserCart() {
		return "sale/nonUserCart";
	}
}